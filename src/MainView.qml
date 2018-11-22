import QtQuick 2.9
import QtQuick.Controls 2.0

Rectangle {
    id: background
    width: 450
    height: 480
    color: "#333"

    Rectangle {
        id: cardRect
        width: 330
        height: 450
        color: "#333"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: (background.height - height) / 2

        Connections {
            target: engine
            onUnflipCard: {
                cardRepeater.itemAt(cardIndex).setState("unflipped")
            }

            onGameWon: {
                bannerRect.visible = true
            }
        }

        Grid {
            id: cardGrid
            columns: 4
            spacing: 10
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.fill: parent

            Repeater {
                id: cardRepeater
                model: 4 * cardGrid.columns
                Card {
                }
            }
        }
    }

    Label {
        id: movesLabel
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 15
        width: actionColumn.width
        color: "#fff"

        text: "Moves: " + engine.moves
    }

    Column {
        id: actionColumn
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        spacing: 5

        Button {
            id: restartButton
            text: "Restart"
            onClicked: engine.setupGameboard()
        }

        Button {
            id: closeButton
            text: "Exit"
            onClicked:  Qt.quit()
        }
    }

    Rectangle {
        id: bannerRect
        width: parent.width
        height: parent.height / 4
        color: "#455"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        opacity: 50
        visible: false

        Text {
            id: bannerText
            anchors.centerIn: parent

            text: "Game over"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                bannerRect.visible = false
            }
        }
    }
}
