LOCATION="$HOME/.config/polybar"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q monitor1 -c "$LOCATION"/config.ini &
polybar -q monitor2 -c "$LOCATION"/config.ini &
