#!/bin/bash

# ╔══════════════════════════════════════════════╗
# ║       HYPERDOCK INSTALLER v2.0               ║
# ║       Made by Deniz. Issi                    ║
# ╚══════════════════════════════════════════════╝

# ── Palette ──────────────────────────────────────
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

B1='\033[38;5;19m'
B2='\033[38;5;27m'
B3='\033[38;5;33m'
B4='\033[38;5;39m'
B5='\033[38;5;45m'
B6='\033[38;5;51m'

WHITE='\033[1;97m'
LGRAY='\033[38;5;252m'
DGRAY='\033[38;5;240m'

OK='\033[38;5;45m'
WARN='\033[38;5;220m'
ERR='\033[38;5;196m'

NC=$RESET

# ── Helpers ───────────────────────────────────────
animate_text() {
    local text="$1"
    local delay="${2:-0.008}"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

pause() {
    echo ""
    echo -e "  ${DGRAY}────────────────────────────────────────${NC}"
    echo -e "  ${B4}↵${NC}  ${LGRAY}Press ${WHITE}Enter${NC}${LGRAY} to continue${NC}"
    read -r
}

divider() {
    echo -e "  ${B2}$(printf '─%.0s' {1..50})${NC}"
}

# ── Boot Sequence ─────────────────────────────────
loading_bar() {
    clear
    echo ""
    echo -e "  ${B3}${BOLD}HYPERDOCK${NC}  ${DGRAY}installer${NC}"
    echo ""
    echo -e "  ${DGRAY}Initializing system...${NC}"
    echo ""

    local bar_width=46
    echo -ne "  ${DGRAY}[${NC}"
    for (( i=0; i<bar_width; i++ )); do
        local pct=$(( (i * 100) / bar_width ))
        if   (( pct < 30  )); then echo -ne "${B1}▰${NC}"
        elif (( pct < 60  )); then echo -ne "${B3}▰${NC}"
        elif (( pct < 85  )); then echo -ne "${B5}▰${NC}"
        else                       echo -ne "${B6}▰${NC}"; fi
        sleep 0.025
    done
    echo -e "${DGRAY}]${NC}"
    echo ""

    sleep 0.2
    echo -e "  ${B6}✓${NC}  ${LGRAY}Environment loaded${NC}"
    sleep 0.2
    echo -e "  ${B6}✓${NC}  ${LGRAY}Modules verified${NC}"
    sleep 0.2
    echo -e "  ${B6}✓${NC}  ${LGRAY}Ready${NC}"
    sleep 0.6
}

# ── Banner ────────────────────────────────────────
banner() {
    clear
    echo ""
    echo -e "${B1}  ╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${B2}  ║                                                      ║${NC}"
    echo -e "${B3}  ║  ${B6}${BOLD} ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ${NC}         ${B3}║${NC}"
    echo -e "${B3}  ║  ${B5}${BOLD} ██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗${NC}         ${B3}║${NC}"
    echo -e "${B3}  ║  ${B4}${BOLD} ███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝${NC}         ${B3}║${NC}"
    echo -e "${B3}  ║  ${B3}${BOLD} ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗${NC}         ${B3}║${NC}"
    echo -e "${B3}  ║  ${B2}${BOLD} ██║  ██║   ██║   ██║     ███████╗██║  ██║${NC}         ${B3}║${NC}"
    echo -e "${B3}  ║  ${B1}${BOLD} ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝${NC}         ${B3}║${NC}"
    echo -e "${B2}  ║                                                      ║${NC}"
    echo -e "${B2}  ║  ${DGRAY}D O C K${NC}  ${B6}◈${NC}  ${DGRAY}v2.0${NC}  ${B6}◈${NC}  ${DGRAY}by ${WHITE}Deniz. Issi${NC}              ${B2}║${NC}"
    echo -e "${B1}  ╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# ── Section Header ────────────────────────────────
section_header() {
    local title="$1"
    echo ""
    echo -e "  ${B3}◈${NC}  ${WHITE}${BOLD}${title}${NC}"
    divider
    echo ""
}

# ── Menu Item ─────────────────────────────────────
item() {
    local key="$1" label="$2" desc="${3:-}"
    printf "  ${B4}%s${NC}  ${WHITE}%-22s${NC}  ${DGRAY}%s${NC}\n" "$key" "$label" "$desc"
}

# ── Tools Menu ────────────────────────────────────
tools_menu() {
    while true; do
        banner
        section_header "TOOLS"

        item "1" "Root Access"       "Grant elevated privileges"
        item "2" "Tailscale"         "Mesh VPN setup"
        item "3" "Cloudflare DNS"    "Configure DNS resolver"
        item "4" "System Info"       "Hardware & OS overview"
        item "5" "VPS Run"           "Execute VPS routines"
        item "6" "Terminal"          "Open shell session"
        item "7" "RDP Installer"     "Remote desktop setup"
        echo ""
        item "8" "<- Back"           "Return to main menu"
        echo ""
        divider
        echo ""
        echo -ne "  ${B4}> ${NC}"
        read -r t

        case $t in
            1) echo -e "\n  ${B5}Launching${NC} ${WHITE}Root Access${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/tools/root.sh) ;;
            2) echo -e "\n  ${B5}Launching${NC} ${WHITE}Tailscale${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/tools/Tailscale.sh) ;;
            3) echo -e "\n  ${B5}Launching${NC} ${WHITE}Cloudflare DNS${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/tools/cloudflare.sh) ;;
            4) echo -e "\n  ${B5}Launching${NC} ${WHITE}System Info${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/tools/SYSTEM.sh) ;;
            5) echo -e "\n  ${B5}Launching${NC} ${WHITE}VPS Run${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita54/-150/refs/heads/main/tools/vps.sh) ;;
            6) echo -e "\n  ${B5}Launching${NC} ${WHITE}Terminal${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/tools/terminal.sh) ;;
            7) echo -e "\n  ${B5}Launching${NC} ${WHITE}RDP Installer${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/tools/rdp.sh) ;;
            8) return ;;
            *) echo -e "\n  ${ERR}x${NC}  ${LGRAY}Invalid option — try again${NC}"; sleep 1 ;;
        esac
        pause
    done
}

