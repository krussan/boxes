#!/bin/sh
sudo -u vagrant dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/:0/ background-color "rgb(0,0,0)"
sudo -u vagrant dbus-launch gsettings set org.gnome.Terminal.Legacy.Profile:/:0/ foreground-color "rgb(198,198,198)"