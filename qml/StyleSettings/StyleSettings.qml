pragma Singleton
import QtQuick 2.15
import QtQml 2.15

Item {
    id: _style
    property color  backgroundColor:    "lightblue";
    property color  controlsColor:      "white";
    property color  controlsDownColor:  "lightslategray";
    property color  controlsLockColor:  "indigo"
    property color  buttonColor:        "gold"


    property color  borderColor:        "black";
    property color  textColor:          "black";
    property color  errorColor:         "red"
    property double borderWidth:        5
    property double controlRadius:      30
    property double fontCoef:           0.07
}
