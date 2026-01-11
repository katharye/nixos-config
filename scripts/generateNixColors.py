import json
from pathlib import Path 

colorFile = Path.home() / ".cache" / "wal" / "colors.json"
nixFile = Path.home() / "nix" / "home-manager" / "colors.nix"

with open(colorFile, "r") as file:
    data = json.load(file)

with open(nixFile, "w") as file:
    file.write("{\n")
    
    file.write(f'\tbackground = "{data["special"]["background"]}";\n')    
    file.write(f'\tforeground = "{data["special"]["foreground"]}";\n')    
    file.write(f'\tcursor = "{data["special"]["cursor"]}";\n')

    for i in range(0, 16):
        file.write(f'\tcolor{i} = "{data["colors"][f"color{i}"]}";\n')

    file.write("}\n")