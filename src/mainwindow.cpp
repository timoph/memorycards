#include "mainwindow.h"
#include "imageprovider.h"

#include <QApplication>
#include <QDeclarativeEngine>
#include <QDeclarativeContext>

#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QDeclarativeView(parent)
{
    setResizeMode(SizeRootObjectToView);

    p_imageProvider = new ImageProvider;
    engine()->addImageProvider("pics", p_imageProvider);

    setSource(QUrl("qrc:/MainView.qml"));

    rootContext()->setContextProperty("gameView", this);
    connect(engine(), SIGNAL(quit()), qApp, SLOT(quit()));
}

void MainWindow::click(int index)
{
    qDebug() << QString::number(index);
    // TODO: increase click count, check if card accepts click
    // TODO: make the card flip
    // TODO: did a pair open?
    // TODO: did the player win the game
}
