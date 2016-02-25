#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#ifdef QT5BUILD
#include <QQuickView>
#else
#include <QDeclarativeView>
#endif

class ImageProvider;

#ifdef QT5BUILD
class MainWindow : public QQuickView
#else
class MainWindow : public QDeclarativeView
#endif
{
    Q_OBJECT
    Q_PROPERTY(int moves READ moves WRITE setMoves NOTIFY movesChanged);

public:
#ifdef QT5BUILD
    explicit MainWindow(QWindow *parent = 0);
#else
	explicit MainWindow(QWidget *parent = 0);
#endif
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
