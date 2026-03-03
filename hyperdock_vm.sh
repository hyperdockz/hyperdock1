#!/bin/bash
set -euo pipefail

# ╔══════════════════════════════════════════════════════════╗
# ║         HYPERDOCK  ◈  VM MANAGER  v3.0                  ║
# ║         Made by Deniz                                    ║
# ╚══════════════════════════════════════════════════════════╝

# ══ Colour Palette ═══════════════════════════════════════════
_R='\033[0m'
_BD='\033[1m'
_DM='\033[2m'
_IT='\033[3m'
_UL='\033[4m'

# Blues — deep → ice
B0='\033[38;5;17m'
B1='\033[38;5;19m'
B2='\033[38;5;20m'
B3='\033[38;5;27m'
B4='\033[38;5;33m'
B5='\033[38;5;39m'
B6='\033[38;5;45m'
B7='\033[38;5;51m'

# Utility
WH='\033[1;97m'
LG='\033[38;5;252m'
DG='\033[38;5;238m'
OK='\033[38;5;83m'
WN='\033[38;5;220m'
ER='\033[38;5;196m'
IN='\033[38;5;75m'

# ══ Geometry ═════════════════════════════════════════════════
W=70   # total width
IW=66  # inner width

# ══ Drawing Primitives ═══════════════════════════════════════
_ln() { printf "${B2}%s${_R}\n" "$1"; }

_top()  { printf "${B2}╔%s╗${_R}\n" "$(printf '═%.0s' $(seq 1 $IW))"; }
_bot()  { printf "${B2}╚%s╝${_R}\n" "$(printf '═%.0s' $(seq 1 $IW))"; }
_mid()  { printf "${B2}╠%s╣${_R}\n" "$(printf '═%.0s' $(seq 1 $IW))"; }
_row()  {
    local txt="$1"
    local len=${#txt}
    local pad=$(( IW - len - 1 ))
    printf "${B2}║${_R} %s%*s${B2}║${_R}\n" "$txt" $pad ""
}
_rowc() {
    # centered row
    local txt="$1"
    local raw_len=${#txt}
    # strip ANSI for length calc
    local vis_len=$(echo -e "$txt" | sed 's/\x1b\[[0-9;]*m//g' | wc -c)
    (( vis_len-- )) # wc adds newline
    local lpad=$(( (IW - vis_len) / 2 ))
    local rpad=$(( IW - vis_len - lpad ))
    printf "${B2}║${_R}%*s%b%*s${B2}║${_R}\n" $lpad "" "$txt" $rpad ""
}
_empty() { printf "${B2}║%*s║${_R}\n" $IW ""; }
_thin()  { printf "  ${B1}%s${_R}\n" "$(printf '─%.0s' $(seq 1 64))"; }

# ══ Status Badges ════════════════════════════════════════════
_info()    { printf "\n  ${B4}◈${_R}  ${LG}%s${_R}\n" "$*"; }
_ok()      { printf "  ${OK}✓${_R}  ${LG}%s${_R}\n" "$*"; }
_warn()    { printf "  ${WN}▲${_R}  ${LG}%s${_R}\n" "$*"; }
_err()     { printf "  ${ER}✗${_R}  ${LG}%s${_R}\n" "$*"; }
_inp()     { printf "  ${B6}›${_R}  ${WH}%s${_R} " "$*"; }
_label()   { printf "  ${B3}%-18s${_R}  ${DG}:${_R}  ${WH}%s${_R}\n" "$1" "$2"; }

# ══ Spinner ══════════════════════════════════════════════════
_spin() {
    local msg="$1"
    local frames='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    while true; do
        printf "\r  ${B5}${frames:$((i % ${#frames})):1}${_R}  ${DG}%s${_R}   " "$msg"
        sleep 0.07
        (( i++ ))
    done
}
_spin_stop() { kill "$1" 2>/dev/null; printf "\r  ${OK}✓${_R}  ${LG}Done${_R}%30s\n" ""; }

# ══ Progress Bar ═════════════════════════════════════════════
_progress() {
    local pct=$1 msg="${2:-}"
    local filled=$(( pct * 50 / 100 ))
    local empty=$(( 50 - filled ))
    local bar=""
    for (( i=0; i<filled; i++ )); do
        local ci=$(( i * 6 / 50 ))
        case $ci in
            0) bar+="${B1}▰${_R}" ;;
            1) bar+="${B2}▰${_R}" ;;
            2) bar+="${B3}▰${_R}" ;;
            3) bar+="${B4}▰${_R}" ;;
            4) bar+="${B5}▰${_R}" ;;
            *) bar+="${B6}▰${_R}" ;;
        esac
    done
    for (( i=0; i<empty; i++ )); do bar+="${DG}▱${_R}"; done
    printf "\r  ${DG}[${_R}%b${DG}]${_R}  ${DG}%3d%%${_R}  ${LG}%s${_R}   " "$bar" "$pct" "$msg"
}

