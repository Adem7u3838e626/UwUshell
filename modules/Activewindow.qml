import QtQuick
import Quickshell

Item {
    id: active_window
    width: parent ? parent.width : 0
    height: parent ? parent.height : 0

    property string activeClass: ""

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            var file = "~/.cache/activewindow.json"
            try {
                var content = Qt.include(file)
            } catch(e) {
                return
            }
            if (content && content.class) {
                activeClass = content.class
            }
        }
    }

    Text {
        anchors.centerIn: parent
        text: activeClass !== "" ? activeClass : "No active window"
    }
}

