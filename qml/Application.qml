import QtQuick 2.12
import QtQuick.Controls
import  "../qml/StyleSettings"
import  "../qml/Templates"

ApplicationWindow {
    id: _root
    width: 640
    height: 480
    visible: true
    title: qsTr("Calculator")

    color: Style.backgroundColor

    MainFrame {
        anchors{
            fill: parent
            margins: _root.width * 0.1
        }
    }

    Text {
        id: _subscription
        text: qsTr("Developed by Grigoriy Pichugin")
        font.pointSize: _root.width * 0.04
        color: Style.textColor
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
