#!/bin/sh

sed -ri 's/gtk-theme-name=.*/gtk-theme-name=Catpuccin-Latte-Standard-Blue-Light/g' ~/.config/gtk-3.0/settings.ini

sed -ri 's/gtk-icon-theme-name=.*/gtk-icon-theme-name=Adwaita/g' ~/.config/gtk-3.0/settings.ini

sed -ri 's/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Nordzy-cursors-white/g' ~/.config/gtk-3.0/settings.ini
