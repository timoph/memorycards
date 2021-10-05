#include <QGuiApplication>
#include <QDateTime>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "imageprovider.h"
#include "gameengine.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc,argv);
    app.setOrganizationName("timoph");
    app.setOrganizationDomain("timoph.fi");
    app.setApplicationName("MemoryCards");
    qsrand(QDateTime::currentDateTime().toSecsSinceEpoch());

    //GameEngine::instance()->setupGameboard();

    QQmlApplicationEngine engine;

    QScopedPointer<ImageProvider> imageProvider(new ImageProvider);
    engine.addImageProvider("pics", imageProvider.data());
    engine.rootContext()->setContextProperty("engine", GameEngine::instance());

    engine.load(QUrl("qrc:/qml/MainView.qml"));

    return app.exec();
}
