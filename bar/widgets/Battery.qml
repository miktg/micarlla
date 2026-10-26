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
            font.pixelSize: 12
            color: "#cdd6f4"

            text: battery.icon + " " + battery.percent
        }
    }

    //le as informacoes reais de armazenamento da bateria
    Process {
        id: reader
        
        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/capacity"]
        running: true 

        //imprime o resultado da leitura
        stdout: StdioCollector {
            onStreamFinished: {
                let percentage = text.trim();
                battery.percent = percentage + "%";
                
                let num = parseInt(percentage);

                //muda o icone depeendendo da porcentagem
                if (num < 20) battery.icon = "🪫";
                else battery.icon = "🔋";
            }
        }
    }

    //tempo q os dados atualizam
    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: reader.running = true 
    }
}
