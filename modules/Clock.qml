import QtQuick
import Quickshell

Item {
    id: clockWidget
    width: parent ? parent.width : 0
    height: parent ? parent.height : 0
    SystemClock { id: clock }
    Text {
        anchors.centerIn: parent //here you chan change the time style ↓
        text: Qt.formatDateTime(clock.date, "hh:mm ddd dd-MMM-yyyy")
    }
}
