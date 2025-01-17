#!/bin/sh

sed -ri 's/gtk-theme-name=.*/gtk-theme-name=Catppuccin-Mocha-Standard-Blue-Dark/g' ~/.config/gtk-3.0/settings.ini

sed -ri 's/gtk-icon-theme-name=.*/gtk-icon-theme-name=Adwaita/g' ~/.config/gtk-3.0/settings.ini

sed -ri 's/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Nordzy-cursors/g' ~/.config/gtk-3.0/settings.ini

sed -ri 's|Net/ThemeName.*|Net/ThemeName "Catppuccin-Mocha-Standard-Blue-Dark"|g' ~/.config/xsettingsd/xsettingsd.conf
sed -ri 's|Net/IconThemeName.*|Net/IconThemeName "ePapirus-Dark"|g' ~/.config/xsettingsd/xsettingsd.conf
sed -ri 's|Gtk/CursorThemeName.*|Gtk/CursorThemeName "Nordzy-cursors"|g' ~/.config/xsettingsd/xsettingsd.conf

flatpak override --filesystem=~/.themes:ro --filesystem=~/.icons:ro --user
flatpak --user override --env=GTK_THEME=Catppuccin-Mocha-Standard-Blue-Dark
flatpak --user override --env=ICON_THEME=Papirus-Dark
flatpak --user override --env=XCURSOR_PATH=/home/$USER/.icons
flatpak --user override --env=XCURSOR_THEME=Nordzy-cursors
flatpal --user override --env=XCURSOR_THEME=24
