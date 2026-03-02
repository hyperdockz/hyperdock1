#!/bin/bash
set -euo pipefail

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                                                                              ║
# ║   ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ██████╗  ██████╗ ██╗  ██╗        ║
# ║   ██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗██║ ██╔╝        ║
# ║   ███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝██║  ██║██║   ██║█████╔╝         ║
# ║   ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██║  ██║██║   ██║██╔═██╗         ║
# ║   ██║  ██║   ██║   ██║     ███████╗██║  ██║████████╔╝╚██████╔╝██║  ██╗        ║
# ║   ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝  ╚═════╝ ╚═╝  ╚═╝        ║
# ║                                                                              ║
# ║                    V M   M A N A G E R   v 4 . 0   U L T I M A T E           ║
# ║                                                                              ║
# ║                         ◈  C Y B E R P U N K   E D I T I O N  ◈              ║
# ║                                                                              ║
# ╚══════════════════════════════════════════════════════════════════════════════╝
#                                                                                
#   Made by Deniz  |  Hyperdock Systems  |  2024                                 

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ EXTENDED NEON COLOR PALETTE ═══════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_R='\033[0m'
_BD='\033[1m'
_DM='\033[2m'
_IT='\033[3m'
_UL='\033[4m'
_BL='\033[5m'
_RV='\033[7m'

# Deep Space Blues
B00='\033[38;5;16m'    # Void black
B0='\033[38;5;17m'     # Deepest blue
B1='\033[38;5;18m'     # Midnight blue
B2='\033[38;5;19m'     # Navy blue
B3='\033[38;5;20m'     # Royal blue
B4='\033[38;5;27m'     # Azure
B5='\033[38;5;33m'     # Ocean blue
B6='\033[38;5;39m'     # Cyan
B7='\033[38;5;45m'     # Electric cyan
B8='\033[38;5;51m'     # Ice blue
B9='\033[38;5;87m'     # Neon cyan

# Cyberpunk Purples
P0='\033[38;5;53m'
P1='\033[38;5;54m'
P2='\033[38;5;55m'
P3='\033[38;5;56m'
P4='\033[38;5;93m'
P5='\033[38;5;129m'
P6='\033[38;5;135m'
P7='\033[38;5;141m'
P8='\033[38;5;147m'
P9='\033[38;5;177m'

# Neon Pinks & Magentas
M0='\033[38;5;125m'
M1='\033[38;5;126m'
M2='\033[38;5;127m'
M3='\033[38;5;161m'
M4='\033[38;5;162m'
M5='\033[38;5;163m'
M6='\033[38;5;197m'
M7='\033[38;5;198m'
M8='\033[38;5;199m'
M9='\033[38;5;205m'

# Matrix Greens
G0='\033[38;5;22m'
G1='\033[38;5;28m'
G2='\033[38;5;34m'
G3='\033[38;5;40m'
G4='\033[38;5;46m'
G5='\033[38;5;47m'
G6='\033[38;5;48m'
G7='\033[38;5;49m'
G8='\033[38;5;82m'
G9='\033[38;5;83m'

# Fire Oranges & Reds
R0='\033[38;5;52m'
R1='\033[38;5;88m'
R2='\033[38;5;124m'
R3='\033[38;5;160m'
R4='\033[38;5;166m'
R5='\033[38;5;172m'
R6='\033[38;5;178m'
R7='\033[38;5;184m'
R8='\033[38;5;208m'
R9='\033[38;5;214m'

# Utility Colors
WH='\033[1;97m'
LG='\033[38;5;252m'
DG='\033[38;5;238m'
GR='\033[38;5;240m'
OK='\033[38;5;82m'
WN='\033[38;5;220m'
ER='\033[38;5;196m'
IN='\033[38;5;75m'

# Background Colors (for effects)
BG_B='\033[48;5;17m'
BG_P='\033[48;5;54m'
BG_C='\033[48;5;39m'
BG_G='\033[48;5;28m'
BG_R='\033[48;5;160m'

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ GEOMETRY & DIMENSIONS ═════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

W=80
IW=78
MW=76

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ ADVANCED DRAWING PRIMITIVES ═══════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_ln() { printf "%b%s%b\n" "$2" "$1" "$_R"; }

_top()    { printf "%b╔%s╗%b\n" "$B4" "$(printf '═%.0s' $(seq 1 $IW))" "$_R"; }
_bot()    { printf "%b╚%s╝%b\n" "$B4" "$(printf '═%.0s' $(seq 1 $IW))" "$_R"; }
_mid()    { printf "%b╠%s╣%b\n" "$B5" "$(printf '═%.0s' $(seq 1 $IW))" "$_R"; }
_thin()   { printf "  %b%s%b\n" "$B2" "$(printf '─%.0s' $(seq 1 72))" "$_R"; }
_dbl()    { printf "  %b%s%b\n" "$B3" "$(printf '═%.0s' $(seq 1 72))" "$_R"; }
_empty()  { printf "%b║%*s║%b\n" "$B4" $IW "" "$_R"; }

