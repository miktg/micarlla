import QtQuick
import Quickshell

Item {
    id: root
    
    width: clockDisplay.implicitWidth
    height: clockDisplay.implicitHeight

    property alias date: clock.date
    
    signal clicked()

    SystemClock {
        id: clock
        precision: SystemClock.Minutes 
    }

    Text {
        id: clockDisplay
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: "#cdd6f4" 
        font.pixelSize: 12
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: root.clicked()
    }
}
