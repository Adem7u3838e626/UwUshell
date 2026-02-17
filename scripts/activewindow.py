import subprocess
import json

def getactivewin():
    result = subprocess.run(
        ["hyprctl", "activewindow", "-j"],
        capture_output=True,
        text=True
    ).stdout

    data = json.loads(result)

    return (data.get("class", ""))