# ══ Boot Splash ══════════════════════════════════════════════
_boot() {
    clear
    echo ""
    echo -e "${B3}  ╔══════════════════════════════════════════════════════════════════╗${_R}"
    echo -e "${B3}  ║${_R}                                                                  ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${B7}${_BD} ██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ██████╗  ██████╗ ██╗  ██╗${_R} ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${B6}${_BD} ██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗██║ ██╔╝${_R} ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${B5}${_BD} ███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝██║  ██║██║   ██║█████╔╝ ${_R} ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${B4}${_BD} ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██║  ██║██║   ██║██╔═██╗ ${_R} ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${B3}${_BD} ██║  ██║   ██║   ██║     ███████╗██║  ██║██████╔╝╚██████╔╝██║  ██╗${_R} ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${B2}${_BD} ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝${_R} ${B3}║${_R}"
    echo -e "${B3}  ║${_R}                                                                  ${B3}║${_R}"
    echo -e "${B3}  ║${_R}  ${DG}V M  M A N A G E R${_R}   ${B6}◈${_R}   ${DG}v3.0${_R}   ${B6}◈${_R}   ${DG}by${_R} ${WH}${_BD}Deniz${_R}                    ${B3}║${_R}"
    echo -e "${B3}  ╚══════════════════════════════════════════════════════════════════╝${_R}"
    echo ""

    echo -e "  ${DG}Booting Hyperdock VM Manager...${_R}"
    echo ""

    local msgs=("Checking system environment" "Loading OS registry" "Verifying dependencies" "Initializing storage" "All systems nominal")
    for i in "${!msgs[@]}"; do
        local pct=$(( (i+1) * 100 / ${#msgs[@]} ))
        _progress $pct "${msgs[$i]}"
        sleep 0.25
    done
    printf "\n"
    echo ""
    sleep 0.3
}

# ══ Banner (compact, used between menus) ═════════════════════
_banner() {
    clear
    echo ""
    echo -e "  ${B4}${_BD}HYPERDOCK${_R}  ${DG}◈  VM Manager  ◈  v3.0  ◈  by${_R} ${WH}Deniz${_R}"
    _thin
    echo ""
}

# ══ Section Title ════════════════════════════════════════════
_section() {
    echo ""
    printf "  ${B4}◈◈${_R}  ${WH}${_BD}%s${_R}\n" "$1"
    _thin
    echo ""
}

# ══ Pause ════════════════════════════════════════════════════
_pause() {
    echo ""
    _thin
    printf "  ${B5}↵${_R}  ${DG}Press ${WH}Enter${DG} to continue${_R} "
    read -r
}

# ══ Validation ═══════════════════════════════════════════════
_validate() {
    local type=$1 val=$2
    case $type in
        number) [[ "$val" =~ ^[0-9]+$ ]] && return 0; _err "Must be a number"; return 1 ;;
        size)   [[ "$val" =~ ^[0-9]+[GgMm]$ ]] && return 0; _err "Use format: 20G or 512M"; return 1 ;;
        port)   [[ "$val" =~ ^[0-9]+$ ]] && (( val >= 23 && val <= 65535 )) && return 0
                _err "Valid port: 23-65535"; return 1 ;;
        name)   [[ "$val" =~ ^[a-zA-Z0-9_-]+$ ]] && return 0
                _err "Only letters, numbers, hyphens, underscores"; return 1 ;;
        user)   [[ "$val" =~ ^[a-z_][a-z0-9_-]*$ ]] && return 0
                _err "Must start with letter/underscore, lowercase only"; return 1 ;;
    esac
}

