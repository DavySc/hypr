#!/usr/bin/env bash
# Restart the xdg desktop portals (screen sharing / file pickers).
# On NixOS they are dbus-activated systemd user services provided by
# programs.hyprland and xdg.portal, so there are no /usr/lib binaries to start.
dbus-update-activation-environment --systemd --all
systemctl --user restart xdg-desktop-portal-hyprland.service xdg-desktop-portal.service
