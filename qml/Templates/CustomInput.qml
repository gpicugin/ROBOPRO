import QtQuick 2.15
import  "../../qml/StyleSettings"

Rectangle {
    id: _customInput
    border.color: Style.borderColor
    border.width: Style.borderWidth
    color: Style.controlsColor
    radius: Style.controlRadius

    property alias text: _input.text
    property alias textColor: _input.color
    property bool isActive: false
    signal sendValidity(bool isValid)

    TextInput {
        anchors.centerIn: parent
        id: _input
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Style.textColor
        font.pointSize: _customInput.width * 0.05

        onActiveFocusChanged: {
            if(focus)
                _input.clear()
        }

        onEditingFinished:
        {
            if (!isValidNumber(_input.text))
            {
                _customInput.color = Style.errorColor
                _input.clear()
                _input.text = "#ivalid_input"
            } else
            {
                _customInput.color = Style.controlsColor
            }
            _customInput.sendValidity(isValidNumber(input))
        }

        function isValidNumber(input)
        {
            return /^[+-]?\d+$/.test(input);
        }

        Component.onCompleted: {
            _customInput.sendValidity.connect(_myButton.onSendValidity)
            _customInput.sendValidity(isValidNumber(input))
        }


    }
}
