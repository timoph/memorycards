#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QDeclarativeView>

class ImageProvider;

class MainWindow : public QDeclarativeView
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = 0);

public slots:
    void click(int index);

signals:

public slots:

private:
    ImageProvider *p_imageProvider;

};

#endif // MAINWINDOW_H
