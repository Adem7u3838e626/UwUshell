import os
import socket

runtime_dir = os.environ.get("XDG_RUNTIME_DIR")
signature = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")

socket_path = f"{runtime_dir}/hypr/{signature}/.socket2.sock"

output_file = os.path.expanduser(
    "~/.config/quickshell/uwu/modules/ActiveWindow.qml"
)

os.makedirs(os.path.dirname(output_file), exist_ok=True)

with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
    s.connect(socket_path)

    while True:
        data = s.recv(4096).decode("utf-8")

        if not data:
            continue

        lines = data.splitlines()

        for line in lines:
            if line.startswith("activewindow>>"):
                win_class = line.split(">>")[1].strip()
                win_class_safe = win_class.replace('"', '\\"')

                qml_content = f""""import QtQuick 2.15
pragma Singleton
QtObject {
    property string wallpaper: '{win_class_safe}\n'
}
"""
                with open(output_file, "w") as f:
                    f.write(qml_content)

