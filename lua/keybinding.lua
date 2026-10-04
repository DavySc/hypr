-- Key bindings. Keep each bind on one line with a trailing "-- description":
-- scripts/keybindings.sh parses this file to build the cheat sheet.
local mainMod = "SUPER"
local dsp = hl.dsp

local function exec(cmd) return dsp.exec_cmd(cmd) end

-- Applications
hl.bind(mainMod .. " + RETURN", exec("ghostty"))  -- Terminal (ghostty)
hl.bind(mainMod .. " + W", exec("firefox"))  -- Browser (Firefox)
hl.bind(mainMod .. " + E", exec("thunar"))  -- File Explorer (Thunar)
hl.bind(mainMod .. " + C", exec("code"))  -- VSCode

-- Windows
hl.bind(mainMod .. " + Q", dsp.window.close())  -- Kill active window
hl.bind(mainMod .. " + F", dsp.window.fullscreen())  -- Set active window to fullscreen
hl.bind(mainMod .. " + T", dsp.window.float({ action = "toggle" }))  -- Toggle floating mode
hl.bind(mainMod .. " + S", dsp.layout("togglesplit"))  -- Toggle split
hl.bind(mainMod .. " + H", dsp.focus({ direction = "left" }))  -- Move focus left
hl.bind(mainMod .. " + L", dsp.focus({ direction = "right" }))  -- Move focus right
hl.bind(mainMod .. " + K", dsp.focus({ direction = "up" }))  -- Move focus up
hl.bind(mainMod .. " + J", dsp.focus({ direction = "down" }))  -- Move focus down
hl.bind(mainMod .. " + mouse:272", dsp.window.drag(), { mouse = true })  -- Move window with the mouse
hl.bind(mainMod .. " + mouse:273", dsp.window.resize(), { mouse = true })  -- Resize window with the mouse
hl.bind(mainMod .. " + SHIFT + L", dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })  -- Increase window width
hl.bind(mainMod .. " + SHIFT + H", dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })  -- Reduce window width
hl.bind(mainMod .. " + SHIFT + J", dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })  -- Reduce window height
hl.bind(mainMod .. " + SHIFT + K", dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })  -- Increase window height
hl.bind(mainMod .. " + G", dsp.group.toggle())  -- Toggle window group

-- Actions
hl.bind(mainMod .. " + P", exec("~/.config/hypr/scripts/screenshot.sh"))  -- Take a screenshot
hl.bind(mainMod .. " + X", exec("wlogout"))  -- Start wlogout
hl.bind(mainMod .. " + CTRL + A", exec("rofi -show drun -replace -i -theme ~/.config/rofi/launchers/type-1/style-6.rasi"))  -- Open application launcher
hl.bind(mainMod .. " + CTRL + H", exec("~/.config/hypr/scripts/keybindings.sh"))  -- Show keybindings
hl.bind(mainMod .. " + SHIFT + B", exec("~/.config/waybar/launch.sh"))  -- Reload waybar
hl.bind(mainMod .. " + SHIFT + R", exec("~/.config/hypr/scripts/loadconfig.sh"))  -- Reload hyprland config
hl.bind(mainMod .. " + CTRL + C", exec("~/.config/scripts/cliphist.sh"))  -- Open clipboard manager

-- Workspaces (CTRL + n to switch, mainMod + SHIFT + n to move a window)
for i = 1, 10 do
    local key = i % 10 -- workspace 10 lives on key 0
    hl.bind("CTRL + " .. key, dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + mouse_down", dsp.focus({ workspace = "e+1" }))  -- Open next workspace
hl.bind(mainMod .. " + mouse_up", dsp.focus({ workspace = "e-1" }))  -- Open previous workspace
hl.bind(mainMod .. " + CTRL + down", dsp.focus({ workspace = "empty" }))  -- Open the next empty workspace

-- Fn keys
local fn = { locked = true, repeating = true }
hl.bind("XF86MonBrightnessUp", exec("brightnessctl -q s +10%"), fn)  -- Increase brightness by 10%
hl.bind("XF86MonBrightnessDown", exec("brightnessctl -q s 10%-"), fn)  -- Reduce brightness by 10%
hl.bind("XF86AudioRaiseVolume", exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), fn)  -- Increase volume by 5%
hl.bind("XF86AudioLowerVolume", exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), fn)  -- Reduce volume by 5%
hl.bind("XF86AudioMute", exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })  -- Toggle mute
hl.bind("XF86AudioMicMute", exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })  -- Toggle microphone
hl.bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })  -- Audio play pause
hl.bind("XF86AudioPause", exec("playerctl pause"), { locked = true })  -- Audio pause
hl.bind("XF86AudioNext", exec("playerctl next"), { locked = true })  -- Audio next
hl.bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })  -- Audio previous
hl.bind("XF86Calculator", exec("qalculate-gtk"))  -- Open calculator
hl.bind("XF86ScreenSaver", exec("hyprlock"))  -- Open screenlock
