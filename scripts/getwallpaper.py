import os

waypaper = os.path.expanduser("~/.config/waypaper/config.ini")
wall=""

def getwall():
    with open(waypaper, "r") as paper:
        for line in paper :
            if "wallpaper" in line :
                return (line[11:len(line)])

wall = getwall()
output = os.system(f"wal -i {wall}")
print(output)

print(wall)
