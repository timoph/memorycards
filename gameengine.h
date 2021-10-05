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
    Q_PROPERTY(bool gameReady READ gameReady WRITE setGameReady NOTIFY gameReadyChanged)

public:
    static GameEngine *instance();
    virtual ~GameEngine();
    int cardCount() const;
    int moves() const;
    void setMoves(int moves);
    bool waiting() const;
    bool gameReady() const;

signals:
    void movesChanged();
    void unflipCard(int cardIndex);
    void waitingChanged(bool isWaiting);
    void newGame();
    void gameWon();
    void gameReadyChanged();

public slots:
    Q_INVOKABLE void setupGameboard();
    void click(int index);
    void setGameReady(bool isReady);
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

    bool m_gameReady;
};

#endif // GAMEENGINE_H
