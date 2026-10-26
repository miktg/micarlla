import QtQuick
import QtQuick.Controls
import Quickshell

Item {
    id: root
    
    //tamanho do relogio
    width: clockDisplay.implicitWidth
    height: clockDisplay.implicitHeight

    property alias date: clock.date
    
    signal clicked()

    //le o relogio
    SystemClock {
        id: clock
        precision: SystemClock.Minutes 
    }

    //imprime o relogio
    Text {
        id: clockDisplay

        font.pixelSize: 12
        color: "#cdd6f4"

        text: Qt.formatDateTime(clock.date, "hh:mm")
    }

    //area clickavel (se clicar, abre o calendario\)
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: root.clicked()
    }
}
