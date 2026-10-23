import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Wayland
import "widgets"

PanelWindow{
    id: bar

    property bool show: false

    anchors {
        top: true
        left: true
        right: true
    }

    height: show ? 30 : 0
    
    color: "transparent"

    exclusionMode: ExclusionMode.Ignore

    Rectangle {
            anchors.fill: parent
            color: "#1e1e2e"
            radius: 12 
            border.color: "#313244"
            border.width: 1
            height: show ? 30 : 0

            Behavior on height { NumberAnimation { duration: 150 } }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true 

        onEntered: {show = true}        
        onExited: {show = false}
     }

    Clock {
        id: clock
        anchors.centerIn: parent
        opacity: show ? 1.0 : 0.0
    }
}