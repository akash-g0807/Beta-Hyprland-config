#!/bin/bash
flatpak --user override --filesystem=~/.themes
flatpak --user override --filesystem=~/.icons
flatpak override --filesystem=~/.themes:ro --filesystem=~/.icons:ro --user
