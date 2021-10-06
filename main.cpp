#include <QGuiApplication>
#include <QDateTime>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#if QT_VERSION_MAJOR == 6
#include <QQuickStyle>
#endif

#include "imageprovider.h"
#include "gameengine.h"

int main(int argc, char *argv[])
{
#if QT_VERSION_MAJOR == 6
    QQuickStyle::setStyle("Basic");
#else
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc,argv);
    app.setOrganizationName("timoph");
    app.setOrganizationDomain("timoph.fi");
    app.setApplicationName("MemoryCards");
    qsrand(QDateTime::currentDateTime().toSecsSinceEpoch());

    QQmlApplicationEngine engine;

    ImageProvider *imageProvider = new ImageProvider;
    engine.addImageProvider("pics", imageProvider);
    engine.rootContext()->setContextProperty("engine", GameEngine::instance());

    engine.load(QUrl("qrc:/qml/MainView.qml"));

    return app.exec();
}
