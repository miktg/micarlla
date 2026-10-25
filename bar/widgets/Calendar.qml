import Quickshell
import QtQuick
import QtQuick.Controls

PopupWindow {
    id: calendarPopup
    
    property var targetWidget
    
   anchor {
        item: targetWidget
        edges: Edges.Top
        gravity: Edges.HorizontalCenter
    }
    
    implicitWidth: 260
    implicitHeight: 280
    color: "#1e1e2e"
    
    //border {
       // width: 1
        //color: "#313244"
    //}

    //dismissBehavior: PopupWindow.DismissOnFocusOut

    Column {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 10

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: Qt.formatDateTime(new Date(), "MMMM yyyy").toUpperCase()
            color: "#89b4fa"
            font.bold: true
            font.pixelSize: 14
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#313244"
        }

        MonthGrid {
            id: grid
            width: parent.width
            height: 200
            
            month: new Date().getMonth()
            year: new Date().getFullYear()

            delegate: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: model.month === grid.month ? 1 : 0.3
                text: model.day
                font.pixelSize: 12
                
                color: {
                    let today = new Date();
                    if (model.day === today.getDate() && model.month === today.getMonth() && model.year === today.getFullYear()) {
                        return "#a6e3a1";
                    }
                    return "#cdd6f4";
                }
                
                font.bold: {
                    let today = new Date();
                    return model.day === today.getDate() && model.month === today.getMonth();
                }
            }
        }
    }
}
