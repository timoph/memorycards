#include "mainwindow.h"
#include "imageprovider.h"
#include "gameengine.h"

#include <QApplication>

#ifdef QT5BUILD
#include <QQmlEngine>
#include <QQmlContext>
#else
#include <QDeclarativeEngine>
#include <QDeclarativeContext>
#endif

#include <QDebug>

#ifdef QT5BUILD
MainWindow::MainWindow(QWindow *parent) :
    QQuickView(parent)
#else
MainWindow::MainWindow(QWidget *parent) :
    QDeclarativeView(parent)
#endif
{
    setResizeMode(SizeRootObjectToView);

    p_imageProvider = new ImageProvider;
    engine()->addImageProvider("pics", p_imageProvider);
    rootContext()->setContextProperty("engine", GameEngine::instance());

    setSource(QUrl("qrc:/MainView.qml"));

    connect(engine(), SIGNAL(quit()), qApp, SLOT(quit()));
    connect(GameEngine::instance(), SIGNAL(newGame()), this, SLOT(resetGame()));
}

void MainWindow::resetGame()
{
    setSource(QUrl());
    engine()->clearComponentCache();
    setSource(QUrl("qrc:/MainView.qml"));
}

