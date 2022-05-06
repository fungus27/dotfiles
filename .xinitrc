nvidia-settings --config="~/.config/.nvidia-settings-rc" --load-config-only
xwallpaper --zoom ~/.config/wallpaper.png &
xmodmap ~/.config/speedswapper
xrdb -merge -I$HOME ~/.config/.Xresources
pulseaudio --start &
dwmblocks &
picom &
exec dwm
