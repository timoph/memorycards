TEMPLATE = app
TARGET = memorycards
DEPENDPATH += .
INCLUDEPATH += .

QT += core quick

equals(QT_MAJOR_VERSION, 6) {
    QT += quickcontrols2
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
