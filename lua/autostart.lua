-- Autostart (NixOS)
hl.on("hyprland.start", function()
    -- Push the session environment (WAYLAND_DISPLAY, NIXOS_OZONE_WL, nvidia vars...)
    -- into systemd/dbus first, then start the polkit agent: on NixOS it is a user
    -- service (nixos-laptop modules/desktop.nix), not /usr/lib/polkit-gnome/...
    -- xdg-desktop-portal(-hyprland) is dbus-activated by programs.hyprland, so
    -- nothing to start by hand; scripts/xdg.sh restarts them if screen sharing breaks.
    hl.exec_cmd("dbus-update-activation-environment --systemd --all && systemctl --user start polkit-gnome-authentication-agent-1.service")

    hl.exec_cmd("dunst")
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("~/.config/waybar/launch.sh")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("xrdb ~/.Xresources")
    hl.exec_cmd("hyprctl setcursor Qogir-dark 24")
end)
