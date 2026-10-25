import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.Wayland
import QtQuick.Layouts
import "widgets"

PanelWindow{
    id: bar

    property bool show: false

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: show ? 30 : 0
    Behavior on implicitHeight { 
        NumberAnimation { duration: 50 } 
    }

    color: "transparent"

    exclusionMode: ExclusionMode.Ignore

    Rectangle {
            anchors.fill: parent
            color: "#1e1e2e"
            radius: 12 
            border.color: "#313244"
            border.width: 1

            opacity: show ? 1.0 : 0.0
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true 

        onEntered: {show = true}        
        onExited: {show = false}
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        spacing: 15

        // 👈 SEÇÃO ESQUERDA: Fixada no canto esquerdo
        //BarLeft {
        //    anchors.left: parent.left
        //    anchors.verticalCenter: parent.verticalCenter
        //}

        Item {Layout.fillWidth: true}

        Clock{
            id: clock
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            onClicked: {
                calendar.targetWidget = clock
                calendar.visible = !calendar.visible 
            }
        }

        Calendar {
            id: calendar
            visible: false 

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true 
                
                onEntered: {show = true}        
                onExited: {show = false}
            }
        }

        Item {Layout.fillWidth: true}

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
