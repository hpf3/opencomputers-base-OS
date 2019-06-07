os.execute("wget -f https://raw.githubusercontent.com/hpf3/opencomputers-base-OS/master/individual/displays/induction%20monitor/design.lua /lib/design.lua")
os.execute("wget -f https://raw.githubusercontent.com/hpf3/opencomputers-base-OS/master/individual/displays/induction%20monitor/induction%20monitor.lua /autorun.lua")
require("computer").shutdown(true)