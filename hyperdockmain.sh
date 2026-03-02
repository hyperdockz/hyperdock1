#!/bin/bash

# ── Palette ──────────────────────────────────────
B1='\033[38;5;19m'
B2='\033[38;5;27m'
B3='\033[38;5;33m'
B4='\033[38;5;39m'
B5='\033[38;5;45m'
B6='\033[38;5;51m'

WHITE='\033[1;97m'
LGRAY='\033[38;5;252m'
DGRAY='\033[38;5;240m'
WARN='\033[38;5;220m'
OK='\033[38;5;83m'
ERR='\033[38;5;196m'
BOLD='\033[1m'
N='\033[0m'

# ── Logo ─────────────────────────────────────────
print_logo() {
    echo ""
    echo -e "${B1}  ╔══════════════════════════════════════════════════════════╗${N}"
    echo -e "${B2}  ║                                                          ║${N}"
    echo -e "${B3}  ║   ${B6}${BOLD} ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ${N}          ${B3}║${N}"
    echo -e "${B3}  ║   ${B5}${BOLD} ██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗${N}          ${B3}║${N}"
    echo -e "${B3}  ║   ${B4}${BOLD} ███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝${N}          ${B3}║${N}"
    echo -e "${B3}  ║   ${B3}${BOLD} ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗${N}          ${B3}║${N}"
    echo -e "${B3}  ║   ${B2}${BOLD} ██║  ██║   ██║   ██║     ███████╗██║  ██║${N}          ${B3}║${N}"
    echo -e "${B3}  ║   ${B1}${BOLD} ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝${N}          ${B3}║${N}"
    echo -e "${B2}  ║                                                          ║${N}"
    echo -e "${B2}  ║   ${DGRAY}N E T W O R K${N}  ${B6}◈${N}  ${DGRAY}v2.0${N}  ${B6}◈${N}  ${DGRAY}by ${WHITE}Deniz${N}              ${B2}║${N}"
    echo -e "${B1}  ╚══════════════════════════════════════════════════════════╝${N}"
    echo ""
}

# ── Header ───────────────────────────────────────
print_header() {
    clear
    print_logo
    echo -e "  ${B2}$(printf '═%.0s' {1..58})${N}"
    echo -e "  ${B4}${BOLD}           VPS MANAGEMENT CONSOLE             ${N}"
    echo -e "  ${B2}$(printf '═%.0s' {1..58})${N}"
    echo ""
}

