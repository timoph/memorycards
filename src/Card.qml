import QtQuick 1.0

Rectangle {
    id: card
    width: 70
    height: 100
    color: "green"

    Image {
        id: cardImage
        anchors.fill: parent
        source: state == "flipped" ? "image://pics/" + index : "image://pics/99"
    }

    MouseArea {
        id: clickpad
        anchors.fill: parent
        onClicked: {
            gameView.click(index)
            cardImage.state = "flipped"
        }
    }
}
