#!/bin/bash

# ==============================================================================
# HYPER DOCK - Advanced Virtual Machine Deployment System
# Version: 2.0 (Modern Rewrite)
# ==============================================================================

# --- Color Definitions ---
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
BG_BLUE="\033[44m"
BG_WHITE="\033[47m"

# --- Global Variables ---
HYPER_VERSION="2.0.0"
CONFIG_DIR="$HOME/.hyper_dock"
LOG_FILE="$CONFIG_DIR/hyper.log"

# --- Modern UI Functions ---

# Initialize environment
init_environment() {
    mkdir -p "$CONFIG_DIR"
    clear
}

# Smooth typing effect
type_text() {
    local text="$1"
    local delay=0.005
    if [[ "$2" != "" ]]; then delay="$2"; fi
    
    for ((i=0; i<${#text}; i++)); do
        printf "${text:$i:1}"
        sleep $delay
    done
}

# Modern progress bar
show_progress() {
    local duration=${1}
    local steps=50
    local increment=$((duration * 1000 / steps))
    
    printf "\n"
    for ((i=0; i<=steps; i++)); do
        local width=$((i * 2))
        local percentage=$((i * 100 / steps))
        printf "\r${CYAN}[${RESET}"
        for ((j=0; j<i; j++)); do printf "${GREEN}█${RESET}"; done
        for ((k=i; k<steps; k++)); do printf "${DIM}─${RESET}"; done
        printf "${CYAN}]${RESET} ${BOLD}${WHITE}%3d%%${RESET}" $percentage
        sleep 0.02
    done
    printf "\n\n"
}

# Spinner animation
show_spinner() {
    local pid=$1
    local delay=0.05
    local spinstr='|/-\'
    local i=0
    tput civis
    while [ -d /proc/$pid ]; do
        i=$(( (i+1) %4 ))
        printf "\r${CYAN}[${spinstr:$i:1}]${RESET} Processing..."
        sleep $delay
    done
    tput cnorm
    printf "\r${GREEN}[✓]${RESET} Done.          \n"
}

# Draw a modern box
draw_box() {
    local text="$1"
    local width=60
    local padding=$(( (width - ${#text}) / 2 ))
    
    printf "${CYAN}┌${RESET}"
    for ((i=0; i<width; i++)); do printf "${CYAN}─${RESET}"; done
    printf "${CYAN}┐${RESET}\n"
    
    printf "${CYAN}│${RESET}"
    for ((i=0; i<padding; i++)); do printf " "; done
    printf "${BOLD}${WHITE}%s${RESET}" "$text"
    for ((i=padding+${#text}; i<width; i++)); do printf " "; done
    printf "${CYAN}│${RESET}\n"
    
    printf "${CYAN}└${RESET}"
    for ((i=0; i<width; i++)); do printf "${CYAN}─${RESET}"; done
    printf "${CYAN}┘${RESET}\n"
}

# Display Logo
show_logo() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
    ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ███╗   ███╗ ██████╗ ██████╗ ██████╗ ███████╗
    ██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗████╗ ████║██╔═══██╗██╔══██╗██╔══██╗██╔════╝
    ███████║██║   ██║██████╔╝█████╗  ██████╔╝██╔████╔██║██║   ██║██║  ██║██║  ██║█████╗  
    ██╔══██║██║   ██║██╔══██╗██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║██║  ██║██║  ██║██╔══╝  
    ██║  ██║╚██████╔╝██████╔╝███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██████╔╝██████╔╝███████╗
    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
    ██╗   ██╗ ██████╗ ██╗   ██╗    ██████╗  ██████╗ ██████╗     ██████╗ ██████╗  ██████╗ ██╗  ██╗██╗   ██╗
    ██║   ██║██╔═══██╗██║   ██║    ██╔══██╗██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝╚██╗ ██╔╝
    ██║   ██║██║   ██║██║   ██║    ██████╔╝██║   ██║██║  ██║    ██████╔╝██████╔╝██║   ██║ ╚███╔╝  ╚████╔╝ 
    ╚██╗ ██╔╝██║   ██║██║   ██║    ██╔═══╝ ██║   ██║██║  ██║    ██╔═══╝ ██╔══██╗██║   ██║ ██╔██╗   ╚██╔╝  
     ╚████╔╝ ╚██████╔╝╚██████╔╝    ██║     ╚██████╔╝██████╔╝    ██║     ██║  ██║╚██████╔╝██╔╝ ██╗   ██║   
      ╚═══╝   ╚═════╝  ╚═════╝     ╚═╝      ╚═════╝ ╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
EOF
    echo -e "${RESET}"
    echo -e "${DIM}                  [ Advanced Virtualization Interface // Version $HYPER_VERSION ]${RESET}"
    echo ""
    type_text "${GREEN}>> System Initialized.${RESET}"
    echo ""
}

# --- Core Logic ---

check_dependencies() {
    printf "${YELLOW}Checking system dependencies...${RESET}\n"
    local deps=("qemu-system-x86_64" "wget" "curl" "virt-install" "genisoimage")
    local missing=()
    
    for cmd in "${deps[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing+=("$cmd")
        fi
    done

    if [ ${#missing[@]} -ne 0 ]; then
        printf "${RED}Missing dependencies: ${missing[*]}${RESET}\n"
        printf "${YELLOW}Attempting to install missing packages...${RESET}\n"
        if command -v apt-get &> /dev/null; then
            sudo apt-get update -qq && sudo apt-get install -y -qq qemu-system-x86 wget curl virtinst genisoimage > /dev/null &
            show_spinner $!
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y -q qemu-kvm wget curl virt-install genisoimage > /dev/null &
            show_spinner $!
        else
            printf "${RED}Package manager not supported. Please install: ${missing[*]}${RESET}\n"
            exit 1
        fi
    fi
    printf "${GREEN}Dependencies satisfied.${RESET}\n\n"
}

# --- Distribution Configuration ---

declare -A DISTRO_MAP

# Pre-populating 30+ Distros
load_distros() {
    DISTRO_MAP["1"]="Ubuntu 24.04|https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
    DISTRO_MAP["2"]="Ubuntu 22.04|https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
    DISTRO_MAP["3"]="Debian 12|https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-nocloud-amd64.qcow2"
    DISTRO_MAP["4"]="Fedora 40|https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2"
    DISTRO_MAP["5"]="Fedora 39|https://download.fedoraproject.org/pub/fedora/linux/releases/39/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-39-1.5.qcow2"
    DISTRO_MAP["6"]="CentOS Stream 9|https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2"
    DISTRO_MAP["7"]="AlmaLinux 9|https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2"
    DISTRO_MAP["8"]="Rocky Linux 9|https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
    DISTRO_MAP["9"]="Arch Linux|https://geo.mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2"
    DISTRO_MAP["10"]="Manjaro|https://download.manjaro.org/kvm/manjaro-kvm-21.2.6.qcow2"
    DISTRO_MAP["11"]="OpenSUSE Tumbleweed|https://download.opensuse.org/repositories/Cloud:/Images:/Tumbleweed/images/openSUSE-Tumbleweed-Cloud.qcow2"
    DISTRO_MAP["12"]="OpenSUSE Leap 15.5|https://download.opensuse.org/distribution/leap/15.5/appliances/openSUSE-Leap-15.5-JeOS.x86_64-15.5.0-OpenStack-Cloud.qcow2"
    DISTRO_MAP["13"]="Gentoo|https://gentoo.osuosl.org/experimental/amd64/openstack/gentoo-openstack-amd64-default-latest.qcow2"
    DISTRO_MAP["14"]="Alpine Linux|https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.0-x86_64.iso"
    DISTRO_MAP["15"]="Void Linux|https://alpha.de.repo.voidlinux.org/live/void-live-x86_64-20221001-base.iso"
    DISTRO_MAP["16"]="Slackware|https://slackware.uk/slackware/slackware64-15.0/isolinux/initrd.img" # Note: Needs specific handling, placeholder url
    DISTRO_MAP["17"]="NixOS|https://channels.nixos.org/nixos-23.11/latest-nixos-minimal-x86_64-linux.iso"
    DISTRO_MAP["18"]="Solus|https://downloads.getsol.us/isos/current/Solus-4.5-Budgie.iso"
    DISTRO_MAP["19"]="Kali Linux|https://kali.download/base-images/kali-2024.1/kali-linux-2024.1-cloud-amd64.qcow2"
    DISTRO_MAP["20"]="MX Linux|https://sourceforge.net/projects/mx-linux/files/Final/X23/MX-23_x64.iso/download"
    DISTRO_MAP["21"]="Linux Mint 21.3|https://mirrors.edge.kernel.org/linuxmint/stable/21.3/linuxmint-21.3-cinnamon-64bit.iso"
    DISTRO_MAP["22"]="Zorin OS|https://downloads.sourceforge.net/project/zorin-os/17/Core/Zorin-OS-17-Core-64-bit.iso"
    DISTRO_MAP["23"]="Pop!_OS|https://pop-iso.sfo2.cdn.digitaloceanspaces.com/22.04/amd64/intel/22/pop-os_22.04_amd64_intel_10.iso"
    DISTRO_MAP["24"]="Elementary OS|https://downloads.sourceforge.net/project/elementary-os/stable/7.1/elementaryos-7.1-stable.20231110.iso"
    DISTRO_MAP["25"]="Peppermint|https://sourceforge.net/projects/peppermintos/files/Peppermint%20Debian%20Dev/peppermint-11-04-2023-amd64.iso"
    DISTRO_MAP["26"]="Q4OS|https://q4os.org/downloads/q4os-4.8-x64.r1.iso"
    DISTRO_MAP["27"]="ReactOS|https://downloads.sourceforge.net/project/reactos/ReactOS/0.4.14/ReactOS-0.4.14-release-17-g67f279f-live.zip"
    DISTRO_MAP["28"]="FreeBSD|https://download.freebsd.org/releases/VM-IMAGES/14.0-RELEASE/amd64/Latest/FreeBSD-14.0-RELEASE-amd64.qcow2"
    DISTRO_MAP["29"]="OpenBSD|https://cdn.openbsd.org/pub/OpenBSD/7.5/amd64/install75.iso"
    DISTRO_MAP["30"]="NetBSD|https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.0/images/NetBSD-10.0-amd64.iso"
    DISTRO_MAP["31"]="Tiny Core|http://tinycorelinux.net/15.x/x86_64/release/TinyCorePure64-15.0.iso"
    DISTRO_MAP["32"]="Puppy Linux|http://distro.ibiblio.org/puppylinux/puppy-fossa/fossapup64-9.5.iso"
    DISTRO_MAP["33"]="Kaisen Linux|https://kaisen-linux.org/downloads/kaisen-linux-rolling-2.0-amd64.iso"
    DISTRO_MAP["34"]="Parrot OS|https://download.parrot.sh/parrot/iso/6.0/Parrot-home-6.0_amd64.iso"
    DISTRO_MAP["35"]="BackBox|https://linuxfree.download/distros/backbox/backbox-8.1-amd64.iso"
}

# --- Installation Logic ---

install_distro() {
    local choice=$1
    local data="${DISTRO_MAP[$choice]}"
    
    if [[ -z "$data" ]]; then
        printf "${RED}Invalid selection.${RESET}\n"
        return 1
    fi
    
    IFS='|' read -r name url <<< "$data"
    
    clear
    draw_box "Installing $name"
    echo ""
    
    local img_dir="$HOME/hyper_dock_vms"
    mkdir -p "$img_dir"
    local file_name=$(basename "$url" | sed 's/?.*//')
    local img_path="$img_dir/$file_name"
    
    # Special Handling for Fedora 40
    if [[ "$name" == "Fedora 40" ]]; then
        printf "${YELLOW}Applying Fedora 40 specific patches...${RESET}\n"
        # Example fix: Force specific mirror or strip parameters that might fail
        url="https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2"
        file_name="Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2"
        img_path="$img_dir/$file_name"
    fi

    if [[ -f "$img_path" ]]; then
        printf "${GREEN}Image already exists at $img_path${RESET}\n"
    else
        printf "${CYAN}Downloading $name...${RESET}\n"
        printf "${DIM}Source: $url${RESET}\n\n"
        
        # Modern download with progress
        wget --show-progress -q -O "$img_path" "$url"
        
        if [[ $? -ne 0 ]]; then
            printf "${RED}Download failed. Check URL or network connection.${RESET}\n"
            return 1
        fi
        printf "\n${GREEN}Download complete!${RESET}\n"
    fi
    
    # Spinning up VM
    printf "\n${YELLOW}Preparing Virtual Machine...${RESET}\n"
    show_progress 2
    
    printf "${CYAN}Launching VM Instance...${RESET}\n"
    
    # Check if QEMU is available
    if command -v qemu-system-x86_64 &> /dev/null; then
        # Run in background
        qemu-system-x86_64 \
            -m 2048 \
            -smp 2 \
            -drive file="$img_path",format=qcow2 \
            -enable-kvm \
            -cpu host \
            -vga qxl \
            -net nic -net user,hostfwd=tcp::2222-:22 \
            -daemonize \
            -name "HyperDock-$name"
            
        printf "${GREEN}VM Started in background.${RESET}\n"
        printf "${WHITE}Connect via SSH: ${CYAN}ssh user@localhost -p 2222${RESET}\n"
        printf "${WHITE}Graphics output enabled (VNC/Spice might be needed for GUIs).${RESET}\n"
    else
        printf "${RED}QEMU not found. Cannot launch VM.${RESET}\n"
    fi
}

# --- Main Menu ---

show_menu() {
    clear
    show_logo
    
    printf "${WHITE}Available Operating Systems:${RESET}\n"
    printf "${DIM}─────────────────────────────────────────────────────────────────${RESET}\n"
    
    # Print distros in 2 columns for modern look
    local keys=($(echo "${!DISTRO_MAP[@]}" | tr ' ' '\n' | sort -n))
    local count=${#keys[@]}
    local half=$(( (count + 1) / 2 ))
    
    for ((i=0; i<half; i++)); do
        local idx=${keys[$i]}
        IFS='|' read -r name _ <<< "${DISTRO_MAP[$idx]}"
        
        # Second column index
        local j=$((i + half))
        local line="${CYAN}[$idx]${RESET} ${name}"
        
        # Padding
        printf "%-35s" "$line"
        
        if [[ $j -lt $count ]]; then
            local idx2=${keys[$j]}
            IFS='|' read -r name2 _ <<< "${DISTRO_MAP[$idx2]}"
            printf "${CYAN}[$idx2]${RESET} ${name2}"
        fi
        printf "\n"
    done
    
    printf "${DIM}─────────────────────────────────────────────────────────────────${RESET}\n"
    printf "${WHITE}[Q] Quit${RESET}\n\n"
    
    read -p "$(echo -e "${BOLD}${GREEN}Select OS to Deploy: ${RESET}")" choice
    
    if [[ "$choice" == "Q" || "$choice" == "q" ]]; then
        echo "Goodbye!"
        exit 0
    fi
    
    install_distro "$choice"
    read -p "Press Enter to continue..."
}

# --- Entry Point ---

main() {
    init_environment
    check_dependencies
    load_distros
    
    while true; do
        show_menu
    done
}

main
