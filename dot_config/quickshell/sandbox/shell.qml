import QtQuick
import Quickshell
import Quickshell.Wayland

// ShellRoot is the required root element for your entry config
ShellRoot {
    id: root

    // PanelWindow is designed for Wayland desktop components (bars, widgets, OSDs)
    PanelWindow {
        id: testWindow
        visible: true
        
        // Explicit sizing for our test box
        implicitWidth: 320
        implicitHeight: 160

        // WlrLayershell tells Hyprland how to treat this window.
        // Overlay = floats above tiling windows (like an OSD or launcher)
        WlrLayershell.layer: WlrLayer.Overlay
        
        // Leaving anchors unset/false centers the panel on your screen by default
        anchors {
            top: false
            bottom: false
            left: false
            right: false
        }

        // Main Catppuccin-themed container
        Rectangle {
            anchors.fill: parent
            color: "#1e1e2e" // Base
            radius: 12
            border.color: "#89b4fa" // Blue Accent
            border.width: 2

            Column {
                anchors.centerIn: parent
                spacing: 12

                Text {
                    text: "Quickshell Alive!"
                    font.pointSize: 18
                    font.bold: true
                    color: "#cdd6f4" // Text
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "Stack: CachyOS + Hyprland"
                    font.pointSize: 11
                    color: "#a6e3a1" // Green Accent
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}

