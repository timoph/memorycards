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
        function onNewGame() {
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
