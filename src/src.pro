TEMPLATE = app
TARGET = memorycards 
DEPENDPATH += .
INCLUDEPATH += .

QT += declarative

# Input
SOURCES += main.cpp \
    mainwindow.cpp \
    imageprovider.cpp

OTHER_FILES += \
    MainView.qml \
    Card.qml

HEADERS += \
    mainwindow.h \
    imageprovider.h

RESOURCES += \
    resources.qrc