_row() {
    local txt="$1"
    local len=${#txt}
    local pad=$(( IW - len - 1 ))
    printf "%b║%b %s%*s%b║%b\n" "$B4" "$_R" "$txt" $pad "" "$B4" "$_R"
}

_rowc() {
    local txt="$1"
    local vis_len=$(echo -e "$txt" | sed 's/\x1b\[[0-9;]*m//g' | wc -c)
    (( vis_len-- ))
    local lpad=$(( (IW - vis_len) / 2 ))
    local rpad=$(( IW - vis_len - lpad ))
    printf "%b║%b%*s%b%*s%b║%b\n" "$B4" "$_R" $lpad "" "$txt" $rpad "" "$B4" "$_R"
}

_rowg() {
    local txt="$1" c1="$2" c2="$3"
    local vis_len=$(echo -e "$txt" | sed 's/\x1b\[[0-9;]*m//g' | wc -c)
    (( vis_len-- ))
    local lpad=$(( (IW - vis_len) / 2 ))
    local rpad=$(( IW - vis_len - lpad ))
    printf "%b║%b%*s%b%b%b%*s%b║%b\n" "$c1" "$_R" $lpad "" "$c2" "$txt" $rpad "" "$c1" "$_R"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ NEON GLOW EFFECTS ═════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_glow_text() {
    local text="$1" color="${2:-$B7}"
    echo -e "${color}${_BL}${text}${_R}"
}

_neon_pulse() {
    local text="$1"
    for i in 1 2 3 2 1; do
        local c="B$i"
        eval "echo -ne \"\${$c}\""
        echo -ne "$text\r"
        sleep 0.08
    done
    echo -e "${_R}$text"
}

_glitch_text() {
    local text="$1"
    local chars="!@#$%^&*()_+-=[]{}|;:,.<>?"
    for ((i=0; i<${#text}; i++)); do
        local orig="${text:$i:1}"
        if (( RANDOM % 3 == 0 )); then
            local glitch="${chars:$((RANDOM % ${#chars})):1}"
            echo -ne "${ER}${glitch}${_R}"
            sleep 0.01
            echo -ne "\b${orig}"
        else
            echo -n "$orig"
        fi
    done
    echo
}

_rainbow_text() {
    local text="$1"
    local colors=($R4 $R6 $R8 $R9 $G4 $G6 $G8 $B4 $B6 $B8 $P4 $P6)
    for ((i=0; i<${#text}; i++)); do
        local c=${colors[$((i % ${#colors[@]}))]}
        echo -ne "${c}${text:$i:1}"
    done
    echo -e "${_R}"
}

_gradient_text() {
    local text="$1" start="$2" end="$3"
    local len=${#text}
    for ((i=0; i<len; i++)); do
        local ratio=$(( i * 100 / len ))
        echo -ne "${start}${text:$i:1}"
    done
    echo -e "${_R}"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ PARTICLE & MATRIX EFFECTS ═════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_matrix_rain() {
    local duration="${1:-2}"
    local cols=$(tput cols)
    local rows=$(tput lines)
    local chars="ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜﾝ0123456789"
    
    tput civis
    local start=$(date +%s)
    while (( $(date +%s) - start < duration )); do
        local x=$(( RANDOM % cols ))
        local char="${chars:$((RANDOM % ${#chars})):1}"
        local intensity=$(( RANDOM % 3 ))
        case $intensity in
            0) echo -ne "\033[$((RANDOM % rows + 1));${x}H${G0}${char}" ;;
            1) echo -ne "\033[$((RANDOM % rows + 1));${x}H${G4}${char}" ;;
            2) echo -ne "\033[$((RANDOM % rows + 1));${x}H${G9}${_BD}${char}" ;;
        esac
    done
    tput cnorm
    clear
}

_particle_burst() {
    local particles=("●" "◆" "★" "▪" "■" "⬟" "⬢")
    local colors=($B6 $B8 $P6 $P8 $M6 $M8 $G6 $G8)
    
    for ((i=0; i<30; i++)); do
        local p="${particles[$((RANDOM % ${#particles[@]}))]}"
        local c="${colors[$((RANDOM % ${#colors[@]}))]}"
        local x=$(( RANDOM % 70 + 5 ))
        local y=$(( RANDOM % 20 + 2 ))
        echo -ne "\033[$y;${x}H${c}${p}${_R}"
        sleep 0.02
    done
    sleep 0.3
    clear
}

_scanline_effect() {
    local y="$1"
    echo -ne "\033[$y;1H${BG_B}$(printf ' %.0s' $(seq 1 $(tput cols)))${_R}"
    sleep 0.03
    echo -ne "\033[$y;1H$(printf ' %.0s' $(seq 1 $(tput cols)))"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ STATUS BADGES WITH EFFECTS ════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_info()    { printf "\n  %b◈%b  %b%s%b\n" "$B6" "$_R" "$LG" "$*" "$_R"; }
_ok()      { printf "  %b✓%b  %b%s%b\n" "$OK" "$_R" "$LG" "$*" "$_R"; }
_warn()    { printf "  %b▲%b  %b%s%b\n" "$WN" "$_R" "$LG" "$*" "$_R"; }
_err()     { printf "  %b✗%b  %b%s%b\n" "$ER" "$_R" "$LG" "$*" "$_R"; }
_inp()     { printf "  %b›%b  %b%s%b " "$B8" "$_R" "$WH" "$*" "$_R"; }
_label()   { printf "  %b%-20s%b  %b:%b  %b%s%b\n" "$B5" "$1" "$_R" "$DG" "$_R" "$WH" "$2" "$_R"; }
_badge()   { printf "  %b[ %s ]%b\n" "$B6" "$1" "$_R"; }

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ ADVANCED SPINNER ANIMATIONS ═══════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_spin() {
    local msg="$1"
    local frames='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local colors=($B4 $B5 $B6 $B7 $B8 $B7 $B6 $B5)
    local i=0
    while true; do
        local c="${colors[$((i % ${#colors[@]}))]}"
        local f="${frames:$((i % ${#frames})):1}"
        printf "\r  %b%s%b  %b%s%b   " "$c" "$f" "$_R" "$DG" "$msg" "$_R"
        sleep 0.06
        (( i++ ))
    done
}

_spin_neon() {
    local msg="$1"
    local frames=('▏' '▎' '▍' '▌' '▋' '▊' '▉' '█' '▉' '▊' '▋' '▌' '▍' '▎' '▏')
    local i=0
    while true; do
        local idx=$((i % ${#frames[@]}))
        local intensity=$(( idx < 7 ? idx + 2 : 16 - idx ))
        local c="B$intensity"
        eval "local col=\"\${$c}\""
        printf "\r  %b%s%b  %b%s%b   " "$col" "${frames[$idx]}" "$_R" "$DG" "$msg" "$_R"
        sleep 0.04
        (( i++ ))
    done
}

_spin_stop() { 
    kill "$1" 2>/dev/null 
    printf "\r  %b✓%b  %b%-50s%b\n" "$OK" "$_R" "$LG" "Done" "$_R" 
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ PROGRESS BARS WITH EFFECTS ════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_progress() {
    local pct=$1 msg="${2:-}"
    local filled=$(( pct * 50 / 100 ))
    local empty=$(( 50 - filled ))
    local bar=""
    
    for (( i=0; i<filled; i++ )); do
        local ci=$(( i * 8 / 50 ))
        case $ci in
            0) bar+="${B1}█" ;;
            1) bar+="${B2}█" ;;
            2) bar+="${B3}█" ;;
            3) bar+="${B4}█" ;;
            4) bar+="${B5}█" ;;
            5) bar+="${B6}█" ;;
            6) bar+="${B7}█" ;;
            *) bar+="${B8}█" ;;
        esac
    done
    for (( i=0; i<empty; i++ )); do bar+="${DG}░"; done
    
    printf "\r  %b[%b%b%b]%b  %b%3d%%%b  %b%-30s%b   " "$DG" "$_R" "$bar" "$DG" "$_R" "$B6" "$pct" "$_R" "$LG" "$msg" "$_R"
}

_progress_rainbow() {
    local pct=$1 msg="${2:-}"
    local filled=$(( pct * 50 / 100 ))
    local empty=$(( 50 - filled ))
    local bar=""
    local colors=($R4 $R6 $R8 $G4 $G6 $G8 $B4 $B6 $B8 $P4 $P6)
    
    for (( i=0; i<filled; i++ )); do
        local c=${colors[$((i % ${#colors[@]}))]}
        bar+="${c}█"
    done
    for (( i=0; i<empty; i++ )); do bar+="${DG}░"; done
    
    printf "\r  %b[%b%b%b]%b  %b%3d%%%b  %b%-30s%b   " "$DG" "$_R" "$bar" "$DG" "$_R" "$M6" "$pct" "$_R" "$LG" "$msg" "$_R"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ WAVES & ANIMATED BORDERS ══════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_wave_line() {
    local width=${1:-78}
    local wave_chars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" "▇" "▆" "▅" "▄" "▃" "▂")
    local colors=($B3 $B4 $B5 $B6 $B7 $B8 $B7 $B6 $B5 $B4)
    
    for ((i=0; i<width; i++)); do
        local wc="${wave_chars[$(( (i + wave_offset) % ${#wave_chars[@]} ))]}"
        local col="${colors[$((i % ${#colors[@]}))]}"
        echo -ne "${col}${wc}"
    done
    echo -e "${_R}"
    ((wave_offset++))
}

_animated_border() {
    local text="$1"
    local border_chars=("◐" "◓" "◑" "◒")
    local colors=($B5 $B6 $B7 $B8)
    
    for ((frame=0; frame<4; frame++)); do
        local bc="${border_chars[$frame]}"
        local col="${colors[$frame]}"
        printf "\r  %b%s%b %s %b%s%b" "$col" "$bc" "$_R" "$text" "$col" "$bc" "$_R"
        sleep 0.1
    done
    printf "\r  %b◆%b %s %b◆%b\n" "$B6" "$_R" "$text" "$B6" "$_R"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ HYPERDOCK LOGO ASCII ART ══════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_logo_large() {
    clear
    echo ""
    echo -e "${B0}           ████████╗██████╗  █████╗ ███╗   ██╗███████╗${B1}███████╗██╗██████╗ ████████╗${B2}   ${B3}██╗  ██╗${B4}██╗   ██╗${B5}██████╗ ███████╗██████╗ ${B6}██████╗  ██████╗ ██╗  ██╗${B7}████████╗${B8}"
    echo -e "${B0}           ╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝${B1}██╔════╝██║██╔══██╗╚══██╔══╝${B2}   ${B3}██║  ██║${B4}╚██╗ ██╔╝${B5}██╔══██╗██╔════╝██╔══██╗${B6}██╔══██╗██╔═══██╗██║ ██╔╝${B7}╚══██╔══╝${B8}"
    echo -e "${B0}              ██║   ██████╔╝███████║██╔██╗ ██║███████╗${B1}█████╗  ██║██████╔╝   ██║   ${B2}   ${B3}███████║${B4} ╚████╔╝ ${B5}██████╔╝█████╗  ██████╔╝${B6}██║  ██║██║   ██║█████╔╝ ${B7}   ██║   ${B8}"
    echo -e "${B0}              ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║${B1}██╔══╝  ██║██╔══██╗   ██║   ${B2}   ${B3}██╔══██║${B4}  ╚██╔╝  ${B5}██╔═══╝ ██╔══╝  ██╔══██╗${B6}██║  ██║██║   ██║██╔═██╗ ${B7}   ██║   ${B8}"
    echo -e "${B0}              ██║   ██║  ██║██║  ██║██║ ╚████║███████║${B1}██║     ██║██║  ██║   ██║   ${B2}   ${B3}██║  ██║${B4}   ██║   ${B5}██║     ███████╗██║  ██║${B6}██████╔╝╚██████╔╝██║  ██╗${B7}   ██║   ${B8}"
    echo -e "${B0}              ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝${B1}╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ${B2}   ${B3}╚═╝  ╚═╝${B4}   ╚═╝   ${B5}╚═╝     ╚══════╝╚═╝  ╚═╝${B6}╚═════╝  ╚═════╝ ╚═╝  ╚═╝${B7}   ╚═╝   ${B8}"
    echo ""
    echo -e "${P4}                                    ╔═══════════════════════════════════════════════════════════╗${P5}"
    echo -e "${P4}                                    ║${P6}     V I R T U A L   M A C H I N E   M A N A G E R       ${P5}║"
    echo -e "${P4}                                    ║${P7}              C Y B E R P U N K   E D I T I O N            ${P5}║"
    echo -e "${P4}                                    ╚═══════════════════════════════════════════════════════════╝${P5}"
    echo ""
    echo -e "${DG}                                                          v4.0 ULTIMATE | Made by Deniz${_R}"
    echo ""
}

_logo_compact() {
    echo ""
    echo -e "  ${B4}${_BD}╔╦╗${B5}┬ ┬${B6}┬─┐${B7}┌─┐${B8}┬┌─${P4}╔╦╗${P5}┌─┐${P6}┌─┐${P7}┬┌─${_R}  ${G4}${_BD}╦${G5}┌┐┌${G6}┬${G7}┌─┐${G8}┌─┐${G9}┌─┐${_R}"
    echo -e "  ${B4}${_BD} ║ ${B5}├─┤${B6}├┬┘${B7}├─┤${B8}├┴┐${P4} ║║${P5}│ │${P6}│ │${P7}├┴┐${_R}  ${G4}${_BD}║${G5}│││${G6}│${G7}└─┐${G8}├┤ ${G9}├─┘${_R}"
    echo -e "  ${B4}${_BD} ╩ ${B5}┴ ┴${B6}┴└─${B7}┴ ┴${B8}┴ ┴${P4}═╩╝${P5}└─┘${P6}└─┘${P7}┴ ┴${_R}  ${G4}${_BD}╩${G5}┘└┘${G6}┴${G7}└─┘${G8}└  ${G9}┴  ${_R}"
    echo ""
}

_logo_mini() {
    echo -e "  ${B6}${_BD}◈ HYPERDOCK ${_R}${DG}|${_R} ${B7}VM Manager v4.0${_R} ${DG}|${_R} ${P6}by Deniz${_R}"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ ADVANCED BOOT SEQUENCE ════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_boot() {
    clear
    
    # Matrix rain intro
    _matrix_rain 1
    
    # Particle burst
    _particle_burst
    
    # Show large logo
    _logo_large
    
    # Boot messages with scanline effect
    local boot_msgs=(
        "Initializing Hyperdock Core Systems..."
        "Loading VM Registry Database..."
        "Mounting Virtual Storage Arrays..."
        "Calibrating QEMU Hypervisor..."
        "Establishing Network Bridges..."
        "Syncing Cloud-Init Templates..."
        "Verifying KVM Acceleration..."
        "Loading OS Catalogue..."
        "Optimizing Memory Pools..."
        "All Systems Nominal"
    )
    
    echo ""
    for i in "${!boot_msgs[@]}"; do
        local pct=$(( (i+1) * 100 / ${#boot_msgs[@]} ))
        _progress_rainbow $pct "${boot_msgs[$i]}"
        sleep 0.15
    done
    
    printf "\n\n"
    _ok "System initialization complete"
    sleep 0.5
    
    # Success animation
    for c in $B4 $B5 $B6 $B7 $B8 $B7 $B6 $B5; do
        printf "\r  %b╔═══════════════════════════════════════════════════════════════╗%b\n" "$c" "$_R"
        printf "  %b║%b                                                               %b║%b\n" "$c" "$_R" "$c" "$_R"
        printf "  %b║%b     %bSYSTEM READY%b                                              %b║%b\n" "$c" "$_R" "$WH${_BD}" "$_R" "$c" "$_R"
        printf "  %b║%b                                                               %b║%b\n" "$c" "$_R" "$c" "$_R"
        printf "  %b╚═══════════════════════════════════════════════════════════════╝%b\n" "$c" "$_R"
        sleep 0.05
        printf "\033[4A"
    done
    printf "\033[4B\n"
    sleep 0.3
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ BANNER WITH EFFECTS ═══════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_banner() {
    clear
    echo ""
    _logo_compact
    _thin
    echo ""
}

_section() {
    echo ""
    printf "  %b◈◈◈%b  %b%s%b\n" "$B6" "$_R" "$WH${_BD}" "$1" "$_R"
    _thin
    echo ""
}

_section_neon() {
    echo ""
    local title="$1"
    local len=${#title}
    local pad=$(( (72 - len - 8) / 2 ))
    
    printf "  "
    for ((i=0; i<pad; i++)); do printf "%b═" "$B3"; done
    printf "%b◈%b %b%s%b %b◈%b" "$B5" "$_R" "$WH${_BD}" "$title" "$_R" "$B5" "$_R"
    for ((i=0; i<pad; i++)); do printf "%b═" "$B3"; done
    echo -e "${_R}"
    _thin
    echo ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ PAUSE WITH STYLE ══════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_pause() {
    echo ""
    _thin
    printf "  %b↵%b  %bPress %bEnter%b to continue%b " "$B8" "$_R" "$DG" "$WH" "$DG" "$_R"
    read -r
}

_pause_neon() {
    echo ""
    local blink_chars=("▐" "▌" "▐" "▌")
    for i in {0..3}; do
        printf "\r  %b%s%b  %bPress %bEnter%b to continue%b " "$B7" "${blink_chars[$i]}" "$_R" "$DG" "$WH" "$DG" "$_R"
        sleep 0.15
    done
    read -r
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ VALIDATION FUNCTIONS ══════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_validate() {
    local type=$1 val=$2
    case $type in
        number) 
            [[ "$val" =~ ^[0-9]+$ ]] && return 0
            _err "Must be a valid number"
            return 1
            ;;
        size)   
            [[ "$val" =~ ^[0-9]+[GgMmTt]$ ]] && return 0
            _err "Use format: 20G, 512M, or 2T"
            return 1
            ;;
        port)   
            [[ "$val" =~ ^[0-9]+$ ]] && (( val >= 1024 && val <= 65535 )) && return 0
            _err "Valid port range: 1024-65535"
            return 1
            ;;
        name)   
            [[ "$val" =~ ^[a-zA-Z0-9_-]+$ ]] && return 0
            _err "Only letters, numbers, hyphens, and underscores allowed"
            return 1
            ;;
        user)   
            [[ "$val" =~ ^[a-z_][a-z0-9_-]*$ ]] && return 0
            _err "Must start with letter/underscore, lowercase only"
            return 1
            ;;
    esac
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ DEPENDENCY CHECK ══════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_deps() {
    local deps=("qemu-system-x86_64" "wget" "cloud-localds" "qemu-img" "lsof")
    local missing=()
    
    for d in "${deps[@]}"; do
        command -v "$d" &>/dev/null || missing+=("$d")
    done
    
    if (( ${#missing[@]} )); then
        _banner
        _section_neon "MISSING DEPENDENCIES"
        for m in "${missing[@]}"; do 
            _err "$m"
        done
        echo ""
        _info "Install with:"
        echo -e "  ${WH}sudo apt install qemu-system cloud-image-utils wget lsof${_R}"
        echo ""
        exit 1
    fi
    
    _ok "All dependencies verified"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ CLEANUP ═══════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_cleanup() { 
    rm -f user-data meta-data 2>/dev/null
    tput cnorm 2>/dev/null || true
}
trap _cleanup EXIT

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ IMAGE LOCK CHECK ══════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_chklock() {
    local img=$1 vm=$2
    
    if lsof "$img" 2>/dev/null | grep -q qemu-system; then
        _warn "Image is locked by another QEMU process"
        local pid
        pid=$(lsof "$img" 2>/dev/null | grep qemu-system | awk '{print $2}' | head -1)
        
        if [[ -n "$pid" ]]; then
            _info "PID: $pid"
            if ps -p "$pid" -o cmd= | grep -q "$vm"; then
                _inp "Same VM detected — kill and restart? [y/N]: "
                read -r k
                [[ "$k" =~ ^[Yy]$ ]] || return 1
                kill "$pid" 2>/dev/null
                sleep 2
                kill -0 "$pid" 2>/dev/null && kill -9 "$pid" 2>/dev/null
                return 0
            fi
            _err "Different QEMU instance is using this image"
            return 1
        fi
        return 1
    fi
    
    local lf="${img}.lock"
    if [[ -f "$lf" ]]; then
        _warn "Lock file found: $lf"
        if find "$lf" -mmin +5 &>/dev/null; then
            _warn "Lock appears stale (>5 min)"
            _inp "Remove stale lock? [y/N]: "
            read -r r
            [[ "$r" =~ ^[Yy]$ ]] && rm -f "$lf" && _ok "Removed stale lock" && return 0
        fi
        return 1
    fi
    return 0
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ VM REGISTRY ═══════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_vm_list() {
    find "$VM_DIR" -name "*.conf" -exec basename {} .conf \; 2>/dev/null | sort
}

_vm_load() {
    local cfg="$VM_DIR/$1.conf"
    [[ -f "$cfg" ]] || { _err "Config for '$1' not found"; return 1; }
    
    unset VM_NAME OS_TYPE CODENAME IMG_URL HOSTNAME USERNAME PASSWORD \
          DISK_SIZE MEMORY CPUS SSH_PORT GUI_MODE PORT_FORWARDS IMG_FILE SEED_FILE CREATED 2>/dev/null || true
    source "$cfg"
}

_vm_save() {
    cat > "$VM_DIR/$VM_NAME.conf" <<EOF
VM_NAME="$VM_NAME"
OS_TYPE="$OS_TYPE"
CODENAME="$CODENAME"
IMG_URL="$IMG_URL"
HOSTNAME="$HOSTNAME"
USERNAME="$USERNAME"
PASSWORD="$PASSWORD"
DISK_SIZE="$DISK_SIZE"
MEMORY="$MEMORY"
CPUS="$CPUS"
SSH_PORT="$SSH_PORT"
GUI_MODE="$GUI_MODE"
PORT_FORWARDS="$PORT_FORWARDS"
IMG_FILE="$IMG_FILE"
SEED_FILE="$SEED_FILE"
CREATED="$CREATED"
EOF
    _ok "Config saved → $VM_DIR/$VM_NAME.conf"
}

_vm_running() {
    pgrep -f "qemu-system.*$1" &>/dev/null && return 0
    _vm_load "$1" 2>/dev/null && pgrep -f "qemu-system.*$IMG_FILE" &>/dev/null
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ ENHANCED OS CATALOGUE ═════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

declare -A OS_CATALOGUE=(
    # Ubuntu
    ["Ubuntu 20.04 LTS (Focal)"]="ubuntu|focal|https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img|ubuntu20|ubuntu|ubuntu"
    ["Ubuntu 22.04 LTS (Jammy)"]="ubuntu|jammy|https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img|ubuntu22|ubuntu|ubuntu"
    ["Ubuntu 24.04 LTS (Noble)"]="ubuntu|noble|https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img|ubuntu24|ubuntu|ubuntu"
    
    # Debian
    ["Debian 11 (Bullseye)"]="debian|bullseye|https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2|debian11|debian|debian"
    ["Debian 12 (Bookworm)"]="debian|bookworm|https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2|debian12|debian|debian"
    ["Debian 13 (Trixie)"]="debian|trixie|https://cloud.debian.org/images/cloud/trixie/daily/latest/debian-13-generic-amd64-daily.qcow2|debian13|debian|debian"
    
    # Fedora
    ["Fedora 40"]="fedora|40|https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2|fedora40|fedora|fedora"
    ["Fedora 41"]="fedora|41|https://download.fedoraproject.org/pub/fedora/linux/releases/41/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-41-1.4.qcow2|fedora41|fedora|fedora"
    
    # RHEL Family
    ["CentOS Stream 9"]="centos|stream9|https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2|centos9|centos|centos"
    ["AlmaLinux 9"]="almalinux|9|https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2|alma9|almalinux|almalinux"
    ["Rocky Linux 9"]="rockylinux|9|https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2|rocky9|rocky|rocky"
    ["Oracle Linux 9"]="oracle|9|https://yum.oracle.com/templates/OracleLinux/OL9/u5/x86_64/OL9U5_x86_64-kvm-b247.qcow|oracle9|opc|oracle"
    
    # openSUSE
    ["openSUSE Leap 15.6"]="opensuse|15.6|https://download.opensuse.org/distribution/leap/15.6/appliances/openSUSE-Leap-15.6-Minimal-VM.x86_64-Cloud.qcow2|leap156|opensuse|opensuse"
    ["openSUSE Tumbleweed"]="opensuse|tumbleweed|https://download.opensuse.org/tumbleweed/appliances/openSUSE-Tumbleweed-Minimal-VM.x86_64-Cloud.qcow2|tumbleweed|opensuse|opensuse"
    
    # Rolling/Arch
    ["Arch Linux"]="arch|rolling|https://geo.mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2|archlinux|arch|arch"
    
    # Alpine
    ["Alpine Linux 3.21"]="alpine|3.21|https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/cloud/generic_alpine-3.21.0-x86_64-bios-cloudinit-r0.qcow2|alpine321|alpine|alpine"
    
    # Security
    ["Kali Linux 2024.4"]="kali|2024.4|https://kali.download/cloud-images/kali-2024.4/kali-linux-2024.4-cloud-genericcloud-amd64.tar.xz|kali|kali|kali"
    
    # Cloud
    ["Amazon Linux 2023"]="amazon|2023|https://cdn.amazonlinux.com/al2023/os-images/2023.6.20250218.2/kvm/al2023-kvm-2023.6.20250218.2-kernel-6.1-x86_64.xfs.gpt.qcow2|amzn2023|ec2-user|ec2-user"
    
    # BSD
    ["FreeBSD 14.1"]="freebsd|14.1|https://object-storage.public.mtl1.vexxhost.net/swift/v1/1dbafeefbd4f4c80864414a441e72dd2/bsd-cloud-image.org/images/freebsd/14.1/2024-11-06/ufs/freebsd-14.1-ufs-2024-11-06.qcow2|freebsd14|freebsd|freebsd"
)

OS_ORDER=(
    "═══ Ubuntu ════════════════════════════════════════"
    "Ubuntu 20.04 LTS (Focal)"
    "Ubuntu 22.04 LTS (Jammy)"
    "Ubuntu 24.04 LTS (Noble)"
    "═══ Debian ════════════════════════════════════════"
    "Debian 11 (Bullseye)"
    "Debian 12 (Bookworm)"
    "Debian 13 (Trixie)"
    "═══ Fedora ════════════════════════════════════════"
    "Fedora 40"
    "Fedora 41"
    "═══ RHEL Family ═══════════════════════════════════"
    "CentOS Stream 9"
    "AlmaLinux 9"
    "Rocky Linux 9"
    "Oracle Linux 9"
    "═══ openSUSE ══════════════════════════════════════"
    "openSUSE Leap 15.6"
    "openSUSE Tumbleweed"
    "═══ Rolling / Specialty ═══════════════════════════"
    "Arch Linux"
    "Alpine Linux 3.21"
    "Kali Linux 2024.4"
    "═══ Cloud / BSD ═══════════════════════════════════"
    "Amazon Linux 2023"
    "FreeBSD 14.1"
)

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ OS PICKER WITH VISUAL EFFECTS ═════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_pick_os() {
    _section_neon "SELECT OPERATING SYSTEM"
    
    local n=0
    declare -g -a _OS_IDX=()
    
    for entry in "${OS_ORDER[@]}"; do
        if [[ "$entry" == ═══* ]]; then
            echo ""
            printf "  %b%s%b\n" "$P4" "$entry" "$_R"
        else
            (( n++ ))
            _OS_IDX[$n]="$entry"
            local os_icon=""
            case "${OS_CATALOGUE[$entry]}" in
                ubuntu*) os_icon="${B6}◉" ;;
                debian*) os_icon="${R4}◉" ;;
                fedora*) os_icon="${B4}◉" ;;
                centos*|almalinux*|rocky*) os_icon="${G4}◉" ;;
                opensuse*) os_icon="${G6}◉" ;;
                arch*) os_icon="${B8}◉" ;;
                alpine*) os_icon="${B5}◉" ;;
                kali*) os_icon="${M4}◉" ;;
                amazon*) os_icon="${R6}◉" ;;
                freebsd*) os_icon="${R8}◉" ;;
                *) os_icon="${LG}◉" ;;
            esac
            printf "  %b%2d%b  %b%-40s%b\n" "$B7" "$n" "$_R" "$WH" "$entry" "$_R"
        fi
    done
    
    echo ""
    while true; do
        _inp "Choose OS [1-$n]: "
        read -r c
        [[ "$c" =~ ^[0-9]+$ ]] && (( c >= 1 && c <= n )) && break
        _err "Enter a number between 1 and $n"
    done
    
    local chosen="${_OS_IDX[$c]}"
    IFS='|' read -r OS_TYPE CODENAME IMG_URL DEFAULT_HOSTNAME DEFAULT_USERNAME DEFAULT_PASSWORD \
        <<< "${OS_CATALOGUE[$chosen]}"
    
    echo ""
    _ok "Selected: ${WH}$chosen${_R}"
    _badge "Type: $OS_TYPE | Codename: $CODENAME"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ SETUP VM IMAGE ════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_setup_image() {
    _info "Preparing VM image..."
    mkdir -p "$VM_DIR"
    
    if [[ -f "$IMG_FILE" ]]; then
        _ok "Image already exists — skipping download"
    else
        _info "Downloading from:"
        printf "  %b%s%b\n" "$DG" "$IMG_URL" "$_R"
        echo ""
        
        if ! wget --progress=bar:force "$IMG_URL" -O "${IMG_FILE}.tmp" 2>&1; then
            rm -f "${IMG_FILE}.tmp"
            _err "Download failed — check URL or network"
            exit 1
        fi
        mv "${IMG_FILE}.tmp" "$IMG_FILE"
        _ok "Download complete"
    fi
    
    # Resize with progress
    _info "Resizing disk image..."
    if ! qemu-img resize "$IMG_FILE" "$DISK_SIZE" 2>/dev/null; then
        _warn "Could not resize — creating overlay"
        qemu-img create -f qcow2 -F qcow2 -b "$IMG_FILE" "${IMG_FILE}.tmp" "$DISK_SIZE" 2>/dev/null \
            || qemu-img create -f qcow2 "${IMG_FILE}.tmp" "$DISK_SIZE"
        mv "${IMG_FILE}.tmp" "$IMG_FILE"
    fi
    _ok "Disk sized to $DISK_SIZE"
    
    # Create cloud-init user-data
    cat > user-data <<EOF
#cloud-config
hostname: $HOSTNAME
ssh_pwauth: true
disable_root: false
users:
  - name: $USERNAME
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    password: $(openssl passwd -6 "$PASSWORD" | tr -d '\n')
chpasswd:
  list: |
    root:$PASSWORD
    $USERNAME:$PASSWORD
  expire: false
EOF

    cat > meta-data <<EOF
instance-id: iid-$VM_NAME
local-hostname: $HOSTNAME
EOF

    cloud-localds "$SEED_FILE" user-data meta-data || { _err "Failed to create seed ISO"; exit 1; }
    _ok "Seed image created"
    
    # Summary display
    echo ""
    _dbl
    _label "VM Name"  "$VM_NAME"
    _label "OS"       "$OS_TYPE / $CODENAME"
    _label "User"     "$USERNAME"
    _label "Password" "$(echo "$PASSWORD" | sed 's/./*/g')"
    _label "SSH"      "ssh -p $SSH_PORT $USERNAME@localhost"
    _dbl
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ CREATE VM ═════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_create_vm() {
    _banner
    _section_neon "CREATE NEW VIRTUAL MACHINE"
    
    _pick_os
    
    echo ""
    _section "VM CONFIGURATION"
    
    # VM Name
    while true; do
        _inp "VM name [default: $DEFAULT_HOSTNAME]: "
        read -r VM_NAME
        VM_NAME="${VM_NAME:-$DEFAULT_HOSTNAME}"
        _validate name "$VM_NAME" || continue
        [[ -f "$VM_DIR/$VM_NAME.conf" ]] && { _err "VM '$VM_NAME' already exists"; continue; }
        break
    done
    
    # Hostname
    while true; do
        _inp "Hostname [default: $VM_NAME]: "
        read -r HOSTNAME
        HOSTNAME="${HOSTNAME:-$VM_NAME}"
        _validate name "$HOSTNAME" && break
    done
    
    # Username
    while true; do
        _inp "Username [default: $DEFAULT_USERNAME]: "
        read -r USERNAME
        USERNAME="${USERNAME:-$DEFAULT_USERNAME}"
        _validate user "$USERNAME" && break
    done
    
    # Password
    while true; do
        _inp "Password [default: $DEFAULT_PASSWORD]: "
        read -rs PASSWORD
        echo ""
        PASSWORD="${PASSWORD:-$DEFAULT_PASSWORD}"
        [[ -n "$PASSWORD" ]] && break
        _err "Password cannot be empty"
    done
    
    # Disk Size
    while true; do
        _inp "Disk size [default: 20G]: "
        read -r DISK_SIZE
        DISK_SIZE="${DISK_SIZE:-20G}"
        _validate size "$DISK_SIZE" && break
    done
    
    # Memory
    while true; do
        _inp "RAM in MB [default: 2048]: "
        read -r MEMORY
        MEMORY="${MEMORY:-2048}"
        _validate number "$MEMORY" && break
    done
    
    # CPUs
    while true; do
        _inp "CPU cores [default: 2]: "
        read -r CPUS
        CPUS="${CPUS:-2}"
        _validate number "$CPUS" && break
    done
    
    # SSH Port
    while true; do
        _inp "SSH port [default: 2222]: "
        read -r SSH_PORT
        SSH_PORT="${SSH_PORT:-2222}"
        _validate port "$SSH_PORT" || continue
        ss -tln 2>/dev/null | grep -q ":$SSH_PORT " && { _err "Port $SSH_PORT in use"; continue; }
        break
    done
    
    # GUI Mode
    while true; do
        _inp "Enable GUI? [y/N]: "
        read -r gui
        gui="${gui:-n}"
        if [[ "$gui" =~ ^[Yy]$ ]]; then 
            GUI_MODE=true
            break
        elif [[ "$gui" =~ ^[Nn]$ ]]; then 
            GUI_MODE=false
            break
        else 
            _err "Answer y or n"
        fi
    done
    
    # Extra port forwards
    _inp "Extra port forwards (e.g., 8080:80, Enter to skip): "
    read -r PORT_FORWARDS
    
    IMG_FILE="$VM_DIR/$VM_NAME.img"
    SEED_FILE="$VM_DIR/$VM_NAME-seed.iso"
    CREATED="$(date '+%Y-%m-%d %H:%M:%S')"
    
    echo ""
    _setup_image
    _vm_save
    
    echo ""
    _ok "VM '${WH}$VM_NAME${_R}' created successfully!"
    _badge "Ready to start with option 2"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ START VM ══════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_start_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    _chklock "$IMG_FILE" "$vm" || {
        _inp "Force-kill all QEMU processes? [y/N]: "
        read -r fk
        if [[ "$fk" =~ ^[Yy]$ ]]; then
            pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null
            sleep 2
            pgrep -f "qemu-system.*$IMG_FILE" &>/dev/null && pkill -9 -f "qemu-system.*$IMG_FILE"
            rm -f "${IMG_FILE}.lock" 2>/dev/null
            _ok "Processes cleared"
        else 
            return 1
        fi
    }
    
    if _vm_running "$vm"; then
        _warn "VM '$vm' is already running"
        _inp "Stop and restart? [y/N]: "
        read -r r
        [[ "$r" =~ ^[Yy]$ ]] || return 1
        _stop_vm "$vm"
        sleep 2
    fi
    
    [[ -f "$IMG_FILE"  ]] || { _err "Image not found: $IMG_FILE"; return 1; }
    [[ -f "$SEED_FILE" ]] || { _warn "Seed missing — recreating"; _setup_image; }
    
    echo ""
    _dbl
    _label "VM"       "$vm"
    _label "SSH"      "ssh -p $SSH_PORT $USERNAME@localhost"
    _label "Password" "$(echo "$PASSWORD" | sed 's/./*/g')"
    _label "RAM"      "${MEMORY} MB"
    _label "CPUs"     "$CPUS"
    _label "Disk"     "$DISK_SIZE"
    _dbl
    echo ""
    
    local cmd=(
        qemu-system-x86_64
        -enable-kvm
        -m "$MEMORY"
        -smp "$CPUS"
        -cpu host
        -drive "file=$IMG_FILE,format=qcow2,if=virtio"
        -drive "file=$SEED_FILE,format=raw,if=virtio"
        -boot order=c
        -device virtio-net-pci,netdev=n0
        -netdev "user,id=n0,hostfwd=tcp::$SSH_PORT-:22"
    )
    
    # Add extra port forwards
    if [[ -n "${PORT_FORWARDS:-}" ]]; then
        IFS=',' read -ra fwds <<< "$PORT_FORWARDS"
        local fi=1
        for fwd in "${fwds[@]}"; do
            IFS=':' read -r hp gp <<< "$fwd"
            cmd+=(-device "virtio-net-pci,netdev=fwd$fi")
            cmd+=(-netdev "user,id=fwd$fi,hostfwd=tcp::$hp-:$gp")
            (( fi++ ))
        done
    fi
    
    # Display mode
    if [[ "$GUI_MODE" == true ]]; then
        cmd+=(-vga virtio -display gtk,gl=on)
        _info "GUI mode enabled"
    else
        cmd+=(-nographic -serial mon:stdio)
        _info "Console mode — Ctrl+A then X to exit"
    fi
    
    # Extra devices
    cmd+=(-device virtio-balloon-pci)
    cmd+=(-object rng-random,filename=/dev/urandom,id=rng0)
    cmd+=(-device virtio-rng-pci,rng=rng0)
    
    _info "Starting QEMU..."
    echo ""
    
    # Run QEMU
    "${cmd[@]}" || {
        _err "QEMU exited with error"
        rm -f "${IMG_FILE}.lock" 2>/dev/null
        return 1
    }
    
    _info "VM $vm shut down"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ STOP VM ═══════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_stop_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    if _vm_running "$vm"; then
        _info "Stopping $vm..."
        pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null
        sleep 2
        _vm_running "$vm" && pkill -9 -f "qemu-system.*$IMG_FILE" 2>/dev/null
        rm -f "${IMG_FILE}.lock" 2>/dev/null
        _vm_running "$vm" && { _err "Failed to stop VM"; return 1; }
        _ok "VM $vm stopped"
    else
        _info "VM $vm is not running"
        rm -f "${IMG_FILE}.lock" 2>/dev/null
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ VM INFO ═══════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_show_info() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    _section_neon "VM INFORMATION — $vm"
    
    local status="${ER}● STOPPED${_R}"
    _vm_running "$vm" && status="${OK}● RUNNING${_R}"
    
    _dbl
    _label "Status"    "$(echo -e "$status")"
    _label "OS"        "$OS_TYPE / $CODENAME"
    _label "Hostname"  "$HOSTNAME"
    _label "Username"  "$USERNAME"
    _label "Password"  "$(echo "$PASSWORD" | sed 's/./*/g')"
    _label "SSH Port"  "$SSH_PORT"
    _label "SSH Cmd"   "ssh -p $SSH_PORT $USERNAME@localhost"
    _label "RAM"       "${MEMORY} MB"
    _label "CPUs"      "$CPUS"
    _label "Disk"      "$DISK_SIZE"
    _label "GUI Mode"  "$GUI_MODE"
    _label "Forwards"  "${PORT_FORWARDS:-none}"
    _label "Created"   "$CREATED"
    _label "Image"     "$IMG_FILE"
    _label "Seed"      "$SEED_FILE"
    _dbl
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ EDIT VM ═══════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_edit_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    _section_neon "EDIT VM — $vm"
    
    while true; do
        printf "  %b 1%b  %bHostname%b      %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$HOSTNAME" "$_R"
        printf "  %b 2%b  %bUsername%b      %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$USERNAME" "$_R"
        printf "  %b 3%b  %bPassword%b      %bcurrent:%b %b****%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$_R"
        printf "  %b 4%b  %bSSH Port%b      %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$SSH_PORT" "$_R"
        printf "  %b 5%b  %bGUI Mode%b      %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$GUI_MODE" "$_R"
        printf "  %b 6%b  %bPort Forwards%b %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "${PORT_FORWARDS:-none}" "$_R"
        printf "  %b 7%b  %bRAM (MB)%b      %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$MEMORY" "$_R"
        printf "  %b 8%b  %bCPU Cores%b     %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$CPUS" "$_R"
        printf "  %b 9%b  %bDisk Size%b     %bcurrent:%b %b%s%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R" "$LG" "$DISK_SIZE" "$_R"
        printf "  %b 0%b  %b← Back%b\n" "$DG" "$_R" "$DG" "$_R"
        echo ""
        
        _inp "Choose field to edit: "
        read -r ec
        
        case $ec in
            1)
                while true; do
                    _inp "New hostname [$HOSTNAME]: "
                    read -r v
                    v="${v:-$HOSTNAME}"
                    _validate name "$v" && HOSTNAME="$v" && break
                done
                ;;
            2)
                while true; do
                    _inp "New username [$USERNAME]: "
                    read -r v
                    v="${v:-$USERNAME}"
                    _validate user "$v" && USERNAME="$v" && break
                done
                ;;
            3)
                while true; do
                    _inp "New password: "
                    read -rs v
                    echo ""
                    [[ -n "${v:-}" ]] && PASSWORD="$v" && break
                    _err "Cannot be empty"
                done
                ;;
            4)
                while true; do
                    _inp "New SSH port [$SSH_PORT]: "
                    read -r v
                    v="${v:-$SSH_PORT}"
                    _validate port "$v" || continue
                    [[ "$v" != "$SSH_PORT" ]] && ss -tln 2>/dev/null | grep -q ":$v " \
                        && { _err "Port in use"; continue; }
                    SSH_PORT="$v" && break
                done
                ;;
            5)
                while true; do
                    _inp "GUI mode? [y/N]: "
                    read -r v
                    v="${v:-n}"
                    [[ "$v" =~ ^[Yy]$ ]] && GUI_MODE=true && break
                    [[ "$v" =~ ^[Nn]$ ]] && GUI_MODE=false && break
                    _err "y or n"
                done
                ;;
            6)
                _inp "Port forwards (blank to clear): "
                read -r v
                PORT_FORWARDS="$v"
                ;;
            7)
                while true; do
                    _inp "RAM MB [$MEMORY]: "
                    read -r v
                    v="${v:-$MEMORY}"
                    _validate number "$v" && MEMORY="$v" && break
                done
                ;;
            8)
                while true; do
                    _inp "CPU cores [$CPUS]: "
                    read -r v
                    v="${v:-$CPUS}"
                    _validate number "$v" && CPUS="$v" && break
                done
                ;;
            9)
                while true; do
                    _inp "Disk size [$DISK_SIZE]: "
                    read -r v
                    v="${v:-$DISK_SIZE}"
                    _validate size "$v" && DISK_SIZE="$v" && break
                done
                ;;
            0)
                return 0
                ;;
            *)
                _err "Invalid choice"
                sleep 0.5
                continue
                ;;
        esac
        
        [[ "$ec" =~ ^[123]$ ]] && {
            _info "Updating cloud-init seed..."
            _setup_image
        }
        _vm_save
        echo ""
        
        _inp "Continue editing? [y/N]: "
        read -r cont
        [[ "$cont" =~ ^[Yy]$ ]] || break
        echo ""
    done
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ RESIZE DISK ═══════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_resize_disk() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    _vm_running "$vm" && { _err "Stop the VM before resizing"; return 1; }
    
    _info "Current disk: $DISK_SIZE"
    
    while true; do
        _inp "New disk size (e.g., 50G): "
        read -r ns
        _validate size "$ns" || continue
        [[ "$ns" == "$DISK_SIZE" ]] && { _info "Size unchanged"; return 0; }
        
        local cur=${DISK_SIZE%[GgMmTt]} new=${ns%[GgMmTt]}
        local cu=${DISK_SIZE: -1} nu=${ns: -1}
        [[ "$cu" =~ [Gg] ]] && cur=$(( cur * 1024 ))
        [[ "$nu" =~ [Gg] ]] && new=$(( new * 1024 ))
        [[ "$cu" =~ [Tt] ]] && cur=$(( cur * 1024 * 1024 ))
        [[ "$nu" =~ [Tt] ]] && new=$(( new * 1024 * 1024 ))
        
        if (( new < cur )); then
            _warn "Shrinking may cause data loss!"
            _inp "Confirm? [y/N]: "
            read -r c
            [[ "$c" =~ ^[Yy]$ ]] || { _info "Cancelled"; return 0; }
        fi
        
        qemu-img resize "$IMG_FILE" "$ns" && DISK_SIZE="$ns" && _vm_save \
            && _ok "Resized to $ns" || _err "Resize failed"
        break
    done
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ PERFORMANCE ═══════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_show_perf() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    _section_neon "PERFORMANCE METRICS — $vm"
    
    if _vm_running "$vm"; then
        local qpid
        qpid=$(pgrep -f "qemu-system.*$IMG_FILE" | head -1)
        
        if [[ -n "$qpid" ]]; then
            echo -e "  ${B6}${_BD}Process Statistics${_R}"
            _thin
            ps -p "$qpid" -o pid,%cpu,%mem,rss,vsz --no-headers | \
                awk '{printf "  PID: %s  |  CPU: %s%%  |  MEM: %s%%  |  RSS: %s KB\n", $1,$2,$3,$4}'
            echo ""
            
            echo -e "  ${B6}${_BD}System Memory${_R}"
            _thin
            free -h | awk 'NR>1{print "  " $0}'
            echo ""
            
            echo -e "  ${B6}${_BD}Disk Usage${_R}"
            _thin
            du -h "$IMG_FILE" | awk '{print "  Image size: " $1}'
            df -h "$VM_DIR" | awk 'NR==2{print "  Free space: " $4}'
        else
            _err "Could not find QEMU PID"
        fi
    else
        _info "VM is not running — showing configuration"
        _dbl
        _label "RAM"  "${MEMORY} MB"
        _label "CPUs" "$CPUS"
        _label "Disk" "$DISK_SIZE"
        _dbl
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ FIX ISSUES ════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_fix_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    
    _section_neon "TROUBLESHOOTING — $vm"
    
    printf "  %b 1%b  %bRemove lock files%b\n" "$B6" "$_R" "$WH" "$_R"
    printf "  %b 2%b  %bRecreate seed image%b\n" "$B6" "$_R" "$WH" "$_R"
    printf "  %b 3%b  %bRewrite config file%b\n" "$B6" "$_R" "$WH" "$_R"
    printf "  %b 4%b  %bKill stuck QEMU processes%b\n" "$B6" "$_R" "$WH" "$_R"
    printf "  %b 5%b  %bVerify image integrity%b\n" "$B6" "$_R" "$WH" "$_R"
    printf "  %b 0%b  %b← Back%b\n" "$DG" "$_R" "$DG" "$_R"
    echo ""
    
    _inp "Choice: "
    read -r fc
    
    case $fc in
        1)
            rm -f "${IMG_FILE}.lock" "${IMG_FILE}"*.lock 2>/dev/null
            _ok "Lock files removed"
            ;;
        2)
            rm -f "$SEED_FILE"
            _setup_image
            _ok "Seed recreated"
            ;;
        3)
            _vm_save
            _ok "Config rewritten"
            ;;
        4)
            pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null
            sleep 1
            pgrep -f "qemu-system.*$IMG_FILE" &>/dev/null \
                && pkill -9 -f "qemu-system.*$IMG_FILE" && _ok "Force-killed" \
                || _info "No stuck processes found"
            ;;
        5)
            _info "Checking image integrity..."
            qemu-img check "$IMG_FILE" 2>/dev/null && _ok "Image is valid" || _warn "Image may be corrupted"
            ;;
        0)
            return 0
            ;;
        *)
            _err "Invalid choice"
            ;;
    esac
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ DELETE VM ═════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_delete_vm() {
    local vm=$1
    
    echo ""
    printf "  %b%s%b\n" "$ER" "⚠️  WARNING: This will PERMANENTLY delete '$vm' and ALL its data!" "$_R"
    echo ""
    _inp "Type the VM name to confirm: "
    read -r confirm
    
    [[ "$confirm" != "$vm" ]] && { _info "Cancelled"; return; }
    
    _vm_load "$vm" || return 1
    _vm_running "$vm" && _stop_vm "$vm" && sleep 2
    
    rm -f "$IMG_FILE" "$SEED_FILE" "$VM_DIR/$vm.conf" "${IMG_FILE}.lock" 2>/dev/null
    _ok "VM '$vm' permanently deleted"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ VM SELECTOR ═══════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_pick_vm() {
    local action=$1
    mapfile -t vms < <(_vm_list)
    local n=${#vms[@]}
    
    (( n == 0 )) && { _warn "No VMs found — create one first"; return 1; }
    
    _section_neon "SELECT VM — $action"
    
    for i in "${!vms[@]}"; do
        local dot="${ER}●${_R}"
        _vm_running "${vms[$i]}" && dot="${OK}●${_R}"
        printf "  %b%2d%b  %b  %b%s%b\n" "$B6" $((i+1)) "$_R" "$dot" "$WH" "${vms[$i]}" "$_R"
    done
    
    echo ""
    while true; do
        _inp "VM number [1-$n]: "
        read -r sel
        [[ "$sel" =~ ^[0-9]+$ ]] && (( sel >= 1 && sel <= n )) && break
        _err "Enter 1-$n"
    done
    
    _SELECTED_VM="${vms[$((sel-1))]}"
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ MAIN MENU ═════════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

_main_menu() {
    while true; do
        _banner
        
        mapfile -t _VMS < <(_vm_list)
        local vc=${#_VMS[@]}
        
        # VM status strip
        if (( vc > 0 )); then
            printf "  %bVMs found:%b %b%d%b\n" "$DG" "$_R" "$WH" "$vc" "$_R"
            echo ""
            
            for v in "${_VMS[@]}"; do
                local dot="${ER}●${_R}"
                local status="stopped"
                _vm_running "$v" && { dot="${OK}●${_R}"; status="running"; }
                printf "  %b  %b  %b%-20s%b %b[%s]%b\n" "$dot" "$_R" "$LG" "$v" "$_R" "$DG" "$status" "$_R"
            done
            
            echo ""
            _thin
            echo ""
        fi
        
        # Menu options
        printf "  %b 1%b  %bCreate VM%b           %bProvision new virtual machine%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
        
        if (( vc > 0 )); then
            printf "  %b 2%b  %bStart VM%b            %bBoot a stopped VM%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 3%b  %bStop VM%b             %bGracefully halt a running VM%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 4%b  %bVM Info%b             %bShow detailed VM info%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 5%b  %bEdit VM%b             %bModify VM configuration%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 6%b  %bDelete VM%b           %bPermanently remove a VM%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 7%b  %bResize Disk%b         %bExpand or shrink VM disk%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 8%b  %bPerformance%b         %bLive resource metrics%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
            printf "  %b 9%b  %bFix Issues%b          %bRepair locks / broken config%b\n" "$B6" "$_R" "$WH" "$_R" "$DG" "$_R"
        fi
        
        echo ""
        printf "  %b 0%b  %bExit%b\n" "$ER" "$_R" "$ER" "$_R"
        echo ""
        _thin
        echo ""
        
        _inp "Select: "
        read -r ch
        
        case $ch in
            1)
                _create_vm
                ;;
            2)
                (( vc > 0 )) && _pick_vm "Start" && _start_vm "$_SELECTED_VM"
                ;;
            3)
                (( vc > 0 )) && _pick_vm "Stop" && _stop_vm "$_SELECTED_VM"
                ;;
            4)
                (( vc > 0 )) && _pick_vm "Info" && _show_info "$_SELECTED_VM"
                ;;
            5)
                (( vc > 0 )) && _pick_vm "Edit" && _edit_vm "$_SELECTED_VM"
                ;;
            6)
                (( vc > 0 )) && _pick_vm "Delete" && _delete_vm "$_SELECTED_VM"
                ;;
            7)
                (( vc > 0 )) && _pick_vm "Resize" && _resize_disk "$_SELECTED_VM"
                ;;
            8)
                (( vc > 0 )) && _pick_vm "Performance" && _show_perf "$_SELECTED_VM"
                ;;
            9)
                (( vc > 0 )) && _pick_vm "Fix" && _fix_vm "$_SELECTED_VM"
                ;;
            0)
                _banner
                _section_neon "SESSION TERMINATED"
                _label "Powered by" "Hyperdock VM Manager v4.0 ULTIMATE"
                _label "Author" "Deniz"
                _label "Edition" "Cyberpunk"
                echo ""
                
                # Exit animation
                for c in $B8 $B7 $B6 $B5 $B4 $B3 $B2 $B1; do
                    printf "\r  %b%s%b" "$c" "Goodbye, and thanks for using Hyperdock!" "$_R"
                    sleep 0.08
                done
                echo ""
                echo ""
                exit 0
                ;;
            *)
                _err "Invalid — use 0-9"
                sleep 0.5
                ;;
        esac
        
        _pause
    done
}

# ═══════════════════════════════════════════════════════════════════════════════
# ═══ ENTRY POINT ═══════════════════════════════════════════════════════════════
# ═══════════════════════════════════════════════════════════════════════════════

VM_DIR="${VM_DIR:-$HOME/vms}"
mkdir -p "$VM_DIR"

# Initialize wave offset for animations
wave_offset=0

# Hide cursor during boot
tput civis 2>/dev/null || true

_boot
_deps
_main_menu
