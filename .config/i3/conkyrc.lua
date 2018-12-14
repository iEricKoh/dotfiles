conky.config = {
    alignment = "none",
    background = false,
    own_window = false,
    out_to_x = true,
    own_window_type = "override",
    double_buffer = true,
    no_buffers = true,
    out_to_console = true,
    max_text_width = 0,
    short_units = true,
    update_interval = 1,
    total_run_times = 0,
    use_spacer = "none",
    short_units = true,
    use_xft = true,
    xftalpha = 1,
    override_utf8_locale = true,
    font = "Noto Sans",
    cpu_avg_samples = 6,
}

conky.text = [[ 
 ${upspeed wlp0s20f3}/s \
 ${downspeed wlp0s20f3}/s \
 ${cpu cpu0}% \
 $mem/$memmax \
 ${battery_percent}% \
${execi 1 amixer | grep -A10 'Master' | sed -rn 's/.*\[([0-9]+%)\].*\[(on|off)\]/\2 \1/p' | sed -n '1p' | sed 's/off.*/ /' | sed -r 's/on( [01234]?[0-9]%)/\1/' | sed -r 's/(on|) 0%/ 0%/' | sed -r 's/on//'} \
 ${time %a}, ${time %e %b} | ${time %I:%M %p} 
]]
