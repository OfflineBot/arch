
#!/bin/bash

folder="$HOME/Scripts"

selected=$(find "$folder" -maxdepth 1 -type f -name "*.sh" -printf "%f\n" | rofi -dmenu -p "Select script")

if [[ -n "$selected" ]]; then
    bash "$folder/$selected"
fi
