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
