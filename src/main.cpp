#include <QApplication>
#include <QDateTime>
#include "mainwindow.h"
#include "gameengine.h"

int main(int argc, char *argv[])
{
	QApplication app(argc,argv);
    qsrand(QDateTime::currentDateTime().toSecsSinceEpoch());

    GameEngine::instance()->setupGameboard();

    MainWindow mw;
    mw.show();

	return app.exec();
}
