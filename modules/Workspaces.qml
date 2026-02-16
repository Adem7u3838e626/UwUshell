import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts

RowLayout {
  id: root
  spacing: 8
  Repeater {
  model: 5
    Rectangle {
      id: dot
      readonly property int currentPage: {
          let currentId = Hyprland.focusedWorkspace?.id || 1;
          return Math.floor((currentId - 1) / 5);
      }
      readonly property int actualWorkspaceId: (currentPage * 5) + (index + 1)
      property bool isActive: Hyprland.focusedWorkspace?.id === actualWorkspaceId
      property bool hasWindows: {
          return Hyprland.workspaces.values.some(w => w.id === actualWorkspaceId)
      }
      implicitHeight: 12
      implicitWidth: isActive ? 32 : 12
      radius: height / 2
      color: {
          if (isActive) return Theme.color3
          if (hasWindows) return Theme.color4
          return Theme.color5
        }
      Behavior on implicitWidth {
          NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
      }
      MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onClicked: Hyprland.dispatch("workspace " + actualWorkspaceId)
      }
    }
  }
}
