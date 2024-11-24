import QtQuick 2.12
import QtQuick.Controls
import  "../qml/StyleSettings"
import  "../qml/Templates"

Window {
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
}
