import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Basic 2.15

import  "../../qml/StyleSettings"

Button {
    id: _button

    text: "Calculate!"
    property bool isActive: false

    contentItem: Text {
        anchors.centerIn: parent
        text: _button.text
        color: Style.textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: parent.width * 0.03
    }

    background: Rectangle {
        id: _buttonBack
        border.color: Style.borderColor
        border.width: Style.borderWidth
        radius: Style.controlRadius
        color: _button.down ? Style.controlsDownColor : Style.controlsColor
    }

    Connections {
        target: CustomInput
        function onSendValidity(isValid)
        {
            isActive = isValid
            _buttonBack.color = isActive ? Style.controlsDownColor : Style.controlsColor
        }
    }
}
