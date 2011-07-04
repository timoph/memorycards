import QtQuick 1.0

Rectangle {
    id: background
    width: 800
    height: 480

    Rectangle {
        id: cardRect
        width: 650
        height: 450
        color: "lightBlue"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: (background.height - height) / 2

        Grid {
            id: cardGrid
            columns: 8
            spacing: 10
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.fill: parent

            Repeater {
                model: 4 * cardGrid.columns
                Card { }
            }
        }
    }

    Column {
        id: actionColumn
        width: parent.width - cardRect.width - 20
        height: parent.height
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.rightMargin: 10
        spacing: 10


        Rectangle {
            id: movesRect
            width: parent.width
            height: 60
            color: "red"

            Text {
                id: countText
                anchors.centerIn: parent
                property int moves: 0
                text: "Moves:\n " + gameView.moves
            }
        }

        Rectangle {
            id: fillerRect
            width: parent.width
            height: 60 * 4
        }

        // ** Restart button **//
        Rectangle {
            id: restartButton
            width: parent.width
            height: 60
            color: "red"

            // TODO: image

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("restart clicked")
                }
            }
        }

        // ** Close button ** //
        Rectangle {
            id: closeButton
            width: parent.width
            height: 60
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
}
