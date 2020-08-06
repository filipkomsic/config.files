export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/local/bin/st
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export XDG_CURRENT_DESKTOP=XFCE
export XDG_CONFIG_DIRS=/etc/xdg

# Keyboard LED

xset led 3 &	

# MPD 

mpd

# Compositor	

picom -b &

# Bind Keys

sxhkd &

# Status Bar

/home/filip/scripts/check.sh &

# Wallpaper
hsetroot -cover /home/filip/Multimedia/Foto-Video/wallpapers/nature-sky-sunset-the-mountains-66997.jpg

#set keyboard layout and turn on the ability to toggle between us and ba

setxkbmap -layout us,ba -option 'grp:alt_caps_toggle'

#set caps to esc

setxkbmap -option caps:swapescape


