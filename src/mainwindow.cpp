#include "mainwindow.h"
#include "imageprovider.h"

#include <QApplication>
#include <QDeclarativeEngine>
#include <QDeclarativeContext>

#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QDeclarativeView(parent)
{
    m_lastOpen = -1;
    m_moves = 0;
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

    if(m_lastOpen != index || m_solvedList.contains(index)) {
        // invalid selection
        // TODO: control UI
    }

    m_moves++;
    // TODO: update move count in UI

    if(m_lastOpen == -1) {
        // first of pair
        // TODO: control UI
    }
    else {
        // one already open
        if(p_imageProvider->cardColors().at(index) == p_imageProvider->cardColors().at(m_lastOpen)) {
            m_solvedList.append(index);
            m_solvedList.append(m_lastOpen);

            if(m_solvedList.count() == 32) {
                //game won
            }

            m_lastOpen = -1;

            // TODO: control UI
        }
        else {
            m_lastOpen = -1;

            // TODO: control UI
        }
    }
}
