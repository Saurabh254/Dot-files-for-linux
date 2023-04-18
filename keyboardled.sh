!/bin/bash
# genmon script to display status of keyboard LEDS
# genmon properties:
#   Command = path to this script
#   Label = optional Label preceeding output
#   Period = how often to check the status - the lower the number the quicker the response
#   Font = the font to use - monospace fonts keep the widget from resizing

# configuration
FG="white" # foreground colour
OBC="red" # background colour of cell text if active

# code
STATE=($(xset q | grep Caps\ Lock | awk '{print $4" "$8" "$12}'))
CAPS=$([[ ${STATE[0]} == "on" ]] && echo "<span foreground='$FG' background='$OBC'>C</span>" || echo "<span foreground='$FG'>c</span>")
NUM=$([[ ${STATE[1]} == "on" ]] && echo "<span foreground='$FG' background='$OBC'>N</span>" || echo "<span foreground='$FG'>n</span>")
SCROLL=$([[ ${STATE[2]} == "on" ]] && echo "<span foreground='$FG' background='$OBC'>S</span>" || echo "<span foreground='$FG'>s</span>")

# genmon
echo "<txt>$CAPS$NUM$SCROLL</txt>"
echo "<tool>CAPS = ${STATE[0]}"
echo "NUM = ${STATE[1]}"
echo "SCROLL = ${STATE[2]}</tool>"

exit 0