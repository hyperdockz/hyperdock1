#!/bin/bash

case "$0" in
    /dev/fd/*|/proc/self/fd/*) ;;
    *)
        if [ -z "$HYPERDOCK_NOCRLF" ] && grep -q $'\r' "$0" 2>/dev/null; then
            export HYPERDOCK_NOCRLF=1
            tr -d '\r' < "$0" | bash
            exit $?
        fi
        ;;
esac

 # COLORS - BLUE THEME
 R="\e[1;34m"  # Bright Blue
 G="\e[1;36m"  # Cyan
 Y="\e[1;33m"  # Yellow
 B="\e[1;94m"  # Light Blue
 C="\e[1;96m"  # Bright Cyan
 M="\e[1;35m"  # Magenta
 W="\e[1;37m"  # White
 N="\e[0m"     # Reset
 
 type_out() {
     local text="$1"
     local delay="${2:-0.003}"
     local i char
     for ((i=0; i<${#text}; i++)); do
         char="${text:i:1}"
         echo -ne "$char"
         sleep "$delay"
     done
 }
 
 type_line() {
     local text="$1"
     local delay="${2:-0.003}"
     type_out "$text" "$delay"
     echo
 }
 
 # JISHNU NETWORK ASCII ART
 print_jishnu_logo() {
     echo -e "\n${R}╔══════════════════════════════════════════════════════════╗${N}"
     echo -e "${R}║${W}      ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗         ${R}║${N}"
     echo -e "${R}║${W}      ██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗        ${R}║${N}"
     echo -e "${R}║${W}      ███████║██║   ██║██████╔╝███████╗██████╔╝        ${R}║${N}"
     echo -e "${R}║${W}      ██╔══██║██║   ██║██╔═══╝ ╚════██║██╔══██╗        ${R}║${N}"
     echo -e "${R}║${W}      ██║  ██║╚██████╔╝██║     ███████║██║  ██║        ${R}║${N}"
     echo -e "${R}║${W}      ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝        ${R}║${N}"
     echo -e "${R}║${Y}                  H Y P E R D O C K                    ${R}║${N}"
     echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}"
     echo -e "${Y}                    Made by Hyperdock                  ${N}\n"
 }
 
 # NEW UI STYLE FUNCTIONS
 print_box() {
     local text="$1"
     local color="$2"
     local width=52
     local padding=$(( (width - ${#text} - 2) / 2 ))
     
     echo -e "${color}╔$(printf '═%.0s' $(seq 1 $((width-2))))╗${N}"
     printf "${color}║%*s${W}%s${color}%*s║${N}\n" $padding "" "$text" $((padding - ((${#text} % 2) ? 1 : 0))) ""
     echo -e "${color}╚$(printf '═%.0s' $(seq 1 $((width-2))))╝${N}"
 }
 
 print_header() {
     clear
     print_jishnu_logo
     echo -e "${R}══════════════════════════════════════════════════════════${N}"
     type_line "${W}            DEVELOPMENT MANAGEMENT CONSOLE             ${N}"
     echo -e "${R}══════════════════════════════════════════════════════════${N}\n"
 }
 
 print_option() {
     local num="$1"
     local text="$2"
     local color="$3"
     
     echo -e "  ${color}╔══════════════════════════════════════════════╗${N}"
     echo -e "  ${color}║${W}  [${R}$num${W}]  ${Y}$text$(printf '%*s' $((33 - ${#text} - 6)))${color}║${N}"
     echo -e "  ${color}╚══════════════════════════════════════════════╝${N}\n"
 }
 
 print_status() {
     local text="$1"
     local color="$2"
     echo
     type_line "${R}▶▶${color} ${text}${N}" 0.002
     echo
 }
 
 print_divider() {
     echo -e "${R}══════════════════════════════════════════════════════════${N}"
 }
 
 print_footer() {
     echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
     echo -e "${R}│${W}             Hyperdock © 2024 - All Rights Reserved ${R}│${N}"
     echo -e "${R}└──────────────────────────────────────────────────────┘${N}\n"
 }
 
 print_linux_installer_menu() {
     echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
     echo -e "${R}║${Y}                 LINUX INSTALLER (50+)               ${R}║${N}"
     echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "1" "Ubuntu 24.04 Desktop" "2" "Ubuntu 22.04 Desktop"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "3" "Ubuntu 20.04 Desktop" "4" "Ubuntu Server 24.04"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "5" "Ubuntu Server 22.04" "6" "Kubuntu 24.04"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "7" "Xubuntu 24.04" "8" "Lubuntu 24.04"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "9" "Ubuntu Budgie 24.04" "10" "Debian 12 Netinst"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "11" "Debian 11 Netinst" "12" "Fedora 40 Server"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "13" "Fedora 39 Server" "14" "Fedora 38 Server"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "15" "Arch Linux" "16" "Manjaro XFCE"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "17" "EndeavourOS" "18" "Kali Linux"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "19" "Parrot OS" "20" "Linux Mint 21.3"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "21" "Pop!_OS 22.04" "22" "Zorin OS 17"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "23" "elementary OS 7.1" "24" "Deepin 23"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "25" "MX Linux 23" "26" "Garuda Dr460nized"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "27" "NixOS 24.05" "28" "Gentoo Minimal"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "29" "Slackware 15.0" "30" "Clear Linux"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "31" "Void Linux" "32" "Solus"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "33" "AlmaLinux 9" "34" "AlmaLinux 8"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "35" "Rocky Linux 9" "36" "Rocky Linux 8"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "37" "CentOS Stream 9" "38" "CentOS Stream 8"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "39" "Oracle Linux 9" "40" "Oracle Linux 8"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "41" "openSUSE Leap 15.6" "42" "openSUSE Tumbleweed"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "43" "KDE neon User" "44" "Q4OS 5"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "45" "Mageia 9" "46" "ROSA Fresh"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "47" "antiX 23" "48" "Alpine 3.20"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "49" "Puppy Linux" "50" "Tails 6"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "51" "Fedora Silverblue 40" "52" "Ubuntu 24.04 Minimal"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "53" "Debian 12 DVD" "54" "Fedora 40 KDE"
     printf "${W}%2s${Y} %-28s  ${W}%2s${Y} %-28s${N}\n" "55" "openSUSE MicroOS" "56" "Ubuntu 22.04 Minimal"
     echo
     echo -ne "${R}▶▶${W} Select Distro [1-56] : ${Y}"
     read -p "" distro_choice
     echo -ne "${N}"
     
     case $distro_choice in
         1) DISTRO_NAME="Ubuntu 24.04 Desktop"; ISO_URL="https://releases.ubuntu.com/24.04/ubuntu-24.04-desktop-amd64.iso" ;;
         2) DISTRO_NAME="Ubuntu 22.04 Desktop"; ISO_URL="https://releases.ubuntu.com/22.04/ubuntu-22.04.4-desktop-amd64.iso" ;;
         3) DISTRO_NAME="Ubuntu 20.04 Desktop"; ISO_URL="https://releases.ubuntu.com/20.04/ubuntu-20.04.6-desktop-amd64.iso" ;;
         4) DISTRO_NAME="Ubuntu Server 24.04"; ISO_URL="https://releases.ubuntu.com/24.04/ubuntu-24.04-live-server-amd64.iso" ;;
         5) DISTRO_NAME="Ubuntu Server 22.04"; ISO_URL="https://releases.ubuntu.com/22.04/ubuntu-22.04.4-live-server-amd64.iso" ;;
         6) DISTRO_NAME="Kubuntu 24.04"; ISO_URL="https://cdimage.ubuntu.com/kubuntu/releases/24.04/release/kubuntu-24.04-desktop-amd64.iso" ;;
         7) DISTRO_NAME="Xubuntu 24.04"; ISO_URL="https://cdimage.ubuntu.com/xubuntu/releases/24.04/release/xubuntu-24.04-desktop-amd64.iso" ;;
         8) DISTRO_NAME="Lubuntu 24.04"; ISO_URL="https://cdimage.ubuntu.com/lubuntu/releases/24.04/release/lubuntu-24.04-desktop-amd64.iso" ;;
         9) DISTRO_NAME="Ubuntu Budgie 24.04"; ISO_URL="https://cdimage.ubuntu.com/ubuntu-budgie/releases/24.04/release/ubuntu-budgie-24.04-desktop-amd64.iso" ;;
         10) DISTRO_NAME="Debian 12 Netinst"; ISO_URL="https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.6.0-amd64-netinst.iso" ;;
         11) DISTRO_NAME="Debian 11 Netinst"; ISO_URL="https://cdimage.debian.org/debian-cd/current/oldstable/amd64/iso-cd/debian-11.10.0-amd64-netinst.iso" ;;
         12) DISTRO_NAME="Fedora 40 Server"; ISO_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/40/Server/x86_64/iso/Fedora-Server-netinst-x86_64-40-1.14.iso" ;;
         13) DISTRO_NAME="Fedora 39 Server"; ISO_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/39/Server/x86_64/iso/Fedora-Server-netinst-x86_64-39-1.5.iso" ;;
         14) DISTRO_NAME="Fedora 38 Server"; ISO_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/38/Server/x86_64/iso/Fedora-Server-netinst-x86_64-38-1.6.iso" ;;
         15) DISTRO_NAME="Arch Linux"; ISO_URL="https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso" ;;
         16) DISTRO_NAME="Manjaro XFCE"; ISO_URL="https://download.manjaro.org/xfce/24.0.0/manjaro-xfce-24.0.0-240527-linux66.iso" ;;
         17) DISTRO_NAME="EndeavourOS"; ISO_URL="https://mirrors.gigenet.com/endeavouros/iso/EndeavourOS_Galileo_11_2023.iso" ;;
         18) DISTRO_NAME="Kali Linux"; ISO_URL="https://cdimage.kali.org/kali-2024.2/kali-linux-2024.2-installer-amd64.iso" ;;
         19) DISTRO_NAME="Parrot OS"; ISO_URL="https://deb.parrot.sh/parrot/iso/6.1/Parrot-security-6.1_amd64.iso" ;;
         20) DISTRO_NAME="Linux Mint 21.3"; ISO_URL="https://mirrors.edge.kernel.org/linuxmint/stable/21.3/linuxmint-21.3-cinnamon-64bit.iso" ;;
         21) DISTRO_NAME="Pop!_OS 22.04"; ISO_URL="https://iso.pop-os.org/22.04/amd64/intel/46/pop-os_22.04_amd64_intel_46.iso" ;;
         22) DISTRO_NAME="Zorin OS 17"; ISO_URL="https://zorinos.com/download/17/education/64bit" ;;
         23) DISTRO_NAME="elementary OS 7.1"; ISO_URL="https://objects.githubusercontent.com/github-production-release-asset-2e65be/13489680/4a5120cc-192a-4df6-80f0-4b50c1e2ed7f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=releaseassetproduction%2F20240301%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240301T000000Z&X-Amz-Expires=300&X-Amz-Signature=placeholder&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Delementaryos-7.1-stable.20231031rc.iso&response-content-type=application%2Foctet-stream" ;;
         24) DISTRO_NAME="Deepin 23"; ISO_URL="https://cdimage.deepin.com/releases/23/amd64/deepin-desktop-community-23-amd64.iso" ;;
         25) DISTRO_NAME="MX Linux 23"; ISO_URL="https://pilotfiber.dl.sourceforge.net/project/mx-linux/Final/Xfce/MX-23.3_x64.iso" ;;
         26) DISTRO_NAME="Garuda Dr460nized"; ISO_URL="https://sourceforge.net/projects/garuda-linux/files/dr460nized/240424/garuda-dr460nized-linux-zen-240424.iso/download" ;;
         27) DISTRO_NAME="NixOS 24.05"; ISO_URL="https://channels.nixos.org/nixos-24.05/latest-nixos-gnome-x86_64-linux.iso" ;;
         28) DISTRO_NAME="Gentoo Minimal"; ISO_URL="https://distfiles.gentoo.org/releases/amd64/autobuilds/current-install-amd64-minimal/install-amd64-minimal.iso" ;;
         29) DISTRO_NAME="Slackware 15.0"; ISO_URL="https://mirrors.slackware.com/slackware/slackware64-15.0-iso/slackware64-15.0-install-dvd.iso" ;;
         30) DISTRO_NAME="Clear Linux"; ISO_URL="https://cdn.download.clearlinux.org/releases/41020/clear/clear-41020-live-desktop.iso" ;;
         31) DISTRO_NAME="Void Linux"; ISO_URL="https://repo-default.voidlinux.org/live/current/void-live-x86_64-20230628.iso" ;;
         32) DISTRO_NAME="Solus"; ISO_URL="https://mirrors.rit.edu/solus/images/4.5/Solus-4.5-GNOME.iso" ;;
         33) DISTRO_NAME="AlmaLinux 9"; ISO_URL="https://repo.almalinux.org/almalinux/9/isos/x86_64/AlmaLinux-9-latest-x86_64-dvd.iso" ;;
         34) DISTRO_NAME="AlmaLinux 8"; ISO_URL="https://repo.almalinux.org/almalinux/8/isos/x86_64/AlmaLinux-8-latest-x86_64-dvd.iso" ;;
         35) DISTRO_NAME="Rocky Linux 9"; ISO_URL="https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-9-latest-x86_64-dvd.iso" ;;
         36) DISTRO_NAME="Rocky Linux 8"; ISO_URL="https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8-latest-x86_64-dvd.iso" ;;
         37) DISTRO_NAME="CentOS Stream 9"; ISO_URL="https://mirror.stream.centos.org/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-dvd1.iso" ;;
         38) DISTRO_NAME="CentOS Stream 8"; ISO_URL="https://mirror.stream.centos.org/8-stream/BaseOS/x86_64/iso/CentOS-Stream-8-latest-x86_64-dvd1.iso" ;;
         39) DISTRO_NAME="Oracle Linux 9"; ISO_URL="https://yum.oracle.com/ISOS/OracleLinux/OL9/u4/x86_64/OracleLinux-R9-U4-x86_64-dvd.iso" ;;
         40) DISTRO_NAME="Oracle Linux 8"; ISO_URL="https://yum.oracle.com/ISOS/OracleLinux/OL8/u10/x86_64/OracleLinux-R8-U10-x86_64-dvd.iso" ;;
         41) DISTRO_NAME="openSUSE Leap 15.6"; ISO_URL="https://download.opensuse.org/distribution/leap/15.6/iso/openSUSE-Leap-15.6-DVD-x86_64-Media.iso" ;;
         42) DISTRO_NAME="openSUSE Tumbleweed"; ISO_URL="https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso" ;;
         43) DISTRO_NAME="KDE neon User"; ISO_URL="https://files.kde.org/neon/images/user/20240425-0659/neon-user-20240425-0659.iso" ;;
         44) DISTRO_NAME="Q4OS 5"; ISO_URL="https://sourceforge.net/projects/q4os/files/stable/q4os-5.2-x64.r1.iso/download" ;;
         45) DISTRO_NAME="Mageia 9"; ISO_URL="https://mirror.math.princeton.edu/pub/mageia/distrib/9/iso/x86_64/Mageia-9-x86_64.iso" ;;
         46) DISTRO_NAME="ROSA Fresh"; ISO_URL="https://mirror.rosalab.ru/rosa/rosa2021.1/iso/x86_64/ROSA.FRESH.KDE5.x86_64.iso" ;;
         47) DISTRO_NAME="antiX 23"; ISO_URL="https://sourceforge.net/projects/antix-linux/files/Final/antiX-23_x64-full.iso/download" ;;
         48) DISTRO_NAME="Alpine 3.20"; ISO_URL="https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-standard-3.20.0-x86_64.iso" ;;
         49) DISTRO_NAME="Puppy Linux"; ISO_URL="https://distro.ibiblio.org/puppylinux/puppy-fossa/FossaPup64-9.5.iso" ;;
         50) DISTRO_NAME="Tails 6"; ISO_URL="https://mirrors.edge.kernel.org/tails/stable/tails-amd64-6.7/tails-amd64-6.7.iso" ;;
         51) DISTRO_NAME="Fedora Silverblue 40"; ISO_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/40/Silverblue/x86_64/iso/Fedora-Silverblue-ostree-x86_64-40-1.14.iso" ;;
         52) DISTRO_NAME="Ubuntu 24.04 Minimal"; ISO_URL="https://cdimage.ubuntu.com/ubuntu-minimal/releases/24.04/release/ubuntu-minimal-24.04-live-server-amd64.iso" ;;
         53) DISTRO_NAME="Debian 12 DVD"; ISO_URL="https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-12.6.0-amd64-DVD-1.iso" ;;
         54) DISTRO_NAME="Fedora 40 KDE"; ISO_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/40/Spins/x86_64/iso/Fedora-KDE-Live-x86_64-40-1.14.iso" ;;
         55) DISTRO_NAME="openSUSE MicroOS"; ISO_URL="https://download.opensuse.org/tumbleweed/iso/openSUSE-MicroOS-DVD-x86_64-Current.iso" ;;
         56) DISTRO_NAME="Ubuntu 22.04 Minimal"; ISO_URL="https://cdimage.ubuntu.com/ubuntu-minimal/releases/22.04/release/ubuntu-minimal-22.04.4-live-server-amd64.iso" ;;
         *) DISTRO_NAME="Custom ISO"; ISO_URL="" ;;
     esac
 }
 
 download_iso_if_needed() {
     local iso_dir="$1"
     local iso_url="$2"
     local iso_name
     if [ -z "$iso_url" ]; then
         return
     fi
     iso_name="${iso_url##*/}"
     ISO_PATH="$iso_dir/$iso_name"
     if [ -f "$ISO_PATH" ]; then
         echo -e "${G}✅ ISO already exists: ${ISO_PATH}${N}"
         return
     fi
     echo -e "${Y}⬇️  Downloading ISO for ${DISTRO_NAME}...${N}"
     curl -L --fail -o "$ISO_PATH" "$iso_url"
     if [ $? -ne 0 ]; then
         echo -e "${R}▶▶${W} Download failed for ${DISTRO_NAME}.${N}"
         echo -ne "${R}▶▶${W} Enter direct ISO URL or leave blank to skip: ${Y}"
         read -p "" custom_url
         echo -ne "${N}"
         if [ -n "$custom_url" ]; then
             ISO_PATH="$iso_dir/${custom_url##*/}"
             curl -L --fail -o "$ISO_PATH" "$custom_url"
         fi
     fi
 }
 
