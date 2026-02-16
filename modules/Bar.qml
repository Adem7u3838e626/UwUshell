import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
Scope {
  id: root
  property string maincolor: '#1F1F30'
  Variants {
    model: Quickshell.screens
    PanelWindow {
      screen: modelData
      width: 1700
      height: 35
      anchors {
        top: true            
        left:true
        right:true
      }
      margins.left : 100
      margins.right : 100
      margins.top : 2
      exclusionMode: ExclusionMode.Exclusive
      color:"transparent"
      Theme{
 
      }
    }
  }
}
