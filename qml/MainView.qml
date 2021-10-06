import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3
import "."

Window {
    id: appWindow
    width: 800
    height: 480
    color: Style.pageBgColor
    visible: true
    minimumHeight: 220
    minimumWidth: 410

    Rectangle {
        id: cardRect
        anchors.fill: parent
        color: Style.cardRectColor
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
            visible: engine.gameReady

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

        MenuButton {
            id: menuButton
            anchors.right: parent.right
            width: 50
            height: width
            text: "\u2699"
            drawBorders: false
            transparentBackground: true
            fontSize: 40
            visible: !gameMenu.visible
            onClicked: gameMenu.visible = true
        }

        Rectangle {
            id: dimmerRect
            anchors.fill: parent
            color: "#000"
            opacity: 0.8
            visible: gameMenu.visible
        }

        MouseArea {
            anchors.fill: parent
            enabled: gameMenu.visible || bannerRect.visible
            onClicked: {
                gameMenu.visible = false
                bannerRect.visible = false
            }
        }

        Rectangle {
            id: bannerRect
            width: parent.width
            height: parent.height / 3
            border.width: 2
            border.color: Style.menuBorderColor
            color: Style.menuBgColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            opacity: 50
            visible: false

            Text {
                id: bannerText
                anchors.centerIn: parent
                color: Style.menuTextColor
                font.pointSize: 22
                text: "Game over in" + " " + engine.moves + " " + "moves"
            }
        }

        GameMenu {
            id: gameMenu
            visible: !engine.gameReady
        }
    }
}