vm_print_status() {
    local type="$1"
    local message="$2"
    case "$type" in
        INFO) echo -e "${C}📋 [INFO]${N} $message" ;;
        WARN) echo -e "${Y}⚠️  [WARN]${N} $message" ;;
        ERROR) echo -e "${R}❌ [ERROR]${N} $message" ;;
        SUCCESS) echo -e "${G}✅ [SUCCESS]${N} $message" ;;
        INPUT) echo -e "${C}🎯 [INPUT]${N} $message" ;;
        *) echo -e "$message" ;;
    esac
}

vm_prompt() {
    local message="$1"
    printf "%b" "${C}🎯 [INPUT]${N} $message"
}

vm_read() {
    local __var="$1"
    local prompt="$2"
    read -r -p "$(vm_prompt "$prompt")" "$__var"
}

vm_read_secret() {
    local __var="$1"
    local prompt="$2"
    read -r -s -p "$(vm_prompt "$prompt")" "$__var"
    echo
}

vm_read_char() {
    local __var="$1"
    local prompt="$2"
    read -r -n 1 -p "$(vm_prompt "$prompt")" "$__var"
    echo
}

vm_pause() {
    local prompt="$1"
    read -r -p "$(vm_prompt "$prompt")"
}

vm_display_header() {
    clear
    print_jishnu_logo
    echo -e "${B}══════════════════════════════════════════════════════════${N}"
    echo -e "${W}               HYPERDOCK VM MANAGER                   ${N}"
    echo -e "${B}══════════════════════════════════════════════════════════${N}"
    echo
}