# ══ Dependency Check ═════════════════════════════════════════
_deps() {
    local deps=("qemu-system-x86_64" "wget" "cloud-localds" "qemu-img" "lsof")
    local missing=()
    for d in "${deps[@]}"; do
        command -v "$d" &>/dev/null || missing+=("$d")
    done
    if (( ${#missing[@]} )); then
        _banner
        _section "MISSING DEPENDENCIES"
        for m in "${missing[@]}"; do _err "$m"; done
        echo ""
        _info "Install with:  sudo apt install qemu-system cloud-image-utils wget lsof"
        echo ""
        exit 1
    fi
}

# ══ Cleanup ══════════════════════════════════════════════════
_cleanup() { rm -f user-data meta-data 2>/dev/null; }
trap _cleanup EXIT

# ══ Image Lock Check ═════════════════════════════════════════
_chklock() {
    local img=$1 vm=$2
    if lsof "$img" 2>/dev/null | grep -q qemu-system; then
        _warn "Image is locked by another QEMU process"
        local pid; pid=$(lsof "$img" 2>/dev/null | grep qemu-system | awk '{print $2}' | head -1)
        if [[ -n "$pid" ]]; then
            _info "PID: $pid"
            if ps -p "$pid" -o cmd= | grep -q "$vm"; then
                _inp "Same VM detected — kill and restart? [y/N]"; read -r k
                [[ "$k" =~ ^[Yy]$ ]] || return 1
                kill "$pid"; sleep 2
                kill -0 "$pid" 2>/dev/null && kill -9 "$pid"
                return 0
            fi
            _err "Different QEMU instance is using this image"; return 1
        fi
        return 1
    fi
    local lf="${img}.lock"
    if [[ -f "$lf" ]]; then
        _warn "Lock file found: $lf"
        if find "$lf" -mmin +5 &>/dev/null; then
            _warn "Lock appears stale (>5 min)"
            _inp "Remove stale lock? [y/N]"; read -r r
            [[ "$r" =~ ^[Yy]$ ]] && rm -f "$lf" && _ok "Removed stale lock" && return 0
        fi
        return 1
    fi
    return 0
}

# ══ VM Registry ══════════════════════════════════════════════
_vm_list()   { find "$VM_DIR" -name "*.conf" -exec basename {} .conf \; 2>/dev/null | sort; }

_vm_load() {
    local cfg="$VM_DIR/$1.conf"
    [[ -f "$cfg" ]] || { _err "Config for '$1' not found"; return 1; }
    unset VM_NAME OS_TYPE CODENAME IMG_URL HOSTNAME USERNAME PASSWORD \
          DISK_SIZE MEMORY CPUS SSH_PORT GUI_MODE PORT_FORWARDS IMG_FILE SEED_FILE CREATED
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

# ══ OS Catalogue ═════════════════════════════════════════════
# Format: "OS_TYPE|CODENAME|URL|DEFAULT_HOSTNAME|DEFAULT_USER|DEFAULT_PASS"
declare -A OS_CATALOGUE=(

    # ── Ubuntu ───────────────────────────────────────────────
    ["Ubuntu 20.04 LTS"]="ubuntu|focal|https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img|ubuntu20|ubuntu|ubuntu"
    ["Ubuntu 22.04 LTS"]="ubuntu|jammy|https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img|ubuntu22|ubuntu|ubuntu"
    ["Ubuntu 24.04 LTS"]="ubuntu|noble|https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img|ubuntu24|ubuntu|ubuntu"

    # ── Debian ───────────────────────────────────────────────
    ["Debian 11 Bullseye"]="debian|bullseye|https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2|debian11|debian|debian"
    ["Debian 12 Bookworm"]="debian|bookworm|https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2|debian12|debian|debian"
    ["Debian 13 Trixie"]="debian|trixie|https://cloud.debian.org/images/cloud/trixie/daily/latest/debian-13-generic-amd64-daily.qcow2|debian13|debian|debian"

    # ── Fedora (fixed URLs) ──────────────────────────────────
    ["Fedora 40"]="fedora|40|https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2|fedora40|fedora|fedora"
    ["Fedora 41"]="fedora|41|https://download.fedoraproject.org/pub/fedora/linux/releases/41/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-41-1.4.qcow2|fedora41|fedora|fedora"

    # ── RHEL-compatible ──────────────────────────────────────
    ["CentOS Stream 9"]="centos|stream9|https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2|centos9|centos|centos"
    ["AlmaLinux 9"]="almalinux|9|https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2|almalinux9|almalinux|almalinux"
    ["Rocky Linux 9"]="rockylinux|9|https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2|rocky9|rocky|rocky"
    ["Oracle Linux 9"]="oracle|9|https://yum.oracle.com/templates/OracleLinux/OL9/u5/x86_64/OL9U5_x86_64-kvm-b247.qcow|oracle9|opc|oracle"

    # ── openSUSE ─────────────────────────────────────────────
    ["openSUSE Leap 15.6"]="opensuse|15.6|https://download.opensuse.org/distribution/leap/15.6/appliances/openSUSE-Leap-15.6-Minimal-VM.x86_64-Cloud.qcow2|leap156|opensuse|opensuse"
    ["openSUSE Tumbleweed"]="opensuse|tumbleweed|https://download.opensuse.org/tumbleweed/appliances/openSUSE-Tumbleweed-Minimal-VM.x86_64-Cloud.qcow2|tumbleweed|opensuse|opensuse"

    # ── Arch & Rolling ───────────────────────────────────────
    ["Arch Linux"]="arch|rolling|https://geo.mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2|archlinux|arch|arch"

    # ── Alpine ───────────────────────────────────────────────
    ["Alpine Linux 3.21"]="alpine|3.21|https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/cloud/generic_alpine-3.21.0-x86_64-bios-cloudinit-r0.qcow2|alpine321|alpine|alpine"

    # ── Kali ─────────────────────────────────────────────────
    ["Kali Linux 2024.4"]="kali|2024.4|https://kali.download/cloud-images/kali-2024.4/kali-linux-2024.4-cloud-genericcloud-amd64.tar.xz|kali|kali|kali"

    # ── Amazon Linux ─────────────────────────────────────────
    ["Amazon Linux 2023"]="amazon|2023|https://cdn.amazonlinux.com/al2023/os-images/2023.6.20250218.2/kvm/al2023-kvm-2023.6.20250218.2-kernel-6.1-x86_64.xfs.gpt.qcow2|amzn2023|ec2-user|ec2-user"

    # ── FreeBSD ──────────────────────────────────────────────
    ["FreeBSD 14.1"]="freebsd|14.1|https://object-storage.public.mtl1.vexxhost.net/swift/v1/1dbafeefbd4f4c80864414a441e72dd2/bsd-cloud-image.org/images/freebsd/14.1/2024-11-06/ufs/freebsd-14.1-ufs-2024-11-06.qcow2|freebsd14|freebsd|freebsd"
)

# Ordered display list (assoc arrays are unordered in bash)
OS_ORDER=(
    "Ubuntu 20.04 LTS"
    "Ubuntu 22.04 LTS"
    "Ubuntu 24.04 LTS"
    "Debian 11 Bullseye"
    "Debian 12 Bookworm"
    "Debian 13 Trixie"
    "Fedora 40"
    "Fedora 41"
    "CentOS Stream 9"
    "AlmaLinux 9"
    "Rocky Linux 9"
    "Oracle Linux 9"
    "openSUSE Leap 15.6"
    "openSUSE Tumbleweed"
    "Arch Linux"
    "Alpine Linux 3.21"
    "Kali Linux 2024.4"
    "Amazon Linux 2023"
    "FreeBSD 14.1"
)

# ══ OS Picker ════════════════════════════════════════════════
_pick_os() {
    _section "SELECT OPERATING SYSTEM"

    local groups=(
        "── Ubuntu ──────────────────────────────────"
        "Ubuntu 20.04 LTS" "Ubuntu 22.04 LTS" "Ubuntu 24.04 LTS"
        "── Debian ──────────────────────────────────"
        "Debian 11 Bullseye" "Debian 12 Bookworm" "Debian 13 Trixie"
        "── Fedora ──────────────────────────────────"
        "Fedora 40" "Fedora 41"
        "── RHEL-compatible ─────────────────────────"
        "CentOS Stream 9" "AlmaLinux 9" "Rocky Linux 9" "Oracle Linux 9"
        "── openSUSE ────────────────────────────────"
        "openSUSE Leap 15.6" "openSUSE Tumbleweed"
        "── Rolling / Specialty ─────────────────────"
        "Arch Linux" "Alpine Linux 3.21" "Kali Linux 2024.4"
        "── Cloud-native ────────────────────────────"
        "Amazon Linux 2023" "FreeBSD 14.1"
    )

    local n=0
    declare -g -a _OS_IDX=()

    for entry in "${groups[@]}"; do
        if [[ "$entry" == ──* ]]; then
            printf "\n  ${B2}${DG}%s${_R}\n" "$entry"
        else
            (( n++ ))
            _OS_IDX[$n]="$entry"
            printf "  ${B4}%2d${_R}  ${WH}%-34s${_R}\n" "$n" "$entry"
        fi
    done

    echo ""
    while true; do
        _inp "Choose OS [1-$n]:"; read -r c
        [[ "$c" =~ ^[0-9]+$ ]] && (( c >= 1 && c <= n )) && break
        _err "Enter a number between 1 and $n"
    done

    local chosen="${_OS_IDX[$c]}"
    IFS='|' read -r OS_TYPE CODENAME IMG_URL DEFAULT_HOSTNAME DEFAULT_USERNAME DEFAULT_PASSWORD \
        <<< "${OS_CATALOGUE[$chosen]}"
    _ok "Selected: ${WH}$chosen${_R}"
}

# ══ Setup VM Image ═══════════════════════════════════════════
_setup_image() {
    _info "Preparing VM image..."
    mkdir -p "$VM_DIR"

    if [[ -f "$IMG_FILE" ]]; then
        _ok "Image already exists — skipping download"
    else
        _info "Downloading from:"
        printf "  ${DG}%s${_R}\n" "$IMG_URL"
        echo ""
        if ! wget --progress=bar:force "$IMG_URL" -O "${IMG_FILE}.tmp" 2>&1; then
            rm -f "${IMG_FILE}.tmp"
            _err "Download failed — check URL or network"
            exit 1
        fi
        mv "${IMG_FILE}.tmp" "$IMG_FILE"
        _ok "Download complete"
    fi

    if ! qemu-img resize "$IMG_FILE" "$DISK_SIZE" 2>/dev/null; then
        _warn "Could not resize existing image — creating overlay"
        qemu-img create -f qcow2 -F qcow2 -b "$IMG_FILE" "${IMG_FILE}.tmp" "$DISK_SIZE" 2>/dev/null \
            || qemu-img create -f qcow2 "${IMG_FILE}.tmp" "$DISK_SIZE"
        mv "${IMG_FILE}.tmp" "$IMG_FILE"
    fi
    _ok "Disk sized to $DISK_SIZE"

    # cloud-init user-data
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
    echo ""
    _thin
    _label "VM Name"  "$VM_NAME"
    _label "OS"       "$OS_TYPE / $CODENAME"
    _label "User"     "$USERNAME"
    _label "Password" "$PASSWORD"
    _label "SSH"      "ssh -p $SSH_PORT $USERNAME@localhost"
    _thin
}

# ══ Create VM ════════════════════════════════════════════════
_create_vm() {
    _banner; _section "CREATE NEW VM"

    _pick_os

    echo ""
    _section "VM CONFIGURATION"

    # Name
    while true; do
        _inp "VM name [default: $DEFAULT_HOSTNAME]:"; read -r VM_NAME
        VM_NAME="${VM_NAME:-$DEFAULT_HOSTNAME}"
        _validate name "$VM_NAME" || continue
        [[ -f "$VM_DIR/$VM_NAME.conf" ]] && { _err "VM '$VM_NAME' already exists"; continue; }
        break
    done

    # Hostname
    while true; do
        _inp "Hostname [default: $VM_NAME]:"; read -r HOSTNAME
        HOSTNAME="${HOSTNAME:-$VM_NAME}"
        _validate name "$HOSTNAME" && break
    done

    # Username
    while true; do
        _inp "Username [default: $DEFAULT_USERNAME]:"; read -r USERNAME
        USERNAME="${USERNAME:-$DEFAULT_USERNAME}"
        _validate user "$USERNAME" && break
    done

    # Password
    while true; do
        _inp "Password [default: $DEFAULT_PASSWORD]:"; read -rs PASSWORD; echo ""
        PASSWORD="${PASSWORD:-$DEFAULT_PASSWORD}"
        [[ -n "$PASSWORD" ]] && break
        _err "Password cannot be empty"
    done

    # Disk
    while true; do
        _inp "Disk size [default: 20G]:"; read -r DISK_SIZE
        DISK_SIZE="${DISK_SIZE:-20G}"
        _validate size "$DISK_SIZE" && break
    done

    # RAM
    while true; do
        _inp "RAM in MB [default: 2048]:"; read -r MEMORY
        MEMORY="${MEMORY:-2048}"
        _validate number "$MEMORY" && break
    done

    # CPUs
    while true; do
        _inp "CPU cores [default: 2]:"; read -r CPUS
        CPUS="${CPUS:-2}"
        _validate number "$CPUS" && break
    done

    # SSH Port
    while true; do
        _inp "SSH port [default: 2222]:"; read -r SSH_PORT
        SSH_PORT="${SSH_PORT:-2222}"
        _validate port "$SSH_PORT" || continue
        ss -tln 2>/dev/null | grep -q ":$SSH_PORT " && { _err "Port $SSH_PORT in use"; continue; }
        break
    done

    # GUI
    while true; do
        _inp "Enable GUI? [y/N]:"; read -r gui
        gui="${gui:-n}"
        if [[ "$gui" =~ ^[Yy]$ ]]; then GUI_MODE=true; break
        elif [[ "$gui" =~ ^[Nn]$ ]]; then GUI_MODE=false; break
        else _err "Answer y or n"; fi
    done

    # Extra port forwards
    _inp "Extra port forwards e.g. 8080:80 (Enter to skip):"; read -r PORT_FORWARDS

    IMG_FILE="$VM_DIR/$VM_NAME.img"
    SEED_FILE="$VM_DIR/$VM_NAME-seed.iso"
    CREATED="$(date)"

    echo ""
    _setup_image
    _vm_save
    _ok "VM '${WH}$VM_NAME${_R}' is ready"
}

# ══ Start VM ═════════════════════════════════════════════════
_start_vm() {
    local vm=$1
    _vm_load "$vm" || return 1

    _chklock "$IMG_FILE" "$vm" || {
        _inp "Force-kill all QEMU processes for this image? [y/N]:"; read -r fk
        if [[ "$fk" =~ ^[Yy]$ ]]; then
            pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null; sleep 2
            pgrep -f "qemu-system.*$IMG_FILE" &>/dev/null && pkill -9 -f "qemu-system.*$IMG_FILE"
            rm -f "${IMG_FILE}.lock" 2>/dev/null
            _ok "Processes cleared"
        else return 1; fi
    }

    if _vm_running "$vm"; then
        _warn "VM '$vm' is already running"
        _inp "Stop and restart? [y/N]:"; read -r r
        [[ "$r" =~ ^[Yy]$ ]] || return 1
        _stop_vm "$vm"; sleep 2
    fi

    [[ -f "$IMG_FILE"  ]] || { _err "Image not found: $IMG_FILE"; return 1; }
    [[ -f "$SEED_FILE" ]] || { _warn "Seed missing — recreating"; _setup_image; }

    echo ""
    _thin
    _label "VM"       "$vm"
    _label "SSH"      "ssh -p $SSH_PORT $USERNAME@localhost"
    _label "Password" "$PASSWORD"
    _label "RAM"      "${MEMORY} MB"
    _label "CPUs"     "$CPUS"
    _label "Disk"     "$DISK_SIZE"
    _thin
    echo ""

    local cmd=(
        qemu-system-x86_64
        -enable-kvm -m "$MEMORY" -smp "$CPUS" -cpu host
        -drive "file=$IMG_FILE,format=qcow2,if=virtio"
        -drive "file=$SEED_FILE,format=raw,if=virtio"
        -boot order=c
        -device virtio-net-pci,netdev=n0
        -netdev "user,id=n0,hostfwd=tcp::$SSH_PORT-:22"
    )

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

    if [[ "$GUI_MODE" == true ]]; then
        cmd+=(-vga virtio -display gtk,gl=on)
        _info "GUI mode enabled"
    else
        cmd+=(-nographic -serial mon:stdio)
        _info "Console mode  ·  Ctrl+A then X to exit QEMU"
    fi

    cmd+=(
        -device virtio-balloon-pci
        -object rng-random,filename=/dev/urandom,id=rng0
        -device virtio-rng-pci,rng=rng0
    )

    _info "Starting QEMU..."
    echo ""
    "${cmd[@]}" || { _err "QEMU exited with error"; rm -f "${IMG_FILE}.lock" 2>/dev/null; return 1; }
    _info "VM $vm shut down"
}

# ══ Stop VM ══════════════════════════════════════════════════
_stop_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    if _vm_running "$vm"; then
        _info "Stopping $vm..."
        pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null; sleep 2
        _vm_running "$vm" && pkill -9 -f "qemu-system.*$IMG_FILE" 2>/dev/null
        rm -f "${IMG_FILE}.lock" 2>/dev/null
        _vm_running "$vm" && { _err "Failed to stop VM"; return 1; }
        _ok "VM $vm stopped"
    else
        _info "VM $vm is not running"
        rm -f "${IMG_FILE}.lock" 2>/dev/null
    fi
}

# ══ VM Info ══════════════════════════════════════════════════
_show_info() {
    local vm=$1
    _vm_load "$vm" || return 1

    _section "VM INFO  ·  $vm"

    local status="${ER}●  Stopped${_R}"
    _vm_running "$vm" && status="${OK}●  Running${_R}"

    _label "Status"    "$(echo -e $status)"
    _label "OS"        "$OS_TYPE / $CODENAME"
    _label "Hostname"  "$HOSTNAME"
    _label "Username"  "$USERNAME"
    _label "Password"  "$PASSWORD"
    _label "SSH Port"  "$SSH_PORT"
    _label "RAM"       "${MEMORY} MB"
    _label "CPUs"      "$CPUS"
    _label "Disk"      "$DISK_SIZE"
    _label "GUI"       "$GUI_MODE"
    _label "Forwards"  "${PORT_FORWARDS:-none}"
    _label "Created"   "$CREATED"
    _label "Image"     "$IMG_FILE"
    _label "Seed"      "$SEED_FILE"
    _thin
}

# ══ Edit VM Config ═══════════════════════════════════════════
_edit_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    _section "EDIT VM  ·  $vm"

    while true; do
        printf "  ${B4} 1${_R}  ${WH}Hostname${_R}      ${DG}current: ${LG}%s${_R}\n" "$HOSTNAME"
        printf "  ${B4} 2${_R}  ${WH}Username${_R}      ${DG}current: ${LG}%s${_R}\n" "$USERNAME"
        printf "  ${B4} 3${_R}  ${WH}Password${_R}      ${DG}current: ${LG}****${_R}\n"
        printf "  ${B4} 4${_R}  ${WH}SSH Port${_R}      ${DG}current: ${LG}%s${_R}\n" "$SSH_PORT"
        printf "  ${B4} 5${_R}  ${WH}GUI Mode${_R}      ${DG}current: ${LG}%s${_R}\n" "$GUI_MODE"
        printf "  ${B4} 6${_R}  ${WH}Port Forwards${_R} ${DG}current: ${LG}%s${_R}\n" "${PORT_FORWARDS:-none}"
        printf "  ${B4} 7${_R}  ${WH}RAM (MB)${_R}      ${DG}current: ${LG}%s${_R}\n" "$MEMORY"
        printf "  ${B4} 8${_R}  ${WH}CPU Cores${_R}     ${DG}current: ${LG}%s${_R}\n" "$CPUS"
        printf "  ${B4} 9${_R}  ${WH}Disk Size${_R}     ${DG}current: ${LG}%s${_R}\n" "$DISK_SIZE"
        printf "  ${B4} 0${_R}  ${DG}← Back${_R}\n"
        echo ""
        _inp "Choose field to edit:"; read -r ec

        case $ec in
            1) while true; do _inp "New hostname [$HOSTNAME]:"; read -r v; v="${v:-$HOSTNAME}"
               _validate name "$v" && HOSTNAME="$v" && break; done ;;
            2) while true; do _inp "New username [$USERNAME]:"; read -r v; v="${v:-$USERNAME}"
               _validate user "$v" && USERNAME="$v" && break; done ;;
            3) while true; do _inp "New password:"; read -rs v; echo ""
               [[ -n "${v:-}" ]] && PASSWORD="$v" && break; _err "Cannot be empty"; done ;;
            4) while true; do _inp "New SSH port [$SSH_PORT]:"; read -r v; v="${v:-$SSH_PORT}"
               _validate port "$v" || continue
               [[ "$v" != "$SSH_PORT" ]] && ss -tln 2>/dev/null | grep -q ":$v " \
                   && { _err "Port in use"; continue; }
               SSH_PORT="$v" && break; done ;;
            5) while true; do _inp "GUI mode? [y/N]:"; read -r v; v="${v:-n}"
               [[ "$v" =~ ^[Yy]$ ]] && GUI_MODE=true && break
               [[ "$v" =~ ^[Nn]$ ]] && GUI_MODE=false && break
               _err "y or n"; done ;;
            6) _inp "Port forwards (leave blank to clear):"; read -r v; PORT_FORWARDS="$v" ;;
            7) while true; do _inp "RAM MB [$MEMORY]:"; read -r v; v="${v:-$MEMORY}"
               _validate number "$v" && MEMORY="$v" && break; done ;;
            8) while true; do _inp "CPU cores [$CPUS]:"; read -r v; v="${v:-$CPUS}"
               _validate number "$v" && CPUS="$v" && break; done ;;
            9) while true; do _inp "Disk size [$DISK_SIZE]:"; read -r v; v="${v:-$DISK_SIZE}"
               _validate size "$v" && DISK_SIZE="$v" && break; done ;;
            0) return 0 ;;
            *) _err "Invalid choice"; sleep 0.5; continue ;;
        esac

        [[ "$ec" =~ ^[123]$ ]] && { _info "Updating cloud-init seed..."; _setup_image; }
        _vm_save
        echo ""
        _inp "Continue editing? [y/N]:"; read -r cont
        [[ "$cont" =~ ^[Yy]$ ]] || break
        echo ""
    done
}

