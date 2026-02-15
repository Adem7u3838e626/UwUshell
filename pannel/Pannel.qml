import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import Quickshell.Io 
import Quickshell
Rectangle {
    id: rectangle
    color: "transparent"
    property string backgroundColor:"#040411"   // main bar background
    property string panelColor:"#081121"        // widgets
    property string accentColor:"#112848"       // hover، highlight
    property string alertColor:""               // notifications
    property string borderColor:"#010aab"              // borders
    property string textColor:"#3152a0"         // text
    // processes
    property string currentTime :"time"
    Rectangle{
        id:main
        color: backgroundColor
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
            color: panelColor
            opacity: 0.7
            width: 150
            height: main.height -10
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
        }
        Rectangle{
            id: workspaces
            color: panelColor
            width: 250
            height: parent.height -8
            radius: 15
            anchors.centerIn: parent
            Test{
              anchors.centerIn: parent
            }
        }
        Rectangle{
            id: calendar
            width: 200
            height: 30
            color: "transparent"
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: workspaces.right
            anchors.leftMargin: 30
            Row{
                id: row
                spacing: 5
                Text {
                    text:now.getHours() 
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 1
                    anchors.verticalCenterOffset: 0
                    font.pointSize: 14
                    color: textColor
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
                color: textColor
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
                color: textColor
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
