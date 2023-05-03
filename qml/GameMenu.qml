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


import QtQuick 2.0
import QtQuick.Controls 2.0
import "."

Item {
    id: rootItem
    implicitWidth: 380
    implicitHeight: 270
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

            MenuButton {
                id: quitButton
                text: qsTr("Quit")
                width: rootItem.width - rootItem.width / 5
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }
}