# ══ Resize Disk ══════════════════════════════════════════════
_resize_disk() {
    local vm=$1
    _vm_load "$vm" || return 1
    _vm_running "$vm" && { _err "Stop the VM before resizing"; return 1; }
    _info "Current disk: $DISK_SIZE"

    while true; do
        _inp "New disk size (e.g. 50G):"; read -r ns
        _validate size "$ns" || continue
        [[ "$ns" == "$DISK_SIZE" ]] && { _info "Size unchanged"; return 0; }

        local cur=${DISK_SIZE%[GgMm]} new=${ns%[GgMm]}
        local cu=${DISK_SIZE: -1} nu=${ns: -1}
        [[ "$cu" =~ [Gg] ]] && cur=$(( cur * 1024 ))
        [[ "$nu" =~ [Gg] ]] && new=$(( new * 1024 ))
        if (( new < cur )); then
            _warn "Shrinking may cause data loss!"
            _inp "Confirm? [y/N]:"; read -r c; [[ "$c" =~ ^[Yy]$ ]] || { _info "Cancelled"; return 0; }
        fi

        qemu-img resize "$IMG_FILE" "$ns" && DISK_SIZE="$ns" && _vm_save \
            && _ok "Resized to $ns" || _err "Resize failed"
        break
    done
}

