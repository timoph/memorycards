TEMPLATE = app
TARGET = memorycards 
DEPENDPATH += .
INCLUDEPATH += .

greaterThan(QT_MAJOR_VERSION, 4) {
	QT += core quick widgets
	CONFIG -= app_bundle
	DEFINES += QT5BUILD
}
else {
	QT += declarative
}

# Input
SOURCES += main.cpp \
    mainwindow.cpp \
    imageprovider.cpp \
    gameengine.cpp

OTHER_FILES += \
    MainView.qml \
    Card.qml

HEADERS += \
    mainwindow.h \
    imageprovider.h \
    gameengine.h

RESOURCES += \
    resources.qrc