vm_check_dependencies() {
    local deps=("qemu-system-x86_64" "wget" "cloud-localds" "qemu-img" "lsof" "openssl" "ss")
    local missing=()
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            missing+=("$dep")
        fi
    done
    if [ ${#missing[@]} -ne 0 ]; then
        vm_print_status ERROR "Missing dependencies: ${missing[*]}"
        vm_print_status INFO "On Ubuntu/Debian: sudo apt install qemu-system cloud-image-utils wget lsof openssl iproute2"
        return 1
    fi
    return 0
}

vm_cleanup() {
    if [ -f "user-data" ]; then rm -f "user-data"; fi
    if [ -f "meta-data" ]; then rm -f "meta-data"; fi
}

vm_get_list() {
    find "$VM_DIR" -name "*.conf" -exec basename {} .conf \; 2>/dev/null | sort
}

vm_validate_input() {
    local type="$1"
    local value="$2"
    case "$type" in
        number)
            [[ "$value" =~ ^[0-9]+$ ]] || { vm_print_status ERROR "Must be a number"; return 1; }
            ;;
        size)
            [[ "$value" =~ ^[0-9]+[GgMm]$ ]] || { vm_print_status ERROR "Must be a size with unit (e.g., 20G, 512M)"; return 1; }
            ;;
        port)
            [[ "$value" =~ ^[0-9]+$ ]] && [ "$value" -ge 23 ] && [ "$value" -le 65535 ] || { vm_print_status ERROR "Must be a valid port (23-65535)"; return 1; }
            ;;
        name)
            [[ "$value" =~ ^[a-zA-Z0-9_-]+$ ]] || { vm_print_status ERROR "VM name can only contain letters, numbers, hyphens, underscores"; return 1; }
            ;;
        username)
            [[ "$value" =~ ^[a-z_][a-z0-9_-]*$ ]] || { vm_print_status ERROR "Username must start with a letter or underscore"; return 1; }
            ;;
    esac
    return 0
}

