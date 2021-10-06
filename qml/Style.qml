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
import "."
pragma Singleton

Item {
    readonly property string menuBgColor: "#000"
    readonly property string pageBgColor: "#000"
    readonly property string highlightColor: "#800080"
    readonly property string buttonColor: "#555555"
    readonly property string buttonBorderColor: "#000000"
    readonly property string buttonTextColor: "#FFFFFF"
    readonly property string menuTextColor: "#FFFFFF"
    readonly property string menuBorderColor: "#800080"
    readonly property string cardRectColor: "#333333"
}
