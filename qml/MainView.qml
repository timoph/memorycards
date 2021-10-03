import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3

Window {
    id: appWindow
    width: 800
    height: 480
    color: "#333"
    visible: true

    Rectangle {
        id: cardRect
        anchors.fill: parent
        color: "#333"
        anchors.bottom: parent.bottom

        Connections {
            target: engine
            onGameWon: {
                bannerRect.visible = true
            }
        }

        Grid {
            id: cardGrid
            columns: 4
            spacing: 5
            width: parent.width
            height: parent.height

            Repeater {
                id: cardRepeater
                model: 4 * cardGrid.columns

                Card {
                    width: (parent.width / cardGrid.columns)
                    height: (parent.height / 4)

                    Connections {
                        target: engine
                        onUnflipCard: {
                            if(cardIndex === index) {
                                setState("unflipped")
                            }
                        }
                    }
                }
            }
        }

        Button {
            id: restartButton
            anchors.right: parent.right
            width: 50
            height: width
            text: "\u2699"
            font.pointSize: 40
            onClicked: engine.setupGameboard()
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
}
