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

public:
#ifdef QT5BUILD
    explicit MainWindow(QWindow *parent = 0);
#else
	explicit MainWindow(QWidget *parent = 0);
#endif


public slots:
    void resetGame();

private:
    ImageProvider *p_imageProvider;

};

#endif // MAINWINDOW_H
