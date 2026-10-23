import QtQuick
import Quickshell
import QtQuick.Controls
import Quickshell.Wayland
import "widgets"

Item {

    //Calendar {
        id: calendar
        anchors.centerIn: parent
    //}
    
    property alias date: clock.date

    width: clockDisplay.implicitWidth
    height: 30


    SystemClock {
        id: clock
        
        precision: SystemClock.Minutes 
    }

    Text {
        id: clockDisplay

        text: Qt.formatDateTime(clock.date, "hh:mm")
        anchors.centerIn: parent
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: calendar.open()
    }


}