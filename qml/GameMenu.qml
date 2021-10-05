import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: rootItem
    implicitWidth: 200
    implicitHeight: 240
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

        Column {
            id: buttonColumn
            anchors.top: titleText.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            CheckBox {
                id: picturesCheck
                text: "Use pictures"
                checked: engine.usePictures
                onCheckedChanged: engine.usePictures = checked
            }

            MenuButton {
                id: newGameButton
//                anchors.top: buttonColumn.bottom
//                anchors.topMargin: 10
//                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("New game")
                onClicked: {
                    engine.setupGameboard()
                    rootItem.visible = false
                }
            }
        }
    }
}
