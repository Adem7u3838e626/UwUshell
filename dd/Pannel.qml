import QtQuick
import QtQuick.Controls
Rectangle {
    id: rectangle
    color: "transparent"
    property string maincolor: "#121516"
    property string secondcolor: "#111414"
    property string textcolor: "#C2C6D5"
    Rectangle{
        id:main
        color: maincolor
        opacity: 0.7
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
            color: secondcolor
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
            color: secondcolor
            width: 250
            height: parent.height -8
            radius: 15
            //border.color: borders
            border.width: 0
            anchors.centerIn: parent
            Row {
                id:workspacerow
                spacing: 3
                anchors.centerIn: parent
                Repeater{
                    model: 10
                    Rectangle{
                        property int number: index +1
                        width: 20
                        height: 20
                        visible: true
                        radius: 15
                        color: workspaces.activeWorkspace === number ? "#4CAF50" : "transparent"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: workspaces.activeWorkspace = number
                        }
                        Text {
                            visible: workspaces.activeWorksoace === number ? false : true
                            color: "#40fdfdfd"
                            text: index + 1
                            font.pointSize: 10
                            anchors.centerIn: parent
                        }

                    }
                }

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
                    text: qsTr("9:10 PM")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 1
                    anchors.verticalCenterOffset: 0
                    font.pointSize: 14
                    color: textcolor
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
                color: textcolor
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
                color: textcolor
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
