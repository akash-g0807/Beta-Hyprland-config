if grep open /proc/acpi/button/lid/LID*/state; then
    hyprctl keyword monitor "eDP-1, 3480x2400, 0x0, 2"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
        hyprctl keyword monitor "eDP-1, disable"
    fi
fi
