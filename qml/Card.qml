import QtQuick 2.3

Item {
    id: card
    implicitWidth: 80
    implicitHeight: 100
    //color: "green"

    function setState(stateName) {
        cardImage.state = stateName
    }

    Connections {
        target: engine
        onNewGame: {
            cardImage.state = "unflipped"
        }
    }

    Image {
        id: cardImage
        anchors.fill: parent
        state: "unflipped"
        cache: false
        source: state == "flipped" ? "image://pics/" + index : "image://pics/99"
    }

    MouseArea {
        id: clickpad
        anchors.fill: parent
        enabled: cardImage.state != "flipped" && !engine.waiting

        onClicked: {
            cardImage.state = "flipped"
            engine.click(index)
        }
    }
}
