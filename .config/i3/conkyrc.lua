conky.config = {
    background = false,
    own_window = false,
    double_buffer = false,
    no_buffers = true,
    out_to_x = false,
    out_to_console = true,
    update_interval = 1.0,
    total_run_times = 0,
    use_spacer = "none",
    short_units = true,
    cpu_avg_samples = 2,
}

conky.text = [[ 
 ${upspeed wlp4s0}/s \
 ${downspeed wlp4s0}/s \
 ${cpu cpu0}% \
 $mem/$memmax \
 ${battery_percent}% \
${execi 1 amixer | grep -A10 'Master' | sed -rn 's/.*\[([0-9]+%)\].*\[(on|off)\]/\2 \1/p' | sed -n '1p' | sed 's/off.*/ /' | sed -r 's/on( [01234]?[0-9]%)/\1/' | sed -r 's/(on|) 0%/ 0%/' | sed -r 's/on//'} \
 ${time %a}, ${time %e %b} | ${time %I:%M %p} 
]]
