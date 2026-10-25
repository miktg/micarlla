import Quickshell
import Quickshell.Io
import QtQuick

Item {
    id: battery
    width: sysRow.implicitWidth
    height: sysRow.implicitHeight

    property string percent: "0%"
    property string icon: "🔋"

    Row {
        id: sysRow
        spacing: 15

        Text {
            text: battery.icon + " " + battery.percent
            color: "#cdd6f4"
            font.pixelSize: 12
        }
    }

    Process {
        id: reader
        
        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/capacity"]
        running: true 

        stdout: StdioCollector {
            onStreamFinished: {
                let percentage = text.trim();
                battery.percent = percentage + "%";
                
                let num = parseInt(percentage);

                if (num < 20) battery.icon = "🪫";
                else battery.icon = "🔋";
            }
        }
    }

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: reader.running = true // Força o processo a rodar de novo
    }
}
