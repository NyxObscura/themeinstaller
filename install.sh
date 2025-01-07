#!/bin/bash

set -e

export GITHUB_SOURCE="v1.1.0"
export SCRIPT_RELEASE="v1.1.0"
export GITHUB_BASE_URL="https://raw.githubusercontent.com/9fdxh42-koq/themeinstaller"
export LEXCZ_MODZ="https://github.com/9fdxh42-koq/themeinstaller"

LOG_PATH="/var/log/pterodactyl-installer.log"

# Cek dependensi curl
if ! command -v curl >/dev/null 2>&1; then
  echo "* curl is required for this script to work."
  echo "* Install it using apt (Debian-based) or yum/dnf (RHEL-based)."
  exit 1
fi

# Fungsi untuk mengunduh lib.sh
update_lib_source() {
  echo "* Downloading lib.sh..."
  if ! curl -sSL "$LEXCZ_MODZ/lib/lib.sh" -o /tmp/lib.sh; then
    echo "Failed to download lib.sh. Please check the URL or your internet connection."
    exit 1
  fi
  source /tmp/lib.sh
}

# Fungsi eksekusi
execute() {
  echo -e "\n\n* pterodactyl-installer $(date) \n\n" >>$LOG_PATH

  [[ "$1" == *"canary"* ]] && export GITHUB_SOURCE="master" && export SCRIPT_RELEASE="canary"
  update_lib_source
  run_ui "${1//_canary/}" |& tee -a $LOG_PATH

  if [[ -n $2 ]]; then
    echo -n "* Installation of $1 completed. Do you want to proceed to $2 installation? (y/N): "
    read -r CONFIRM
    if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
      execute "$2"
    else
      echo "Installation of $2 aborted."
      exit 1
    fi
  fi
}

# Fungsi untuk menampilkan pesan selamat datang
welcome() {
  echo "Welcome to the Pterodactyl Installer!"
  echo "This script will guide you through the installation process."
}

# Fungsi untuk menampilkan output
output() {
  echo "$1"
}

# Pesan selamat datang
welcome ""

done=false
while [ "$done" == false ]; do
  options=(
    "Install the panel"
    "Install Wings"
    "Install both [0] and [1] on the same machine (Wings script runs after panel)"
    "Install panel with canary version of the script (the version that lives in master, may be broken!)"
    "Install Wings with canary version of the script (the version that lives in master, may be broken!)"
    "Install both [3] and [4] on the same machine (Wings script runs after panel)"
    "Uninstall panel or wings with canary version of the script (the version that lives in master, may be broken!)"
  )

  actions=(
    "panel"
    "wings"
    "panel;wings"
    "panel_canary"
    "wings_canary"
    "panel_canary;wings_canary"
    "uninstall_canary"
  )

  output "What would you like to do?"

  for i in "${!options[@]}"; do
    output "[$i] ${options[$i]}"
  done

  echo -n "* Input 0-$((${#actions[@]} - 1)): "
  read -r action

  # Validasi input
  if [[ "$action" =~ ^[0-$((${#actions[@]} - 1))]$ ]]; then
    done=true
    IFS=";" read -r i1 i2 <<<"${actions[$action]}"
    execute "$i1" "$i2"
  else
    echo "Invalid input. Please enter a valid number."
  fi
done

# Hapus lib.sh untuk memastikan versi terbaru digunakan saat skrip berikutnya dijalankan
if [ -f /tmp/lib.sh ]; then
  rm -rf /tmp/lib.sh
fi