# ══ Performance ══════════════════════════════════════════════
_show_perf() {
    local vm=$1
    _vm_load "$vm" || return 1
    _section "PERFORMANCE  ·  $vm"

    if _vm_running "$vm"; then
        local qpid; qpid=$(pgrep -f "qemu-system.*$IMG_FILE" | head -1)
        if [[ -n "$qpid" ]]; then
            echo -e "  ${B5}Process${_R}"
            _thin
            ps -p "$qpid" -o pid,%cpu,%mem,rss,vsz --no-headers | \
                awk '{printf "  PID: %s  CPU: %s%%  MEM: %s%%  RSS: %s KB\n", $1,$2,$3,$4}'
            echo ""
            echo -e "  ${B5}Memory${_R}"
            _thin
            free -h | awk 'NR>0{print "  "$0}'
            echo ""
            echo -e "  ${B5}Disk${_R}"
            _thin
            du -h "$IMG_FILE" | awk '{print "  Image size: "$1}'
        else
            _err "Could not find QEMU PID"
        fi
    else
        _info "VM is not running — showing config"
        _label "RAM"  "${MEMORY} MB"
        _label "CPUs" "$CPUS"
        _label "Disk" "$DISK_SIZE"
    fi
}

# ══ Fix Issues ═══════════════════════════════════════════════
_fix_vm() {
    local vm=$1
    _vm_load "$vm" || return 1
    _section "FIX ISSUES  ·  $vm"

    printf "  ${B4}1${_R}  ${WH}Remove lock files${_R}\n"
    printf "  ${B4}2${_R}  ${WH}Recreate seed image${_R}\n"
    printf "  ${B4}3${_R}  ${WH}Rewrite config file${_R}\n"
    printf "  ${B4}4${_R}  ${WH}Kill stuck QEMU processes${_R}\n"
    printf "  ${B4}0${_R}  ${DG}← Back${_R}\n"
    echo ""
    _inp "Choice:"; read -r fc

    case $fc in
        1) rm -f "${IMG_FILE}.lock" "${IMG_FILE}"*.lock 2>/dev/null; _ok "Lock files removed" ;;
        2) rm -f "$SEED_FILE"; _setup_image; _ok "Seed recreated" ;;
        3) _vm_save ;;
        4) pkill -f "qemu-system.*$IMG_FILE" 2>/dev/null; sleep 1
           pgrep -f "qemu-system.*$IMG_FILE" &>/dev/null \
               && pkill -9 -f "qemu-system.*$IMG_FILE" && _ok "Force-killed" \
               || _info "No stuck processes found" ;;
        0) return 0 ;;
        *) _err "Invalid" ;;
    esac
}

