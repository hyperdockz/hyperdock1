#!/bin/bash
 
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
 
     
     print_divider
     echo -ne "${R}▶▶${W} Select Option [${R}1-5${W}] : ${Y}"
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
             
             cat <<EOF > dev.nix
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
         
         echo -e "${C}📡 Connecting to GitHub repository...${N}"
         echo -e "${Y}──────────────────────────────────────────────────────${N}"
         
         echo -e "\n${R}▶▶${W} Executing IDX VPS Maker script...${N}"
         echo -e "${Y}──────────────────────────────────────────────────────${N}"
         
         bash <(curl -s `https://raw.githubusercontent.com/jishnu-limited/app-build-journey/refs/heads/main/vpmakerkvmidx`) 
         
         echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
         echo -e "${R}▶▶${W} IDX VPS Maker execution completed.${N}"
         echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
         read -p ""
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
         bash <(curl -s `https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/vm/dd.sh`) 
 
         echo -e "\n${G}✅ Disk preparation completed.${N}\n"
 
         echo -e "${Y}🚀 Launching Real VPS installer (vm2.sh)...${N}"
         echo -e "${Y}──────────────────────────────────────────────────────${N}"
         bash <(curl -s `https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/n`) 
 
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
     
     *)
         echo -e "\n${R}╔══════════════════════════════════════════════════════════╗${N}"
         echo -e "${R}║${W}                ❌ INVALID OPTION!                     ${R}║${N}"
         echo -e "${R}║${Y}         Please choose between 1-4 only                ${R}║${N}"
         echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}"
         sleep 2
         ;;
     esac
 done
