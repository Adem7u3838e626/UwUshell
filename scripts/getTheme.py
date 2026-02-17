#!/usr/bin/env python3
import os
import json
from getwallpaper import getwall
json_path = os.path.expanduser("~/.cache/wal/colors.json")
theme_path = os.path.expanduser("~/.config/quickshell/uwu/modules/Theme.qml")

wallpaper =getwall()
colors =[]

with open(json_path, "r") as f:
    data = json.load(f)
    if "wallpaper" in data:
        wallpaper = (data["wallpaper"])
        print(wallpaper)
    if "colors" in data:
        for name, hex_code in data["colors"].items():
            colors.append(f"{hex_code}")
    else:
        pass
try:
    with open(theme_path, "w") as theme:
        theme.write("import QtQuick 2.15\n")
        theme.write("pragma Singleton\n")
        theme.write("QtObject {\n")
        theme.write(f'    property string wallpaper: "{wallpaper}"\n')
        for i, color in enumerate(colors):
            theme.write(f'    property color color{i}: "{color}"\n')
            i+=1
        theme.write("}\n") 
except:
    print("error writing fille")
