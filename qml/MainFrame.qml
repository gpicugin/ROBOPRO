import QtQuick 2.12
import QtQuick.Layouts
import QtQuick.Controls
import  "../qml/Templates"
import  "../qml/StyleSettings"

GridLayout {
    id: _greed
    columns: 3
    rows: 4
    property double margins: _greed.width * 0.01
    property double inputWidth: _greed.width * 0.3
    property double heigth: _greed.height * 0.15
    property bool isValidAllInput: true

    readonly property var arr: ["X", "Y", "Z"]
    readonly property var input: ["15", "-50", "-60", "95", "50", "0"]


    Repeater {
        id: _repeater1
        model: 6
        CustomInput {
            Layout.margins: margins
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: heigth

        }
        Component.onCompleted: {
            for (let i = 0; i < _repeater1.count; i++)
            {
                _repeater1.itemAt(i).text = input[i]
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
        onClicked: {
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
    }

    Repeater {
        id: _repeater2
        model: 3
        CustomInput {
            Layout.margins: margins
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: heigth
            text: _greed.arr[index]
        }
    }
}