vm_check_image_lock() {
    local img_file="$1"
    local vm_name="$2"
    if lsof "$img_file" 2>/dev/null | grep -q qemu-system; then
        vm_print_status WARN "Image file is in use: $img_file"
        local pid
        pid=$(lsof "$img_file" 2>/dev/null | grep qemu-system | awk '{print $2}' | head -1)
        if [ -n "$pid" ]; then
            vm_print_status INFO "Process ID using the image: $pid"
            if ps -p "$pid" -o cmd= | grep -q "$vm_name"; then
                vm_read kill_choice "Kill existing process and restart? (y/N): "
                if [[ "$kill_choice" =~ ^[Yy]$ ]]; then
                    kill "$pid" 2>/dev/null
                    sleep 2
                    if kill -0 "$pid" 2>/dev/null; then
                        kill -9 "$pid" 2>/dev/null
                    fi
                    return 0
                fi
            fi
        fi
        return 1
    fi
    local lock_file="${img_file}.lock"
    if [ -f "$lock_file" ]; then
        vm_print_status WARN "Lock file found: $lock_file"
        if [[ $(find "$lock_file" -mmin +5 2>/dev/null) ]]; then
            vm_read remove_lock "Remove stale lock file? (y/N): "
            if [[ "$remove_lock" =~ ^[Yy]$ ]]; then
                rm -f "$lock_file"
                vm_print_status SUCCESS "Removed stale lock file"
                return 0
            fi
        fi
        return 1
    fi
    return 0
}

vm_load_config() {
    local vm_name="$1"
    local config_file="$VM_DIR/$vm_name.conf"
    if [[ -f "$config_file" ]]; then
        unset VM_NAME OS_TYPE CODENAME IMG_URL HOSTNAME USERNAME PASSWORD
        unset DISK_SIZE MEMORY CPUS SSH_PORT GUI_MODE PORT_FORWARDS IMG_FILE SEED_FILE CREATED
        source "$config_file"
        return 0
    fi
    vm_print_status ERROR "Configuration for VM '$vm_name' not found"
    return 1
}

vm_save_config() {
    local config_file="$VM_DIR/$VM_NAME.conf"
    cat > "$config_file" <<EOF
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
    vm_print_status SUCCESS "Configuration saved to $config_file"
}

vm_setup_image() {
    vm_print_status INFO "Downloading and preparing image..."
    mkdir -p "$VM_DIR"
    if [[ -f "$IMG_FILE" ]]; then
        vm_print_status INFO "Image already exists. Skipping download."
    else
        vm_print_status INFO "Downloading image from $IMG_URL..."
        if ! wget --progress=bar:force "$IMG_URL" -O "$IMG_FILE.tmp"; then
            vm_print_status ERROR "Failed to download image from $IMG_URL"
            return 1
        fi
        mv "$IMG_FILE.tmp" "$IMG_FILE"
    fi
    if ! qemu-img resize "$IMG_FILE" "$DISK_SIZE" 2>/dev/null; then
        rm -f "$IMG_FILE"
        qemu-img create -f qcow2 "$IMG_FILE" "$DISK_SIZE" >/dev/null 2>&1 || return 1
    fi
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
    cloud-localds "$SEED_FILE" user-data meta-data >/dev/null 2>&1 || return 1
    return 0
}

vm_is_running() {
    local vm_name="$1"
    if pgrep -f "qemu-system.*$vm_name" >/dev/null; then
        return 0
    fi
    if vm_load_config "$vm_name" 2>/dev/null; then
        if pgrep -f "qemu-system.*$IMG_FILE" >/dev/null; then
            return 0
        fi
    fi
    return 1
}

vm_create_new() {
    vm_print_status INFO "Creating a new VM"
    vm_print_status INFO "Select an OS:"
    local os_options=()
    local i=1
    for os in "${!VM_OS_OPTIONS[@]}"; do
        echo "  $i) $os"
        os_options[$i]="$os"
        ((i++))
    done
    while true; do
        vm_read choice "Enter your choice (1-${#VM_OS_OPTIONS[@]}): "
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#VM_OS_OPTIONS[@]} ]; then
            local os="${os_options[$choice]}"
            IFS='|' read -r OS_TYPE CODENAME IMG_URL DEFAULT_HOSTNAME DEFAULT_USERNAME DEFAULT_PASSWORD <<< "${VM_OS_OPTIONS[$os]}"
            break
        fi
        vm_print_status ERROR "Invalid selection"
    done
    while true; do
        vm_read VM_NAME "VM name (default: $DEFAULT_HOSTNAME): "
        VM_NAME="${VM_NAME:-$DEFAULT_HOSTNAME}"
        if vm_validate_input "name" "$VM_NAME"; then
            if [[ -f "$VM_DIR/$VM_NAME.conf" ]]; then
                vm_print_status ERROR "VM '$VM_NAME' already exists"
            else
                break
            fi
        fi
    done
    while true; do
        vm_read HOSTNAME "Hostname (default: $VM_NAME): "
        HOSTNAME="${HOSTNAME:-$VM_NAME}"
        if vm_validate_input "name" "$HOSTNAME"; then
            break
        fi
    done
    while true; do
        vm_read USERNAME "Username (default: $DEFAULT_USERNAME): "
        USERNAME="${USERNAME:-$DEFAULT_USERNAME}"
        if vm_validate_input "username" "$USERNAME"; then
            break
        fi
    done
    while true; do
        vm_read_secret PASSWORD "Password (default: $DEFAULT_PASSWORD): "
        PASSWORD="${PASSWORD:-$DEFAULT_PASSWORD}"
        echo
        if [ -n "$PASSWORD" ]; then
            break
        fi
        vm_print_status ERROR "Password cannot be empty"
    done
    while true; do
        vm_read DISK_SIZE "Disk size (default: 20G): "
        DISK_SIZE="${DISK_SIZE:-20G}"
        if vm_validate_input "size" "$DISK_SIZE"; then
            break
        fi
    done
    while true; do
        vm_read MEMORY "Memory in MB (default: 2048): "
        MEMORY="${MEMORY:-2048}"
        if vm_validate_input "number" "$MEMORY"; then
            break
        fi
    done
    while true; do
        vm_read CPUS "Number of CPUs (default: 2): "
        CPUS="${CPUS:-2}"
        if vm_validate_input "number" "$CPUS"; then
            break
        fi
    done
    while true; do
        vm_read SSH_PORT "SSH Port (default: 2222): "
        SSH_PORT="${SSH_PORT:-2222}"
        if vm_validate_input "port" "$SSH_PORT"; then
            if ss -tln 2>/dev/null | grep -q ":$SSH_PORT "; then
                vm_print_status ERROR "Port $SSH_PORT is already in use"
            else
                break
            fi
        fi
    done
    while true; do
        vm_read gui_input "Enable GUI mode? (y/n, default: n): "
        gui_input="${gui_input:-n}"
        if [[ "$gui_input" =~ ^[Yy]$ ]]; then
            GUI_MODE=true
            break
        elif [[ "$gui_input" =~ ^[Nn]$ ]]; then
            GUI_MODE=false
            break
        else
            vm_print_status ERROR "Please answer y or n"
        fi
    done
    vm_read PORT_FORWARDS "Additional port forwards (e.g., 8080:80, Enter for none): "
    IMG_FILE="$VM_DIR/$VM_NAME.img"
    SEED_FILE="$VM_DIR/$VM_NAME-seed.iso"
    CREATED="$(date)"
    if ! vm_setup_image; then
        vm_print_status ERROR "Failed to prepare VM image"
        return 1
    fi
    vm_save_config
    vm_print_status SUCCESS "VM '$VM_NAME' created"
    vm_print_status INFO "Login: username=$USERNAME password=$PASSWORD"
    vm_print_status INFO "SSH: ssh -p $SSH_PORT $USERNAME@localhost"
}

