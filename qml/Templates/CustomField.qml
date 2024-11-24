import QtQuick 2.15
import  "../../qml/StyleSettings"

Rectangle {
    id: _customField
    color: Style.controlsColor
    radius: Style.controlRadius

    property alias text: _text.text
    property alias textColor: _text.color

    Text
    {
        anchors.centerIn: parent
        id: _text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Style.textColor
        font.pointSize: _customField.width * Style.fontCoef
    }
}
