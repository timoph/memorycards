#include <QGuiApplication>
#include <QDateTime>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "imageprovider.h"
#include "gameengine.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc,argv);
    qsrand(QDateTime::currentDateTime().toSecsSinceEpoch());

    GameEngine::instance()->setupGameboard();

    QQmlApplicationEngine *view = new QQmlApplicationEngine(GameEngine::instance());

    QScopedPointer<ImageProvider> imageProvider(new ImageProvider);
    view->addImageProvider("pics", imageProvider.data());
    view->rootContext()->setContextProperty("engine", GameEngine::instance());

    view->load(QUrl("qrc:/MainView.qml"));

    return app.exec();
}
