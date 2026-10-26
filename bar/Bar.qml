// configuracoes gerais da barra
import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Wayland
import QtQuick.Layouts
import "widgets"

PanelWindow{
    id: bar

    property bool show: false //altera a visibilidade da barra

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    //animacao ao aparecer
    Behavior on implicitHeight { 
        NumberAnimation { duration: 50 } 
    }

    color: "transparent"

    exclusionMode: ExclusionMode.Ignore

    //fundo da barra
    Rectangle {
            anchors.fill: parent
            color: "#1e1e2e"

            radius: 12 
            border.color: "#313244"
            border.width: 1

            opacity: (show || calendar.visible) ? 1.0 : 0.0 // some se show = false e o calendario esta fechado
    }

    Timer {
        id: hideTimer
        interval: 1000 
        onTriggered: bar.show = false
    }

    //area em que a barra pode ser detectada
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true 
        
        propagateComposedEvents: true
        preventStealing: false

        onEntered: {show = true}        
        onExited: {show = false}
    }

    //widgets
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15

        opacity: (show || calendar.visible) ? 1.0 : 0.0 //msm coisa dos outros
        spacing: 20

        //esquerda
        //BarLeft {
        //    anchors.left: parent.left
        //    anchors.verticalCenter: parent.verticalCenter
        //}

        Item {Layout.fillWidth: true}

        //centro
        //widget do relogio
        Clock{
            id: clock
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            anchors.centerIn: parent

            onClicked: calendar.visible = !calendar.visible //abre o calendario quando clicado
        }

        //calendario
        PopupWindow {
            id: calendar

            anchor.window: bar           
            anchor.rect.x: clock.x - 95 //centro do relogio
            anchor.rect.y: bar.height - 1

            //tamanho do widget
            width: 250
            height: 200

            visible: false              
            grabFocus: true             

            Calendar {
                anchors.fill: parent
            }
        }

        //direita
        Battery {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }

        Text {
            text: "Alex"
            color: "#cdd6f4"
            font.pixelSize: 12
        }
    }
}
