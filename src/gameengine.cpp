#include "gameengine.h"

#include <QColor>
#include <QTimer>

#include <QDebug>

GameEngine *GameEngine::m_instance = 0;

GameEngine *GameEngine::instance()
{
    if(!m_instance) {
        m_instance = new GameEngine;
    }

    return m_instance;
}

GameEngine::~GameEngine()
{

}

GameEngine::GameEngine(QObject *parent) : QObject(parent)
{
    m_lastOpen = -1;
    m_open = -1;
    m_moves = 0;
    m_firstMove = true;
    m_cardCount = 16;
    m_waiting = false;
    m_cardCount = 0;

    setupGameboard();
}

int GameEngine::cardCount() const
{
    return m_cardCount;
}

int GameEngine::moves() const
{
    return m_moves;
}

void GameEngine::setMoves(int moves)
{
    if(moves == m_moves) return;

    m_moves = moves;
    emit movesChanged();
}

bool GameEngine::waiting() const
{
    return m_waiting;
}

void GameEngine::setupGameboard()
{
    setMoves(0);
    m_solvedList.clear();
    m_waiting = false;

    QList<QString> colorPool;
    colorPool.append("red");
    colorPool.append("green");
    colorPool.append("blue");
    colorPool.append("yellow");
    colorPool.append("black");
    colorPool.append("magenta");
    colorPool.append("purple");
    colorPool.append("pink");

    m_cardCount = colorPool.count() * 2;

    if(!m_pairList.isEmpty()) {
        m_pairList.clear();
    }

    QList<int> indexes;
    for(int i= 0; i < m_cardCount; i++) {
        indexes.append(i);
    }

    int a, b;
    while(indexes.count() > 0) {
        a = indexes.takeAt(qrand() % indexes.count());
        b = indexes.takeAt(qrand() % indexes.count());

        m_pairList.append(QPair<int,int>(a, b));
    }

    for(int i = 0; i < 32; i++) {
        m_cardList.append(QString());
    }

    // fill in pairs
    int count = colorPool.count();

    for(int i = 0; i < count; i++) {
        QString col = colorPool.takeAt(qrand() % colorPool.count());
        m_cardList[m_pairList.at(i).first] = col;
        m_cardList[m_pairList.at(i).second]= col;
    }

    emit waitingChanged(m_waiting);
    QTimer::singleShot(0, this, SIGNAL(newGame()));
}

void GameEngine::click(int index)
{
    if(m_waiting) {
        return;
    }

    if(!m_firstMove && (m_lastOpen == index || m_solvedList.contains(index))) {
        // invalid selection
        return;
    }

    if(m_firstMove) m_firstMove = false;

    if(m_lastOpen == -1) {
        // first of pair
        m_lastOpen = index;
    }
    else {
        // one already opened
        setMoves(m_moves + 1);

        if(m_cardList.at(index) == m_cardList.at(m_lastOpen)) {
            m_solvedList.append(index);
            m_solvedList.append(m_lastOpen);

            if(m_solvedList.count() == m_cardCount) {
                //game won
                qDebug() << "Game won";
                emit gameWon();
            }

            m_lastOpen = -1;
        }
        else {
            m_open = index;
            m_waiting = true;
            emit waitingChanged(m_waiting);
            QTimer::singleShot(1000, this, SLOT(unflipCardsWithDelay()));
        }
    }
}

void GameEngine::unflipCardsWithDelay()
{
    emit unflipCard(m_lastOpen);
    emit unflipCard(m_open);
    m_lastOpen = -1;
    m_open = -1;
    m_waiting = false;
    emit waitingChanged(m_waiting);
}

QList<QString> GameEngine::cardList() const
{
    return m_cardList;
}
