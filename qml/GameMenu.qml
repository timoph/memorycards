import QtQuick 2.0
import QtQuick.Controls 2.0
import "."

Item {
    id: rootItem
    implicitWidth: 380
    implicitHeight: 190
    visible: false
    anchors.centerIn: parent

    Rectangle {
        anchors.fill: parent
        radius: 15
        border.width: 2
        border.color: Style.menuBorderColor
        color: Style.menuBgColor

        Text {
            id: titleText
            color: Style.menuTextColor
            font.pointSize: 20
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Memory cards"
        }

        Column {
            id: buttonColumn
            anchors.top: titleText.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 30

                MenuRadioButton {
                    id: colorsButton
                    text: "Use colors"
                    checked: !engine.usePictures
                }

                MenuRadioButton {
                    id: picturesButton
                    text: "Use pictures"
                    checked: engine.usePictures
                    onCheckedChanged: engine.usePictures = checked
                }
            }

            MenuButton {
                id: newGameButton
                text: qsTr("New game")
                width: rootItem.width - rootItem.width / 5
                onClicked: {
                    engine.setupGameboard()
                    rootItem.visible = false
                }
            }
        }
    }
}
