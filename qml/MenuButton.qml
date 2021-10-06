import QtQuick 2.0
import QtQuick.Controls 2.4
import "."

Item {
    id: base
    implicitHeight: 80
    implicitWidth: 160

    property string text: ""
    property bool drawBorders: true
    property bool transparentBackground: false
    property int fontSize: 20

    signal clicked()

    Button {
        id: button
        height: base.height
        text: base.text
        anchors.fill: parent
        font.pointSize: base.fontSize

        contentItem: Text {
            text: button.text
            font: button.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: enabled ? 1.0 : 0.3
            color: button.down ? Style.highlightColor : Style.buttonTextColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 60
            implicitHeight: 60
            border.color: Style.buttonBorderColor
            border.width: base.drawBorders ? 2 : 0
            radius: 15
            color: Style.buttonColor
            opacity: base.transparentBackground ? 0.2 : 1.0
        }

        onClicked: base.clicked()
    }
}

