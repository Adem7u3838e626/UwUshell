#!/usr/bin/env python3
import os
import json
from getwallpaper import getwall
from activewindow import getactivewin

json_path = os.path.expanduser("~/.cache/wal/colors.json")
theme_path = os.path.expanduser("~/.config/quickshell/uwu/modules/Theme.qml")

wallpaper =getwall()
colors =[]
activewin=getactivewin()

with open(json_path, "r") as f:
    data = json.load(f)
    if "colors" in data:
        for name, hex_code in data["colors"].items():
            colors.append(f"{hex_code}")
    exit

try:
    with open(theme_path, "w") as theme:
        theme.write("import QtQuick 2.15\n")
        theme.write("pragma Singleton\n")
        theme.write("QtObject {\n")
        theme.write(f'    property string wallpaper: "{wallpaper}"\n')
        for i, color in enumerate(colors):
            theme.write(f'    property color color{i}: "{color}"\n')
            i+=1
        theme.write(f'property string activewindow: "{activewin}"')
        theme.write("}\n") 
except:
    print("error writing fille")
print(activewin)
