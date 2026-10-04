-- General look, decoration, layout and misc
hl.config({
    general = {
        gaps_in     = 0,
        gaps_out    = 0,
        border_size = 0,
        layout      = "dwindle",
    },

    decoration = {
        rounding = 10,
        active_opacity     = 1.0,
        inactive_opacity   = 0.8,
        fullscreen_opacity = 1.0,
        blur = {
            enabled        = true,
            size           = 6,
            passes         = 2,
            ignore_opacity = true,
            xray           = true,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})