vm_start() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        if ! vm_check_image_lock "$IMG_FILE" "$vm_name"; then
            vm_print_status ERROR "Image locked by another process"
            vm_read force_kill "Force kill QEMU using this image? (y/N): "
            if [[ "$force_kill" =~ ^[Yy]$ ]]; then
                pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null
                sleep 2
                pkill -9 -f "qemu-system.*$IMG_FILE" 2>/dev/null
                rm -f "${IMG_FILE}.lock" 2>/dev/null
            else
                return 1
            fi
        fi
        if vm_is_running "$vm_name"; then
            vm_print_status WARN "VM '$vm_name' already running"
            vm_read restart_choice "Stop and restart? (y/N): "
            if [[ "$restart_choice" =~ ^[Yy]$ ]]; then
                vm_stop "$vm_name"
                sleep 2
            else
                return 1
            fi
        fi
        vm_print_status INFO "Starting VM: $vm_name"
        vm_print_status INFO "SSH: ssh -p $SSH_PORT $USERNAME@localhost"
        vm_print_status INFO "Password: $PASSWORD"
        if [[ ! -f "$IMG_FILE" ]]; then
            vm_print_status ERROR "Image file not found: $IMG_FILE"
            return 1
        fi
        if [[ ! -f "$SEED_FILE" ]]; then
            vm_print_status WARN "Seed file missing, recreating"
            vm_setup_image || return 1
        fi
        local qemu_cmd=(
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
        if [[ -n "$PORT_FORWARDS" ]]; then
            IFS=',' read -ra forwards <<< "$PORT_FORWARDS"
            for forward in "${forwards[@]}"; do
                IFS=':' read -r host_port guest_port <<< "$forward"
                qemu_cmd+=(-device "virtio-net-pci,netdev=n${#qemu_cmd[@]}")
                qemu_cmd+=(-netdev "user,id=n${#qemu_cmd[@]},hostfwd=tcp::$host_port-:$guest_port")
            done
        fi
        if [[ "$GUI_MODE" == true ]]; then
            qemu_cmd+=(-vga virtio -display gtk,gl=on)
            vm_print_status INFO "Starting in GUI mode"
        else
            qemu_cmd+=(-nographic -serial mon:stdio)
            vm_print_status INFO "Starting in console mode"
            vm_print_status INFO "Press Ctrl+A then X to exit"
        fi
        qemu_cmd+=(
            -device virtio-balloon-pci
            -object rng-random,filename=/dev/urandom,id=rng0
            -device virtio-rng-pci,rng=rng0
        )
        vm_print_status INFO "Starting QEMU..."
        echo "Configuration: ${MEMORY}MB RAM, ${CPUS} CPUs, ${DISK_SIZE} disk"
        if ! "${qemu_cmd[@]}"; then
            vm_print_status ERROR "Failed to start VM"
            rm -f "${IMG_FILE}.lock" 2>/dev/null
            return 1
        fi
        vm_print_status INFO "VM $vm_name stopped"
    fi
}

vm_stop() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        if vm_is_running "$vm_name"; then
            vm_print_status INFO "Stopping VM: $vm_name"
            pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null
            sleep 2
            if vm_is_running "$vm_name"; then
                pkill -9 -f "qemu-system.*$IMG_FILE" 2>/dev/null
                sleep 1
            fi
            rm -f "${IMG_FILE}.lock" 2>/dev/null
            if vm_is_running "$vm_name"; then
                vm_print_status ERROR "Failed to stop VM"
                return 1
            fi
            vm_print_status SUCCESS "VM $vm_name stopped"
        else
            vm_print_status INFO "VM $vm_name is not running"
            rm -f "${IMG_FILE}.lock" 2>/dev/null
        fi
    fi
}

vm_delete() {
    local vm_name="$1"
    vm_print_status WARN "This will delete VM '$vm_name' and all data"
    vm_read_char REPLY "Are you sure? (y/N): "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if vm_load_config "$vm_name"; then
            if vm_is_running "$vm_name"; then
                vm_stop "$vm_name"
                sleep 2
            fi
            rm -f "$IMG_FILE" "$SEED_FILE" "$VM_DIR/$vm_name.conf" "${IMG_FILE}.lock" 2>/dev/null
            vm_print_status SUCCESS "VM '$vm_name' deleted"
        fi
    else
        vm_print_status INFO "Deletion cancelled"
    fi
}

vm_show_info() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        echo
        vm_print_status INFO "VM Information: $vm_name"
        echo "OS: $OS_TYPE"
        echo "Hostname: $HOSTNAME"
        echo "Username: $USERNAME"
        echo "Password: $PASSWORD"
        echo "SSH Port: $SSH_PORT"
        echo "Memory: $MEMORY MB"
        echo "CPUs: $CPUS"
        echo "Disk: $DISK_SIZE"
        echo "GUI Mode: $GUI_MODE"
        echo "Port Forwards: ${PORT_FORWARDS:-None}"
        echo "Created: $CREATED"
        echo "Image File: $IMG_FILE"
        echo "Seed File: $SEED_FILE"
        if vm_check_image_lock "$IMG_FILE" "$vm_name" >/dev/null 2>&1; then
            echo "Image Status: Unlocked"
        else
            echo "Image Status: Locked"
        fi
        if vm_is_running "$vm_name"; then
            echo "Status: Running"
        else
            echo "Status: Stopped"
        fi
        echo
        vm_pause "Press Enter to continue..."
    fi
}

