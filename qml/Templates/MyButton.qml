import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Basic 2.15

import  "../../qml/StyleSettings"

Button {
    id: _button

    text: "Calculate!"
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
        color: _button.enabled ? _button.down ? Style.controlsDownColor : Style.controlsColor : Style.controlsLockColor
    }
}
