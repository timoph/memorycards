#ifndef GAMEENGINE_H
#define GAMEENGINE_H

#include <QObject>
#include <QColor>

class GameEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int cardCount READ cardCount)
    Q_PROPERTY(int moves READ moves WRITE setMoves NOTIFY movesChanged)
    Q_PROPERTY(bool waiting READ waiting NOTIFY waitingChanged)

public:
    static GameEngine *instance();
    virtual ~GameEngine();
    int cardCount() const;
    int moves() const;
    void setMoves(int moves);
    bool waiting() const;

signals:
    void movesChanged();
    void unflipCard(int cardIndex);
    void waitingChanged(bool isWaiting);
    void newGame();
    void gameWon();

public slots:
    Q_INVOKABLE void setupGameboard();
    void click(int index);

    void unflipCardsWithDelay();

    QList<QString> cardList() const;

private:
    explicit GameEngine(QObject *parent = nullptr);

    int m_cardCount;
    int m_moves;

    static GameEngine *m_instance;

    QList<QString> m_cardList;
    QList<QPair<int,int>> m_pairList;

    QList<int> m_solvedList;
    int m_lastOpen;
    int m_open;
    bool m_firstMove;
    bool m_waiting;
};

#endif // GAMEENGINE_H
