/*
 Memory cards - a simple pick pair of cards memory game
 Copyright (C) 2021 Timo Härkönen

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

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
    Q_PROPERTY(bool usePictures READ usePictures WRITE setUsePictures NOTIFY usePicturesChanged)

public:
    static GameEngine *instance();
    virtual ~GameEngine();
    int cardCount() const;
    int moves() const;
    void setMoves(int moves);
    bool waiting() const;
    bool gameReady() const;
    bool usePictures() const;

signals:
    void movesChanged();
    void unflipCard(int cardIndex);
    void waitingChanged(bool isWaiting);
    void newGame();
    void gameWon();
    void gameReadyChanged();
    void usePicturesChanged();

public slots:
    Q_INVOKABLE void setupGameboard();
    void click(int index);
    void setGameReady(bool isReady);
    void setUsePictures(bool usePics);
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
    bool m_usePictures;
};

#endif // GAMEENGINE_H
