import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Basic 2.15

import  "../../qml/StyleSettings"

Button {
    id: _button

    text: "Calculate"
    contentItem: Text {
        anchors.centerIn: parent
        text: _button.text
        color: Style.textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: parent.width * Style.fontCoef
    }

    background: Rectangle {
        id: _buttonBack
        color: _button.down ? Style.controlsDownColor : Style.buttonColor
        border.width: Style.borderWidth
        radius: Style.controlRadius
        border.color: _button.enabled ? _button.down ? Style.controlsDownColor : Style.buttonColor : Style.errorColor
    }
}