vm_edit_config() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        vm_print_status INFO "Editing VM: $vm_name"
        while true; do
            echo "1) Hostname"
            echo "2) Username"
            echo "3) Password"
            echo "4) SSH Port"
            echo "5) GUI Mode"
            echo "6) Port Forwards"
            echo "7) Memory (RAM)"
            echo "8) CPU Count"
            echo "9) Disk Size"
            echo "0) Back"
            vm_read edit_choice "Enter your choice: "
            case $edit_choice in
                1)
                    while true; do
                        vm_read new_hostname "New hostname (current: $HOSTNAME): "
                        new_hostname="${new_hostname:-$HOSTNAME}"
                        if vm_validate_input "name" "$new_hostname"; then
                            HOSTNAME="$new_hostname"
                            break
                        fi
                    done
                    ;;
                2)
                    while true; do
                        vm_read new_username "New username (current: $USERNAME): "
                        new_username="${new_username:-$USERNAME}"
                        if vm_validate_input "username" "$new_username"; then
                            USERNAME="$new_username"
                            break
                        fi
                    done
                    ;;
                3)
                    while true; do
                        vm_read_secret new_password "New password: "
                        new_password="${new_password:-$PASSWORD}"
                        if [ -n "$new_password" ]; then
                            PASSWORD="$new_password"
                            break
                        fi
                        vm_print_status ERROR "Password cannot be empty"
                    done
                    ;;
                4)
                    while true; do
                        vm_read new_ssh_port "New SSH port (current: $SSH_PORT): "
                        new_ssh_port="${new_ssh_port:-$SSH_PORT}"
                        if vm_validate_input "port" "$new_ssh_port"; then
                            if [ "$new_ssh_port" != "$SSH_PORT" ] && ss -tln 2>/dev/null | grep -q ":$new_ssh_port "; then
                                vm_print_status ERROR "Port $new_ssh_port is already in use"
                            else
                                SSH_PORT="$new_ssh_port"
                                break
                            fi
                        fi
                    done
                    ;;
                5)
                    while true; do
                        vm_read gui_input "Enable GUI mode? (y/n, current: $GUI_MODE): "
                        if [[ "$gui_input" =~ ^[Yy]$ ]]; then
                            GUI_MODE=true
                            break
                        elif [[ "$gui_input" =~ ^[Nn]$ ]]; then
                            GUI_MODE=false
                            break
                        elif [ -z "$gui_input" ]; then
                            break
                        else
                            vm_print_status ERROR "Please answer y or n"
                        fi
                    done
                    ;;
                6)
                    vm_read new_port_forwards "Port forwards (current: ${PORT_FORWARDS:-None}): "
                    PORT_FORWARDS="${new_port_forwards:-$PORT_FORWARDS}"
                    ;;
                7)
                    while true; do
                        vm_read new_memory "New memory in MB (current: $MEMORY): "
                        new_memory="${new_memory:-$MEMORY}"
                        if vm_validate_input "number" "$new_memory"; then
                            MEMORY="$new_memory"
                            break
                        fi
                    done
                    ;;
                8)
                    while true; do
                        vm_read new_cpus "New CPU count (current: $CPUS): "
                        new_cpus="${new_cpus:-$CPUS}"
                        if vm_validate_input "number" "$new_cpus"; then
                            CPUS="$new_cpus"
                            break
                        fi
                    done
                    ;;
                9)
                    while true; do
                        vm_read new_disk_size "New disk size (current: $DISK_SIZE): "
                        new_disk_size="${new_disk_size:-$DISK_SIZE}"
                        if vm_validate_input "size" "$new_disk_size"; then
                            DISK_SIZE="$new_disk_size"
                            break
                        fi
                    done
                    ;;
                0)
                    return 0
                    ;;
                *)
                    vm_print_status ERROR "Invalid selection"
                    continue
                    ;;
            esac
            if [[ "$edit_choice" -eq 1 || "$edit_choice" -eq 2 || "$edit_choice" -eq 3 ]]; then
                vm_setup_image || return 1
            fi
            vm_save_config
            vm_read continue_editing "Continue editing? (y/N): "
            if [[ ! "$continue_editing" =~ ^[Yy]$ ]]; then
                break
            fi
        done
    fi
}

vm_resize_disk() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        if vm_is_running "$vm_name"; then
            vm_print_status ERROR "Stop the VM before resizing"
            return 1
        fi
        vm_print_status INFO "Current disk size: $DISK_SIZE"
        while true; do
            vm_read new_disk_size "New disk size (e.g., 50G): "
            if vm_validate_input "size" "$new_disk_size"; then
                if [[ "$new_disk_size" == "$DISK_SIZE" ]]; then
                    vm_print_status INFO "New size is the same"
                    return 0
                fi
                local current_size_num=${DISK_SIZE%[GgMm]}
                local new_size_num=${new_disk_size%[GgMm]}
                local current_unit=${DISK_SIZE: -1}
                local new_unit=${new_disk_size: -1}
                if [[ "$current_unit" =~ [Gg] ]]; then
                    current_size_num=$((current_size_num * 1024))
                fi
                if [[ "$new_unit" =~ [Gg] ]]; then
                    new_size_num=$((new_size_num * 1024))
                fi
                if [[ $new_size_num -lt $current_size_num ]]; then
                    vm_print_status WARN "Shrinking disk may cause data loss"
                    vm_read confirm_shrink "Continue? (y/N): "
                    if [[ ! "$confirm_shrink" =~ ^[Yy]$ ]]; then
                        vm_print_status INFO "Resize cancelled"
                        return 0
                    fi
                fi
                vm_print_status INFO "Resizing disk to $new_disk_size"
                if qemu-img resize "$IMG_FILE" "$new_disk_size"; then
                    DISK_SIZE="$new_disk_size"
                    vm_save_config
                    vm_print_status SUCCESS "Disk resized to $new_disk_size"
                else
                    vm_print_status ERROR "Failed to resize disk"
                    return 1
                fi
                break
            fi
        done
    fi
}

vm_performance() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        if vm_is_running "$vm_name"; then
            vm_print_status INFO "Performance metrics for VM: $vm_name"
            local qemu_pid
            qemu_pid=$(pgrep -f "qemu-system.*$IMG_FILE")
            if [[ -n "$qemu_pid" ]]; then
                ps -p "$qemu_pid" -o pid,%cpu,%mem,sz,rss,vsz,cmd --no-headers
                free -h
                df -h "$IMG_FILE" 2>/dev/null || du -h "$IMG_FILE"
            else
                vm_print_status ERROR "Could not find QEMU process"
            fi
        else
            vm_print_status INFO "VM is not running"
            echo "Memory: $MEMORY MB"
            echo "CPUs: $CPUS"
            echo "Disk: $DISK_SIZE"
        fi
        vm_pause "Press Enter to continue..."
    fi
}

vm_fix_issues() {
    local vm_name="$1"
    if vm_load_config "$vm_name"; then
        vm_print_status INFO "Fixing issues for VM: $vm_name"
        echo "1) Remove lock files"
        echo "2) Recreate seed image"
        echo "3) Recreate configuration"
        echo "4) Kill stuck processes"
        echo "0) Back"
        vm_read fix_choice "Enter your choice: "
        case $fix_choice in
            1)
                rm -f "${IMG_FILE}.lock" 2>/dev/null
                rm -f "${IMG_FILE}"*.lock 2>/dev/null
                vm_print_status SUCCESS "Lock files removed"
                ;;
            2)
                rm -f "$SEED_FILE" 2>/dev/null
                vm_setup_image && vm_print_status SUCCESS "Seed image recreated"
                ;;
            3)
                vm_save_config
                vm_print_status SUCCESS "Configuration recreated"
                ;;
            4)
                pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null
                sleep 1
                pkill -9 -f "qemu-system.*$IMG_FILE" 2>/dev/null
                vm_print_status SUCCESS "Killed stuck processes"
                ;;
            0) return 0 ;;
            *) vm_print_status ERROR "Invalid selection" ;;
        esac
    fi
}

