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
    m_firstMove = true;
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

    if(!m_firstMove && (m_lastOpen == index || m_solvedList.contains(index))) {
        // invalid selection
        // TODO: control UI
        return;
    }

    if(m_firstMove) m_firstMove = false;

    setMoves(m_moves + 1);
    // TODO: update move count in UI

    if(m_lastOpen == -1) {
        // first of pair
        m_lastOpen = index;
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

int MainWindow::moves() const
{
    return m_moves;
}

void MainWindow::setMoves(int moves)
{
    if(moves == m_moves) return;

    m_moves = moves; emit movesChanged();
}
