import QtQuick
import Quickshell
import QtQuick.Controls
import Quickshell.Wayland
import "widgets"

Popup {

    Clock{id: clock}

    id: calendar

    x: -(width - clock.width) / 2
    y: 35

    width: 250
    height: 280
    focus: true
    closePolicy: Popup.CloseOnRelease

    Rectangle {
        color: "white"
        border.color: "#cccccc"
        radius: 4
        layer.enabled: true // Adds a soft shadow effect
    }

    opacity: show ? 1.0 : 0.0
    
    //onEntered: {show = true}        
    //onExited: {show = false}
}