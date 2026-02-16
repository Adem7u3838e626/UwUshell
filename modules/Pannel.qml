import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import Quickshell.Io 
import Quickshell
Rectangle {
    id: rectangle
    color: "transparent"
    Rectangle{
        id:main
        color: Theme.color0
        radius: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        Rectangle{
            id:parameters
            color: Theme.color0
            width: 150
            height: main.height -10
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
        }
        Rectangle{
            id: workspaces
            color:Theme.color0
            width: 250
            height: parent.height -8
            radius: 15
            anchors.centerIn: parent
            Workspaces{
              anchors.centerIn: parent
            }
        }
        Rectangle{
            id: calendar
            width: 200
            height: 30
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: main.right
            anchors.leftMargin: 30
            SystemClock { id: clock }
            Row{
              anchors.centerIn : parent
              spacing: 5
              Text {
                text : Qt.formatDateTime(clock.date, "HH:mm")
                font.pointSize:14
                color : Theme.color8
              }
              Text {
                visible:false
                text : Qt.formatDateTime(clock.date, "ddd dd-MMM")
                font.pointSize:12
                color:Theme.color8
                opacity:0.7
              }
            }
        }
        Rectangle{
            width: 100
            height: parent.height -8
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: workspaces.left
            anchors.rightMargin: 20
            Text {
                id: media
                text: qsTr("No media")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                font.pointSize: 12
                color: Theme.color8
            }
        }
        Rectangle{
            id:active
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: ai.right
            anchors.leftMargin: 30
            Text {
                id: app
                text: qsTr("app")
                anchors.centerIn: parent
                font.pointSize: 15
                color: Theme.color8
            }
        }
        Rectangle{
            id:ai
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenterOffset: 0
            width: main.height
            height: main.height
            radius: 20
            color: "transparent"

        }
    }
}
