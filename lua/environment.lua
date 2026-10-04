-- Nvidia + Wayland environment (https://wiki.hypr.land/Nvidia/)
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("XCURSOR_THEME", "Qogir-dark")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Qogir-dark")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    cursor = { no_hardware_cursors = true },
})
