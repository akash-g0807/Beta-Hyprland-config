flatpak --user override --env=GTK_THEME=Catppuccin-Latte-Standard-Blue-Light
flatpak --user override --env=ICON_THEME=Papirus-Light
flatpak --user override --env=XCURSOR_PATH=/home/$USER/.icons
flatpak --user override --env=XCURSOR_THEME=Nordzy-cursors-white
flatpak override --filesystem=~/.themes:ro --filesystem=~/.icons:ro --user