# ── Panels Menu ───────────────────────────────────
panels_menu() {
    while true; do
        banner
        section_header "PANELS"

        item "1" "Pterodactyl"       "Full-featured game panel"
        item "2" "Air-Link"          "Lightweight link panel"
        echo ""
        item "3" "<- Back"           "Return to main menu"
        echo ""
        divider
        echo ""
        echo -ne "  ${B4}> ${NC}"
        read -r p

        case $p in
            1) echo -e "\n  ${B5}Launching${NC} ${WHITE}Pterodactyl Installer${NC}..."; echo ""
               bash <(curl -s https://ptero.jishnu.site) ;;
            2) echo -e "\n  ${B5}Launching${NC} ${WHITE}Air-Link Installer${NC}..."; echo ""
               bash <(curl -s https://raw.githubusercontent.com/jishnu-limited/app-build-journey/refs/heads/main/air-link) ;;
            3) return ;;
            *) echo -e "\n  ${ERR}x${NC}  ${LGRAY}Invalid option — try again${NC}"; sleep 1 ;;
        esac
        pause
    done
}

# ── Main Menu ─────────────────────────────────────
loading_bar

while true; do
    banner
    section_header "MAIN MENU"

    item "A" "Panels"               "Install & manage panels"
    item "B" "VPS Maker"            "Provision virtual machines"
    item "C" "Tools"                "Utilities & system tools"
    item "D" "System Edit"          "Coming soon..."
    echo ""
    item "E" "Exit"                 "Quit the installer"
    echo ""
    divider
    echo ""
    echo -ne "  ${B4}> ${NC}"
    read -r choice

    case ${choice,,} in
        a) panels_menu ;;
        b)
            echo -e "\n  ${B5}Launching${NC} ${WHITE}VPS Maker${NC}..."; echo ""
            bash <(curl -s https://raw.githubusercontent.com/jishnu-limited/app-build-journey/refs/heads/main/vpmaker)
            pause
            ;;
        c) tools_menu ;;
        d)
            echo ""
            echo -e "  ${WARN}o${NC}  ${LGRAY}System Edit is${NC} ${WHITE}coming soon${NC}${LGRAY}...${NC}"
            sleep 1.5
            ;;
        e)
            echo ""
            echo -e "  ${B6}o${NC}  ${LGRAY}Thank you for using${NC} ${WHITE}Hyperdock${NC}"
            echo ""
            animate_text "  Goodbye." 0.05
            echo ""
            exit 0
            ;;
        *)
            echo -e "\n  ${ERR}x${NC}  ${LGRAY}Unknown option — use A B C D or E${NC}"
            sleep 1
            ;;
    esac
done