hyperdock_vm_manager() {
    trap vm_cleanup EXIT
    if ! vm_check_dependencies; then
        vm_pause "Press Enter to return..."
        return
    fi
    VM_DIR="${VM_DIR:-$HOME/vms}"
    declare -gA VM_OS_OPTIONS=(
        ["Ubuntu 22.04"]="ubuntu|jammy|https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img|ubuntu22|ubuntu|ubuntu"
        ["Ubuntu 24.04"]="ubuntu|noble|https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img|ubuntu24|ubuntu|ubuntu"
        ["Debian 11"]="debian|bullseye|https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2|debian11|debian|debian"
        ["Debian 12"]="debian|bookworm|https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2|debian12|debian|debian"
        ["Debian 13"]="debian|trixie|https://cloud.debian.org/images/cloud/trixie/daily/latest/debian-13-generic-amd64-daily.qcow2|debian13|debian|debian"
        ["Fedora 40"]="fedora|40|https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-40-1.14.x86_64.qcow2|fedora40|fedora|fedora"
        ["CentOS Stream 9"]="centos|stream9|https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2|centos9|centos|centos"
        ["AlmaLinux 9"]="almalinux|9|https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2|almalinux9|alma|alma"
        ["Rocky Linux 9"]="rockylinux|9|https://download.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2|rocky9|rocky|rocky"
    )
    while true; do
        vm_display_header
        local vms=($(vm_get_list))
        local vm_count=${#vms[@]}
        if [ $vm_count -gt 0 ]; then
            vm_print_status INFO "Found $vm_count VM(s):"
            for i in "${!vms[@]}"; do
                local status="💤"
                if vm_is_running "${vms[$i]}"; then
                    status="🚀"
                fi
                printf "  %2d) %s %s\n" $((i+1)) "${vms[$i]}" "$status"
            done
            echo
        fi
        echo "1) Create a new VM"
        if [ $vm_count -gt 0 ]; then
            echo "2) Start a VM"
            echo "3) Stop a VM"
            echo "4) Show VM info"
            echo "5) Edit VM configuration"
            echo "6) Delete a VM"
            echo "7) Resize VM disk"
            echo "8) Show VM performance"
            echo "9) Fix VM issues"
        fi
        echo "0) Exit"
        echo
        vm_read choice "Enter your choice: "
        case $choice in
            1) vm_create_new ;;
            2) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to start: "; vm_start "${vms[$((vm_num-1))]}"; fi ;;
            3) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to stop: "; vm_stop "${vms[$((vm_num-1))]}"; fi ;;
            4) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to show info: "; vm_show_info "${vms[$((vm_num-1))]}"; fi ;;
            5) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to edit: "; vm_edit_config "${vms[$((vm_num-1))]}"; fi ;;
            6) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to delete: "; vm_delete "${vms[$((vm_num-1))]}"; fi ;;
            7) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to resize disk: "; vm_resize_disk "${vms[$((vm_num-1))]}"; fi ;;
            8) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to show performance: "; vm_performance "${vms[$((vm_num-1))]}"; fi ;;
            9) if [ $vm_count -gt 0 ]; then vm_read vm_num "VM number to fix issues: "; vm_fix_issues "${vms[$((vm_num-1))]}"; fi ;;
            0) break ;;
            *) vm_print_status ERROR "Invalid option" ;;
        esac
        vm_pause "Press Enter to continue..."
    done
}

 # MAIN MENU LOOP
 while true; do
     print_header
     
     echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
     echo -e "${R}║${Y}                    MAIN OPTIONS                      ${R}║${N}"
     echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
     
      print_option "1" "🚀 GitHub VPS Maker" "$R"
      print_option "2" "🔧 IDX Tool Setup" "$R"
      print_option "3" "⚡ IDX VPS Maker" "$R"
      print_option "4" "🌐 Real VPS (Any + KVM)" "$R"
      print_option "5" "❌ Exit" "$R"
      print_option "6" "🔥 Google IDX Firebase Studio" "$R"
 
     
     print_divider
    echo -ne "${R}▶▶${W} Select Option [${R}1-6${W}] : ${Y}"
     read -p "" op
     echo -ne "${N}"
     
     case $op in
     
     # =========================================================
     # (1) GITHUB VPS MAKER - ENHANCED WITH JISHNU THEME
     # =========================================================
     1)
         clear
         print_jishnu_logo
         print_status "🚀 GITHUB VPS MAKER" "$R"
         print_divider
         echo
         
         RAM=15000
         CPU=4
         DISK_SIZE=100G
         CONTAINER_NAME=hopingboyz
         IMAGE_NAME=hopingboyz/debain12
         VMDATA_DIR="$PWD/vmdata"
         
         echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
         echo -e "${R}║${W}               GITHUB VPS CONFIGURATION               ${R}║${N}"
         echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
         
         echo -e "${Y}📁 Creating VM data directory...${N}"
         mkdir -p "$VMDATA_DIR"
         
         echo -e "\n${R}┌──────────────────────────────────────────────────────┐${N}"
         echo -e "${R}│${W} ${G}RAM${W}        : ${Y}$RAM MB${W}                           ${R}│${N}"
         echo -e "${R}│${W} ${G}CPU${W}        : ${Y}$CPU cores${W}                        ${R}│${N}"
         echo -e "${R}│${W} ${G}DISK SIZE${W}  : ${Y}$DISK_SIZE${W}                        ${R}│${N}"
         echo -e "${R}│${W} ${G}NAME${W}       : ${Y}$CONTAINER_NAME${W}                   ${R}│${N}"
         echo -e "${R}│${W} ${G}IMAGE${W}      : ${Y}$IMAGE_NAME${W}                       ${R}│${N}"
         echo -e "${R}│${W} ${G}TYPE${W}       : ${Y}GitHub Docker VPS${W}                 ${R}│${N}"
         echo -e "${R}└──────────────────────────────────────────────────────┘${N}\n"
         
         echo -e "${R}▶▶${W} Launching GitHub VPS...${N}"
         echo -e "${Y}──────────────────────────────────────────────────────${N}"
         
         docker run -it --rm \
           --name "$CONTAINER_NAME" \
           --device /dev/kvm \
           -v "$VMDATA_DIR":/vmdata \
           -e RAM="$RAM" \
           -e CPU="$CPU" \
           -e DISK_SIZE="$DISK_SIZE" \
           "$IMAGE_NAME"
         
         echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
         echo -e "${R}▶▶${W} GitHub VPS session ended.${N}"
         echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
         read -p ""
         ;;
     
     # =========================================================
     # (2) IDX TOOL SETUP - ENHANCED WITH JISHNU THEME
     # =========================================================
     2)
         clear
         print_jishnu_logo
         print_status "🔧 IDX TOOL SETUP" "$R"
         print_divider
         echo
         
         echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
         echo -e "${R}║${W}              IDX DEVELOPMENT TOOL SETUP               ${R}║${N}"
         echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
         
         echo -e "${Y}🧹 Cleaning up old files...${N}"
         cd
         rm -rf myapp
         rm -rf flutter
         
         cd vps123
         
         if [ ! -d ".idx" ]; then
             echo -e "${G}📁 Creating .idx directory...${N}"
             mkdir .idx
             cd .idx
             
             echo -e "${C}📝 Creating dev.nix configuration...${N}"
             echo -e "${Y}──────────────────────────────────────────────────────${N}"
             
            cat <<'EOF' > dev.nix
 { pkgs, ... }: {
   channel = "stable-24.05";
 
   packages = with pkgs; [
     unzip
     openssh
     git
     qemu_kvm
     sudo
     cdrkit
     cloud-utils
     qemu
   ];
 
   env = {
     EDITOR = "nano";
   };
 
   idx = {
     extensions = [
       "Dart-Code.flutter"
       "Dart-Code.dart-code"
     ];
 
     workspace = {
       onCreate = { };
       onStart = { };
     };
 
     previews = {
       enable = false;
     };
   };
 }
 EOF
             
             echo -e "${Y}──────────────────────────────────────────────────────${N}"
             echo -e "\n${G}✅ IDX TOOL SETUP COMPLETE!${N}"
             echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
             echo -e "${R}│${W} ${G}Status${W}   : ${Y}Ready to use${W}                        ${R}│${N}"
             echo -e "${R}│${W} ${G}Location${W} : ${Y}~/vps123/.idx${W}                       ${R}│${N}"
             echo -e "${R}│${W} ${G}Tool${W}     : ${Y}IDX Development Environment${W}         ${R}│${N}"
             echo -e "${R}│${W} ${G}Version${W}  : ${Y}Stable 24.05${W}                        ${R}│${N}"
             echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
         else
             echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
             echo -e "${R}│${Y} ⚠ IDX Tool already setup — skipping.${W}               ${R}│${N}"
             echo -e "${R}│${W} Location: ${Y}~/vps123/.idx${W}                          ${R}│${N}"
             echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
         fi
         
         echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
         echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
         read -p ""
         ;;
     
     # =========================================================
     # (3) IDX VPS MAKER — ENHANCED WITH JISHNU THEME
     # =========================================================
     3)
         clear
         print_jishnu_logo
         print_status "⚡ IDX VPS MAKER" "$R"
         print_divider
         echo
         
         echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
         echo -e "${R}║${W}              IDX VPS CREATION TOOL                  ${R}║${N}"
         echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
         
        hyperdock_vm_manager
         ;;
 
     # =========================================================
     # (4) REAL VPS (ANY + KVM)
     # =========================================================
     4)
         clear
         print_jishnu_logo
         print_status "🌐 REAL VPS (ANY + KVM)" "$R"
         print_divider
         echo
 
         echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
         echo -e "${R}║${W}            REAL VPS DEPLOYMENT MODULE               ${R}║${N}"
         echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
 
         VMDATA_DIR="$PWD/vmdata"
         ISO_DIR="$VMDATA_DIR/iso"
         mkdir -p "$ISO_DIR"
         print_linux_installer_menu
         download_iso_if_needed "$ISO_DIR" "$ISO_URL"
 
         echo -e "${Y}🔍 Running disk & system preparation (dd.sh)...${N}"
         echo -e "${Y}──────────────────────────────────────────────────────${N}"
        bash <(curl -s "https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/vm/dd.sh") 
 
         echo -e "\n${G}✅ Disk preparation completed.${N}\n"
 
         echo -e "${Y}🚀 Launching Real VPS installer (vm2.sh)...${N}"
         echo -e "${Y}──────────────────────────────────────────────────────${N}"
        bash <(curl -s "https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/n") 
 
         echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
         echo -e "${R}▶▶${W} Real VPS process finished.${N}"
         echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
         read -p ""
         ;;
 
     
     # =========================================================
     # EXIT - ENHANCED WITH JISHNU THEME
     # =========================================================
     5)
         clear
         print_jishnu_logo
         echo -e "${R}══════════════════════════════════════════════════════════${N}"
         echo -e "${W}                  SESSION TERMINATED                   ${N}"
         echo -e "${R}══════════════════════════════════════════════════════════${N}\n"
         
         echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
         echo -e "${R}│${W}          Thank you for using Hyperdock!          ${R}│${N}"
         echo -e "${R}│${Y}               Made with ❤️ by Hyperdock           ${R}│${N}"
         echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
         
         echo -e "\n${Y}👋 Goodbye! Come back soon...${N}\n"
         print_footer
         sleep 2
         exit 0
         ;;
    
    6)
        clear
        print_jishnu_logo
        print_status "🔥 GOOGLE IDX FIREBASE STUDIO" "$R"
        print_divider
        echo
        
        echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "${R}║${W}          GOOGLE IDX FIREBASE STUDIO SETUP           ${R}║${N}"
        echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
        
        cd
        cd vps123
        
        if [ ! -d ".idx" ]; then
            echo -e "${G}📁 Creating .idx directory...${N}"
            mkdir .idx
        fi
        
        cd .idx
        
        echo -e "${C}📝 Creating dev.nix configuration...${N}"
        echo -e "${Y}──────────────────────────────────────────────────────${N}"
        
        cat <<'EOF' > dev.nix
{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = with pkgs; [
    nodejs_20
    nodePackages.firebase-tools
    git
    openssh
    unzip
    jq
  ];

  env = {
    EDITOR = "nano";
  };

  idx = {
    extensions = [
      "Firebase.firebase-vscode"
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      onCreate = { };
      onStart = { };
    };

    previews = {
      enable = false;
    };
  };
}
EOF
        
        echo -e "${Y}──────────────────────────────────────────────────────${N}"
        echo -e "\n${G}✅ GOOGLE IDX FIREBASE STUDIO READY!${N}"
        echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
        echo -e "${R}│${W} ${G}Status${W}   : ${Y}Ready to use${W}                        ${R}│${N}"
        echo -e "${R}│${W} ${G}Location${W} : ${Y}~/vps123/.idx/dev.nix${W}               ${R}│${N}"
        echo -e "${R}│${W} ${G}Tool${W}     : ${Y}Firebase Studio for IDX${W}             ${R}│${N}"
        echo -e "${R}│${W} ${G}Version${W}  : ${Y}Stable 24.05${W}                        ${R}│${N}"
        echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
        
        echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
        echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
        read -p ""
        ;;
     
     *)
         echo -e "\n${R}╔══════════════════════════════════════════════════════════╗${N}"
         echo -e "${R}║${W}                ❌ INVALID OPTION!                     ${R}║${N}"
         echo -e "${R}║${Y}         Please choose between 1-6 only                ${R}║${N}"
         echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}"
         sleep 2
         ;;
     esac
 done
