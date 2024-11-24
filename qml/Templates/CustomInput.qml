import QtQuick 2.15
import  "../../qml/StyleSettings"

Rectangle {
    id: _customInput
    border.width: Style.borderWidth
    color: Style.controlsColor
    radius: Style.controlRadius

    property alias text: _input.text
    property alias textColor: _input.color
    property alias input: _input

    signal validatedInput(bool flag)

    TextInput
    {
        anchors.centerIn: parent
        id: _input
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Style.textColor
        font.pointSize: _customInput.width * Style.fontCoef

        maximumLength: 7

        onActiveFocusChanged:
        {
            if(focus)
                _input.clear()
        }

        onEditingFinished:
        {
            let isValid = isValidNumber(_input.text)
            if (!isValid)
            {
                _customInput.border.color = Style.errorColor
                _input.clear()
                _input.text = "invalid"
            }
            else
            {
                _customInput.border.color = Style.controlsColor
            }
            validatedInput(isValid)
        }

        Component.onCompleted: {
            let isValid = isValidNumber(_input.text)
            if (!isValid)
            {
                _customInput.border.color = Style.errorColor
            }
            else
            {
                _customInput.border.color = Style.controlsColor
            }
            validatedInput(isValid)
        }

        function isValidNumber(input)
        {
            let isCorrectStr = /^[-]?\d+(\.\d+)?$/.test(input);
            if(!isCorrectStr)
                return false

            let num = parseFloat(input)
            let isCorrectNum = true

            if(num > 180 || num < -180)
                isCorrectNum = false
            if(!isCorrectNum)
                return false
            return true
        }        
    }
}
