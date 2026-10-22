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
    property bool flipped: false
    property bool showingFront: false
    property bool targetFlipped: false

    function setState(stateName) {
        setFlipped(stateName === "flipped", true)
    }

    function setFlipped(shouldBeFlipped, animate) {
        targetFlipped = shouldBeFlipped
        flipped = shouldBeFlipped

        if (!animate) {
            flipAnimation.stop()
            cardRotation.angle = 0
            showingFront = shouldBeFlipped
            return
        }

        if (flipAnimation.running) {
            flipAnimation.stop()
        }

        if (showingFront === shouldBeFlipped) {
            cardRotation.angle = 0
            return
        }

        flipAnimation.start()
    }

    Connections {
        target: engine
        function onNewGame() {
            setFlipped(false, false)
        }
    }

    Rectangle {
        id: cardShadow
        anchors.fill: parent
        anchors.topMargin: 3
        anchors.leftMargin: 2
        anchors.rightMargin: -2
        anchors.bottomMargin: -3
        radius: 6
        color: "#000000"
        opacity: 0.10 + (Math.abs(cardRotation.angle) / 90) * 0.20
        z: -1
    }

    Item {
        id: cardBody
        anchors.fill: parent
        transform: Rotation {
            id: cardRotation
            origin.x: cardBody.width / 2
            origin.y: cardBody.height / 2
            axis.x: 0
            axis.y: 1
            axis.z: 0
            angle: 0
        }

        Image {
            id: backImage
            anchors.fill: parent
            cache: false
            visible: !showingFront
            source: "image://pics/99"
        }

        Image {
            id: frontImage
            anchors.fill: parent
            cache: false
            visible: showingFront
            source: showingFront ? "image://pics/" + index : ""
        }
    }

    SequentialAnimation {
        id: flipAnimation
        NumberAnimation {
            target: cardRotation
            property: "angle"
            from: 0
            to: 90
            duration: 180
            easing.type: Easing.InOutCubic
        }
        ScriptAction {
            script: showingFront = targetFlipped
        }
        NumberAnimation {
            target: cardRotation
            property: "angle"
            from: -90
            to: 0
            duration: 180
            easing.type: Easing.InOutCubic
        }
    }

    MouseArea {
        id: clickpad
        anchors.fill: parent
        enabled: !flipped && !engine.waiting && !flipAnimation.running

        onClicked: {
            setFlipped(true, true)
            engine.click(index)
        }
    }
}
