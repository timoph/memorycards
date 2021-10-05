import QtQuick 2.0
import QtQuick.Controls 2.4
import "."

Item {
    id: base
    implicitHeight: 80
    implicitWidth: 160

    property string text: ""

    signal clicked()

    Button {
        id: button
        height: base.height
        text: base.text
        anchors.fill: parent
        font.pointSize: 20

        contentItem: Text {
            text: button.text
            font: button.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: enabled ? 1.0 : 0.3
            color: button.down ? "#f00" : "#fff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 60
            implicitHeight: 60
            border.color: button.down ? "#f00" : "#fff"
            border.width: 2
            radius: 15
            opacity: 1
            color: "#111"
        }

        onClicked: base.clicked()
    }
}

