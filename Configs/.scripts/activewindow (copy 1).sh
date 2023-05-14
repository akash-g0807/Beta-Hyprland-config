#!/bin/bash

app_name=$(hyprctl activewindow -j | jq -r ".class")

codeinsiders='\b(?:(?!Workspace) - Visual Studio Code - Insiders)+\b'

if [[ $app_name =~ $codeinsiders ]]; then
    echo "VSCode Insiders"
elif [[ $app_name == *Hugo\ \(Workspace\)* ]]; then
    echo "VSCode Insiders Hugo"
elif [[ $app_name == *Configuração\ do\ Sistema* ]]; then
    echo "Configurações do Sistema do KDE"
elif [[ $app_name == *Dolphin* ]]; then
    echo "Gestor de Ficheiros Dolphin"
elif [[ $app_name == *Firefox\ Developer* ]]; then
    echo "Firefox Desenvolvedor"
elif [[ $app_name == *Google\ Chrome* ]]; then
    echo "Google Chrome Desenvolvedor"
elif [[ $app_name == *Alacritty* ]]; then
    echo "Terminal Alacritty "
elif [[ $app_name == *Mozilla\ Firefox* ]]; then
    echo "Firefox Estável"
elif [[ $app_name == nm-connection-editor* ]]; then
    echo "Editor de Conexão da Internet"
elif [[ $app_name == *Sublime\ Text* ]]; then
    echo "Sublime Text"
elif [[ $app_name == *kitty* ]]; then
    echo "Terminal kitty "
else
  swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused) | if (.type) == "workspace" then "Workspace \(.name)" else "\(.app_id) - \(.name)" end' | sed 's/"//g'
fi
