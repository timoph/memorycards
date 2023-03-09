/*
 Memory cards - a simple pick pair of cards memory game
 Copyright (C) 2021 Timo Härkönen

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/


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

        Grid {
            id: grid
            width: parent.width
            height: parent.width
            columns: parent.width / (parent.width / 50)
            Repeater {
                model: grid.columns * grid.height / (grid.height / 50)

                Rectangle {
                    width: grid.width / 50
                    height: width
                    color: Style.pageBgColor
                    radius: 45
                }
            }
        }

        Connections {
            target: engine
            function onGameWon() {
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
                        function onUnflipCard(cardIndex) {
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
            opacity: 0.7
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
