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


import QtQuick 2.4
import QtQuick.Controls 2.0
import "."

RadioButton {
    id: button

    contentItem: Text {
        anchors.left: button.indicator.right
        anchors.leftMargin: 5
        font: button.font
        text: button.text
        color: button.down ? Style.highlightColor : Style.buttonTextColor
        verticalAlignment: Text.AlignVCenter
    }
}
