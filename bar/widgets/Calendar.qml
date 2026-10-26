import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root

    color: "#1e1e2e" 

    //layout do calendario
    ColumnLayout {
        anchors.fill: parent
        anchors.centerIn: parent

        spacing: 2

        //mes e ano
        Label {
            text: Qt.formatDateTime(new Date(), "MMMM yyyy").toUpperCase()
            
            font.bold: true
            font.pixelSize: 14

            color: "#89b4fa"

            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 5
        }
        
        //divisoria 1
        Rectangle {
            height: 1
            color: "#313244"

            Layout.fillWidth: true
        }

        //dias da semana
        DayOfWeekRow {
            id: days

            font.pixelSize: 5
            Layout.fillWidth: true
        
            delegate: Text {
                text: model.shortName

                font.pixelSize: 11
                color: "#text" ? "#6c7086" : "#6c7086"

                horizontalAlignment: Text.AlignHCenter
            }
        }

        //divisoria 2
        Rectangle {
            height: 1
            color: "#313244"

            Layout.fillWidth: true
            Layout.bottomMargin: 5
        }

        //calendario em si
        MonthGrid {
            id: month
            
            month: new Date().getMonth()
            year: new Date().getFullYear()

            Layout.fillWidth: true
            Layout.fillHeight: true

            delegate: Label {
                
                text: model.day

                font.pixelSize: 12
                font.bold: model.today

                color: model.today ? "#a6e3a1" : "#cdd6f4"
                opacity: model.month == monthGrid.month ? 1 : 0.3

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                
                background: Rectangle {
                    color: model.today ? "#2a3b30" : "transparent"

                    border.color: model.today ? "#a6e3a1" : "transparent"
                    border.width: 1

                    radius: width / 2
                }
            }
        }
    }
}

