import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: panel
            screen: modelData
            implicitWidth: 1500
            implicitHeight: 35
            anchors{
              top: true
              left : true
              right: true
            }
            margins.top : 2
            exclusionMode: ExclusionMode.Exclusive
            color: "transparent"
            Pannel {
                anchors.fill: parent
            }
        }
    }
}

