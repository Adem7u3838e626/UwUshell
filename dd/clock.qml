// Bar.qml
import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: root
  property string time:""


  Variants {
    model: Quickshell.screens


    PanelWindow {
      pannel{}
    }
  }
  
}