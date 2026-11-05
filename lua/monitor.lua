-- Monitors and workspace -> monitor binding
hl.monitor({ output = "eDP-1",     mode = "1920x1080@144", position = "auto",      scale = 1 })
hl.monitor({ output = "HDMI-A-1",  mode = "2560x1440@60",  position = "auto-left", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1",    default = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", default = true })
for i = 6, 9 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
end

-- Anything else (projectors, other external screens): preferred mode, placed automatically.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