# ══ Delete VM ════════════════════════════════════════════════
_delete_vm() {
    local vm=$1
    _warn "This will permanently delete '$vm' and ALL its data!"
    _inp "Type the VM name to confirm:"; read -r confirm
    [[ "$confirm" != "$vm" ]] && { _info "Cancelled"; return; }

    _vm_load "$vm" || return 1
    _vm_running "$vm" && _stop_vm "$vm" && sleep 2
    rm -f "$IMG_FILE" "$SEED_FILE" "$VM_DIR/$vm.conf" "${IMG_FILE}.lock" 2>/dev/null
    _ok "VM '$vm' permanently deleted"
}

# ══ VM Selector ══════════════════════════════════════════════
_pick_vm() {
    local action=$1
    mapfile -t vms < <(_vm_list)
    local n=${#vms[@]}
    (( n == 0 )) && { _warn "No VMs found — create one first"; return 1; }

    _section "SELECT VM  ·  $action"
    for i in "${!vms[@]}"; do
        local dot="${ER}●${_R}"
        _vm_running "${vms[$i]}" && dot="${OK}●${_R}"
        printf "  ${B4}%2d${_R}  %b  ${WH}%s${_R}\n" $((i+1)) "$dot" "${vms[$i]}"
    done
    echo ""
    while true; do
        _inp "VM number [1-$n]:"; read -r sel
        [[ "$sel" =~ ^[0-9]+$ ]] && (( sel >= 1 && sel <= n )) && break
        _err "Enter 1-$n"
    done
    _SELECTED_VM="${vms[$((sel-1))]}"
}

# ══ Main Menu ════════════════════════════════════════════════
_main_menu() {
    while true; do
        _banner
        mapfile -t _VMS < <(_vm_list)
        local vc=${#_VMS[@]}

        # VM status strip
        if (( vc > 0 )); then
            printf "  ${DG}VMs found: ${WH}%d${_R}\n" "$vc"
            for v in "${_VMS[@]}"; do
                local dot="${ER}●${_R}"
                _vm_running "$v" && dot="${OK}●${_R}"
                printf "  %b  ${LG}%s${_R}\n" "$dot" "$v"
            done
            echo ""
            _thin
            echo ""
        fi

        printf "  ${B4} 1${_R}  ${WH}Create VM${_R}           ${DG}Provision new virtual machine${_R}\n"
        if (( vc > 0 )); then
            printf "  ${B4} 2${_R}  ${WH}Start VM${_R}            ${DG}Boot a stopped VM${_R}\n"
            printf "  ${B4} 3${_R}  ${WH}Stop VM${_R}             ${DG}Gracefully halt a running VM${_R}\n"
            printf "  ${B4} 4${_R}  ${WH}VM Info${_R}             ${DG}Show detailed VM info${_R}\n"
            printf "  ${B4} 5${_R}  ${WH}Edit VM${_R}             ${DG}Modify VM configuration${_R}\n"
            printf "  ${B4} 6${_R}  ${WH}Delete VM${_R}           ${DG}Permanently remove a VM${_R}\n"
            printf "  ${B4} 7${_R}  ${WH}Resize Disk${_R}         ${DG}Expand or shrink VM disk${_R}\n"
            printf "  ${B4} 8${_R}  ${WH}Performance${_R}         ${DG}Live resource metrics${_R}\n"
            printf "  ${B4} 9${_R}  ${WH}Fix Issues${_R}          ${DG}Repair locks / broken config${_R}\n"
        fi
        echo ""
        printf "  ${B4} 0${_R}  ${ER}Exit${_R}\n"
        echo ""
        _thin
        echo ""
        _inp "Select:"; read -r ch

        case $ch in
            1) _create_vm ;;
            2) (( vc > 0 )) && _pick_vm "Start"  && _start_vm  "$_SELECTED_VM" ;;
            3) (( vc > 0 )) && _pick_vm "Stop"   && _stop_vm   "$_SELECTED_VM" ;;
            4) (( vc > 0 )) && _pick_vm "Info"   && _show_info "$_SELECTED_VM" ;;
            5) (( vc > 0 )) && _pick_vm "Edit"   && _edit_vm   "$_SELECTED_VM" ;;
            6) (( vc > 0 )) && _pick_vm "Delete" && _delete_vm "$_SELECTED_VM" ;;
            7) (( vc > 0 )) && _pick_vm "Resize" && _resize_disk "$_SELECTED_VM" ;;
            8) (( vc > 0 )) && _pick_vm "Perf"   && _show_perf  "$_SELECTED_VM" ;;
            9) (( vc > 0 )) && _pick_vm "Fix"    && _fix_vm     "$_SELECTED_VM" ;;
            0)
                _banner
                _section "SESSION TERMINATED"
                _label "Powered by" "Hyperdock VM Manager v3.0"
                _label "Author"     "Deniz"
                echo ""
                _info "Goodbye."
                echo ""
                exit 0
                ;;
            *) _err "Invalid — use 0-9"; sleep 0.8 ;;
        esac

        _pause
    done
}

# ══ Entry Point ══════════════════════════════════════════════
VM_DIR="${VM_DIR:-$HOME/vms}"
mkdir -p "$VM_DIR"

_boot
_deps
_main_menu
