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
    imageprovider.cpp \
    gameengine.cpp

HEADERS += \
    imageprovider.h \
    gameengine.h

RESOURCES += \
    resources.qrc
