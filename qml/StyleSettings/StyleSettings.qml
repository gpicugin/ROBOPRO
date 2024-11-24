pragma Singleton
import QtQuick 2.15
import QtQml 2.15

Item {
    id: _style
    property color  backgroundColor:    "#1c2739";
    property color  controlsColor:      "white";
    property color  controlsDownColor:  "gray";

    property color  borderColor:        "black";
    property color  textColor:          "black";
    property color  errorColor:         "red"
    property double borderWidth:        5
    property double controlRadius:      30
}
