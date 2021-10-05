import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: rootItem
    implicitWidth: parent.width / 2 > 200 ? parent.width / 2 : 200
    implicitHeight: parent.height / 2 > 240 ? parent.height / 2 : 240
    visible: false
    anchors.centerIn: parent

    Rectangle {
        anchors.fill: parent
        radius: 15
        border.width: 2
        border.color: "#fff"
        color: "#000"

        Text {
            id: titleText
            color: "#fff"
            font.pointSize: 20
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Memory cards"
        }

        MenuButton {
            id: newGameButton
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("New game")
            onClicked: {
                engine.setupGameboard()
                rootItem.visible = false
            }
        }
    }
}
