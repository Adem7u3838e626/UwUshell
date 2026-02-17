#!/usr/bin/env python3
import os
import socket
import json

# مسار socket الخاص بـ Hyprland
runtime_dir = os.environ.get("XDG_RUNTIME_DIR")
signature = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
socket_path = f"{runtime_dir}/hypr/{signature}/.socket2.sock"

# مسار حفظ JSON
output_file = os.path.expanduser("~/.cache/activewindow.json")

# إنشاء اتصال بالـ Unix socket
with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
    s.connect(socket_path)

    while True:
        data = s.recv(1024).decode("utf-8")
        if not data:
            continue
        lines = data.splitlines()
        for line in lines:
            if line.startswith("activewindow>>"):
                win_class = line.split(">>")[1].strip()
                # كتابة اسم النافذة النشطة في ملف JSON
                with open(output_file, "w") as f:
                    json.dump({"class": win_class}, f)

