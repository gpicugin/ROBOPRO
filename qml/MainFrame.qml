import QtQuick 2.12
import QtQuick.Layouts
import QtQuick.Controls
import  "../qml/Templates"
import  "../qml/StyleSettings"

GridLayout {
    id: _grid
    columns: 3
    rows: 4
    property double margins: _grid.width * 0.01
    property double inputWidth: _grid.width * 0.3
    property double heigth: _grid.height * 0.15
    property bool isValidAllInput: true

    readonly property var arr: ["X", "Y", "Z"]
    readonly property var validArr: [false, false, false, false, false, false]

    Repeater {
        id: _repeater1
        model: 6
        signal validatedRepeater()

        CustomInput {
            id: customInputItem
            Layout.margins: margins
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: heigth
            text: "theta_" + index

            Connections
            {
                target: customInputItem
                function onValidatedInput(isValid)
                {
                    validArr[index] = isValid
                    _repeater1.validatedRepeater()
                }
            }
        }
    }

    MyButton {
        id: _myButton
        Layout.margins: margins
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredHeight: heigth
        Layout.row: 2
        Layout.columnSpan: 3
        enabled: isValidAllInput
        onClicked:
        {
            let vector = []
            for (let i = 0; i < _repeater1.count; i++)
            {
                vector.push(parseInt(_repeater1.itemAt(i).text))
            }

            let result = []
            result = appEngine.calculate(vector)

            _repeater2.itemAt(0).text = "X = " + result[0]
            _repeater2.itemAt(1).text = "Y = " + result[1]
            _repeater2.itemAt(2).text = "Z = " + result[2]
        }

        Connections
        {
            target: _repeater1
            function onValidatedRepeater()
            {
                validateAll()
            }
        }

        Component.onCompleted: {
            validateAll()
        }

        function validateAll()
        {
            let result = true
            let counter = 0
            for(let i = 0; i < _repeater1.count; i++)
            {
                if(!validArr[i]) {
                    result = false
                    break
                }
                else
                    counter = counter + 1
            }
            if(counter === _repeater1.count)
                result = true
            isValidAllInput = result
            console.log(validArr)
        }
    }

    Repeater {
        id: _repeater2
        model: 3
        CustomInput
        {
            Layout.margins: margins
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: heigth
            text: _grid.arr[index]
        }
    }

}
