#!/bin/sh
#xrandr && xrandr --output HDMI2 --off --output HDMI1 --off --output DP1 --mode 1440x900 --pos 1920x0 --rotate normal --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
xrandr --dpi 120
feh --bg-fill '/home/finp/Picture/ar15&sopmod2.jpg'
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top &
polybar bottom &
numlockx

# Launch ss-qt5
ss-qt5