# ── Option Box ───────────────────────────────────
print_option() {
    local num="$1"
    local text="$2"
    local pad=$(( 44 - ${#text} ))
    echo -e "  ${B2}╔══════════════════════════════════════════════╗${N}"
    printf "  ${B2}║${N}  ${B4}[${WHITE}%s${B4}]${N}  ${B5}%-44s${B2}║${N}\n" "$num" "$text"
    echo -e "  ${B2}╚══════════════════════════════════════════════╝${N}"
    echo ""
}

# ── Status ───────────────────────────────────────
print_status() {
    echo -e "\n  ${B4}◈◈${N}  ${B6}${BOLD}$1${N}\n"
}

print_divider() {
    echo -e "  ${B2}$(printf '═%.0s' {1..58})${N}"
}

print_footer() {
    echo -e "  ${B1}┌$(printf '─%.0s' {1..56})┐${N}"
    echo -e "  ${B1}│${N}  ${DGRAY}Hyperdock Network © 2026 — All Rights Reserved${N}       ${B1}│${N}"
    echo -e "  ${B1}└$(printf '─%.0s' {1..56})┘${N}"
    echo ""
}

print_inforow() {
    local key="$1" val="$2"
    printf "  ${B1}│${N}  ${B4}%-12s${N}  ${DGRAY}:${N}  ${WHITE}%-32s${N}  ${B1}│${N}\n" "$key" "$val"
}

# ── Main Loop ─────────────────────────────────────
while true; do
    print_header

    echo -e "  ${B2}╔══════════════════════════════════════════════════════════╗${N}"
    echo -e "  ${B2}║${N}  ${B6}${BOLD}                   MAIN OPTIONS                      ${N}  ${B2}║${N}"
    echo -e "  ${B2}╚══════════════════════════════════════════════════════════╝${N}"
    echo ""

    print_option "1" "🚀  GitHub VPS Maker"
    print_option "2" "🔧  IDX Tool Setup"
    print_option "3" "⚡  IDX VPS Maker"
    print_option "4" "🌐  Real VPS (Any + KVM)"
    print_option "5" "✕   Exit"

    print_divider
    echo ""
    echo -ne "  ${B4}◈◈${N}  ${LGRAY}Select Option ${B4}[${WHITE}1-5${B4}]${N}  ${B6}>${N}  "
    read -r op
    echo ""

    case $op in

    # ── (1) GitHub VPS Maker ──────────────────────
    1)
        clear; print_logo
        print_status "🚀  GITHUB VPS MAKER"
        print_divider; echo ""

        RAM=15000
        CPU=4
        DISK_SIZE=100G
        CONTAINER_NAME=hopingboyz
        IMAGE_NAME=hopingboyz/debain12
        VMDATA_DIR="$PWD/vmdata"

        echo -e "  ${B2}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "  ${B2}║${N}  ${B5}${BOLD}           GITHUB VPS CONFIGURATION                  ${N}  ${B2}║${N}"
        echo -e "  ${B2}╚══════════════════════════════════════════════════════════╝${N}"
        echo ""
        echo -e "  ${B5}◈${N}  ${LGRAY}Creating VM data directory...${N}"
        mkdir -p "$VMDATA_DIR"
        echo ""

        echo -e "  ${B1}┌$(printf '─%.0s' {1..56})┐${N}"
        print_inforow "RAM"       "$RAM MB"
        print_inforow "CPU"       "$CPU cores"
        print_inforow "Disk"      "$DISK_SIZE"
        print_inforow "Name"      "$CONTAINER_NAME"
        print_inforow "Image"     "$IMAGE_NAME"
        print_inforow "Type"      "GitHub Docker VPS"
        echo -e "  ${B1}└$(printf '─%.0s' {1..56})┘${N}"
        echo ""

        echo -e "  ${B4}◈◈${N}  ${LGRAY}Launching GitHub VPS...${N}"
        echo -e "  ${DGRAY}$(printf '─%.0s' {1..54})${N}"

        docker run -it --rm \
          --name "$CONTAINER_NAME" \
          --device /dev/kvm \
          -v "$VMDATA_DIR":/vmdata \
          -e RAM="$RAM" \
          -e CPU="$CPU" \
          -e DISK_SIZE="$DISK_SIZE" \
          "$IMAGE_NAME"

        echo ""
        print_divider
        echo -e "  ${B5}◈${N}  ${LGRAY}GitHub VPS session ended.${N}"
        echo -ne "  ${B4}◈◈${N}  ${LGRAY}Press ${WHITE}Enter${LGRAY} to return to main menu...${N}"
        read -r
        ;;

    # ── (2) IDX Tool Setup ────────────────────────
    2)
        clear; print_logo
        print_status "🔧  IDX TOOL SETUP"
        print_divider; echo ""

        echo -e "  ${B2}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "  ${B2}║${N}  ${B5}${BOLD}          IDX DEVELOPMENT TOOL SETUP                 ${N}  ${B2}║${N}"
        echo -e "  ${B2}╚══════════════════════════════════════════════════════════╝${N}"
        echo ""

        echo -e "  ${B5}◈${N}  ${LGRAY}Cleaning up old files...${N}"
        cd
        rm -rf myapp flutter

        cd vps123

        if [ ! -d ".idx" ]; then
            echo -e "  ${B5}◈${N}  ${LGRAY}Creating .idx directory...${N}"
            mkdir .idx
            cd .idx

            echo -e "  ${B5}◈${N}  ${LGRAY}Writing dev.nix configuration...${N}"
            echo -e "  ${DGRAY}$(printf '─%.0s' {1..54})${N}"

            cat <<EOF > dev.nix
{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = with pkgs; [
    unzip openssh git qemu_kvm sudo cdrkit cloud-utils qemu
  ];

  env = { EDITOR = "nano"; };

  idx = {
    extensions = [ "Dart-Code.flutter" "Dart-Code.dart-code" ];
    workspace = { onCreate = { }; onStart = { }; };
    previews = { enable = false; };
  };
}
EOF

            echo ""
            echo -e "  ${OK}✓${N}  ${WHITE}IDX Tool setup complete!${N}"
            echo ""
            echo -e "  ${B1}┌$(printf '─%.0s' {1..56})┐${N}"
            print_inforow "Status"   "Ready to use"
            print_inforow "Location" "~/vps123/.idx"
            print_inforow "Tool"     "IDX Development Environment"
            print_inforow "Version"  "Stable 24.05"
            echo -e "  ${B1}└$(printf '─%.0s' {1..56})┘${N}"
        else
            echo ""
            echo -e "  ${WARN}◈${N}  ${LGRAY}IDX Tool already configured — skipping.${N}"
            echo -e "  ${DGRAY}  Location: ~/vps123/.idx${N}"
        fi

        echo ""
        print_divider
        echo -ne "  ${B4}◈◈${N}  ${LGRAY}Press ${WHITE}Enter${LGRAY} to return to main menu...${N}"
        read -r
        ;;

    # ── (3) IDX VPS Maker ────────────────────────
    3)
        clear; print_logo
        print_status "⚡  IDX VPS MAKER"
        print_divider; echo ""

        echo -e "  ${B2}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "  ${B2}║${N}  ${B5}${BOLD}            IDX VPS CREATION TOOL                    ${N}  ${B2}║${N}"
        echo -e "  ${B2}╚══════════════════════════════════════════════════════════╝${N}"
        echo ""

        echo -e "  ${B5}◈${N}  ${LGRAY}Connecting to repository...${N}"
        echo -e "  ${DGRAY}$(printf '─%.0s' {1..54})${N}"
        echo ""
        echo -e "  ${B4}◈◈${N}  ${LGRAY}Executing IDX VPS Maker...${N}"
        echo -e "  ${DGRAY}$(printf '─%.0s' {1..54})${N}"

        bash <(curl -s https://raw.githubusercontent.com/jishnu-limited/app-build-journey/refs/heads/main/vpmakerkvmidx)

        echo ""
        print_divider
        echo -e "  ${B5}◈${N}  ${LGRAY}IDX VPS Maker execution completed.${N}"
        echo -ne "  ${B4}◈◈${N}  ${LGRAY}Press ${WHITE}Enter${LGRAY} to return to main menu...${N}"
        read -r
        ;;

    # ── (4) Real VPS (Any + KVM) ─────────────────
    4)
        clear; print_logo
        print_status "🌐  REAL VPS (ANY + KVM)"
        print_divider; echo ""

        echo -e "  ${B2}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "  ${B2}║${N}  ${B5}${BOLD}          REAL VPS DEPLOYMENT MODULE                 ${N}  ${B2}║${N}"
        echo -e "  ${B2}╚══════════════════════════════════════════════════════════╝${N}"
        echo ""

        echo -e "  ${B5}◈${N}  ${LGRAY}Running disk & system preparation (dd.sh)...${N}"
        echo -e "  ${DGRAY}$(printf '─%.0s' {1..54})${N}"
        bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/vm/dd.sh)

        echo ""
        echo -e "  ${OK}✓${N}  ${LGRAY}Disk preparation completed.${N}"
        echo ""
        echo -e "  ${B5}◈${N}  ${LGRAY}Launching Real VPS installer...${N}"
        echo -e "  ${DGRAY}$(printf '─%.0s' {1..54})${N}"
        bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/n)

        echo ""
        print_divider
        echo -e "  ${B5}◈${N}  ${LGRAY}Real VPS process finished.${N}"
        echo -ne "  ${B4}◈◈${N}  ${LGRAY}Press ${WHITE}Enter${LGRAY} to return to main menu...${N}"
        read -r
        ;;

    # ── (5) Exit ─────────────────────────────────
    5)
        clear; print_logo
        print_divider
        echo -e "  ${B4}${BOLD}                   SESSION TERMINATED                  ${N}"
        print_divider
        echo ""
        echo -e "  ${B1}┌$(printf '─%.0s' {1..56})┐${N}"
        echo -e "  ${B1}│${N}  ${LGRAY}Thank you for using ${WHITE}Hyperdock Network${LGRAY}!${N}              ${B1}│${N}"
        echo -e "  ${B1}│${N}  ${B6}Made with ❤  by Deniz${N}                             ${B1}│${N}"
        echo -e "  ${B1}└$(printf '─%.0s' {1..56})┘${N}"
        echo ""
        echo -e "  ${B5}◈${N}  ${LGRAY}Goodbye! Come back soon...${N}"
        echo ""
        print_footer
        sleep 2
        exit 0
        ;;

    # ── Invalid ───────────────────────────────────
    *)
        echo -e "  ${B2}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "  ${B2}║${N}  ${ERR}✗${N}  ${WHITE}Invalid option!${N}  ${DGRAY}Please choose between 1-5${N}          ${B2}║${N}"
        echo -e "  ${B2}╚══════════════════════════════════════════════════════════╝${N}"
        sleep 2
        ;;
    esac
done
