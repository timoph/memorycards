import QtQuick 1.0

Rectangle {
    id: background
    width: 800
    height: 480

    Grid {
        columns: 9
        spacing: 10
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.fill: parent

        Repeater {
            model: 4 * 9
            Card { }
        }
    }

    // TODO: column with real time stats and restart and quit buttons, etc.

    // ** Close button ** //
    Rectangle {
        id: closeButton
        width: 30
        height: 30
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.rightMargin: 10
        color: "red"

        //TODO: image

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit()
            }
        }
    }
}
