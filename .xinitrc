export EDITOR=/usr/bin/nvim &	
export TERMINAL=/usr/local/bin/st &	
export PATH="${PATH}:${HOME}/scripts;${PATH}:${HOME}/.local/bin" &	
export SHELL=/bin/zsh &
export BROWSER=/usr/bin/brave-nightly 
export HISTFILE=/home/filip/.zhistory
picom --experimental-backends &
sxhkd -t 0.5 &
dwmblocks &
hsetroot -cover "/home/filip/media/wallpapers/high-rise-buildings-during-nighttime-1366957.jpg" &
/usr/bin/start-pulseaudio-x11 &
setxkbmap -layout us,ba -option 'grp:alt_caps_toggle' &
remaps.sh &
echo "disable" |sudo tee /proc/acpi/ibm/bluetooth &
echo 75 | sudo tee /sys/devices/platform/i8042/serio1/serio2/speed &
pidof -s runit &&
	pidof -s ! pidof -s pulseaudio >/dev/null 2>&1 &&
	setsid -f pulseaudio --start --exit-idle-time=-1 >/dev/null 2>&1 &
exec dwm
