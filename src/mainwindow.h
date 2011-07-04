#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QDeclarativeView>

class ImageProvider;

class MainWindow : public QDeclarativeView
{
    Q_OBJECT
    Q_PROPERTY(int moves READ moves WRITE setMoves NOTIFY movesChanged);

public:
    explicit MainWindow(QWidget *parent = 0);
    int moves() const;
    void setMoves(int moves);


public slots:
    void click(int index);

signals:
    void movesChanged();

private:
    ImageProvider *p_imageProvider;
    QList<int> m_solvedList;
    int m_lastOpen;
    int m_moves;
    bool m_firstMove;

};

#endif // MAINWINDOW_H
