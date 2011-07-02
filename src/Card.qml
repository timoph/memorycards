import QtQuick 1.0

Rectangle {
    id: card
    width: 70
    height: 100
    color: "green"

    Image {
        id: cardBackSide
        anchors.fill: parent
        source: "image://pics/" + index
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            gameView.click(index)
        }
    }
}
