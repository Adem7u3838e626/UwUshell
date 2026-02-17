Item {

    id: root

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)

    readonly property Toplevel activeWindow: ToplevelManager.activeToplevel


    property string activeWindowAddress: `0x${activeWindow?.HyprlandToplevel?.address}`

    property bool focusingThisMonitor: HyprlandData.activeWorkspace?.monitor == monitor?.name

            font.pixelSize: Appearance.font.pixelSize.small

            color: Appearance.colors.colOnLayer0

            elide: Text.ElideRight

            text: root.focusingThisMonitor && root.activeWindow?.activated && root.biggestWindow ? 

                root.activeWindow?.title :

                (root.biggestWindow?.title) ?? `${Translation.tr("Workspace")} ${monitor?.activeWorkspace?.id ?? 1}`

        }


    }
