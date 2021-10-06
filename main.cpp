/*
 Memory cards - a simple pick pair of cards memory game
 Copyright (C) 2021 Timo Härkönen

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/


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
