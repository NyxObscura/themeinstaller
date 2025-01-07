#!/bin/bash

# Perintah untuk backup pterodactyl
if [[ ! -d "/var/www/pterodactyl" ]]; then
    read -p "Apakah anda telah menginstal Panel pterodactyl? (y/n): " answer
    if [[ "$answer" == "y" ]]; then
        while true; do
            read -p "Dimanakah file pterodactyl berada (contoh: /path/to/file): " pterodactyl_path
            if [[ -d "$pterodactyl_path" ]]; then
                cp -rL "$pterodactyl_path" /var/www/pterodactyl_backup
                echo "Backup berhasil dari $pterodactyl_path ke /var/www/pterodactyl_backup"
                break
            else
                echo "File pterodactyl tidak ada disana! Silakan coba lagi."
            fi
        done
    else
        echo "Backup dibatalkan."
        exit 1  # Keluar dari skrip jika tidak ada pterodactyl
    fi
else
    cp -rL /var/www/pterodactyl /var/www/pterodactyl_backup
    echo "Backup berhasil dari /var/www/pterodactyl ke /var/www/pterodactyl_backup"
fi

# Definisi warna untuk tampilan teks
ORANGE='\033[33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RESET='\033[0m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m' # Reset warna teks ke default

# Menampilkan informasi
clear
echo -e "\033[0m"
echo -e "${RED}𝗢𝗪𝗡𝗘𝗥${RESET}${BLUE}𝗗𝗘𝗩𝗘𝗟𝗢𝗣𝗘𝗥${RESET}"
echo -e "\033[32mWhatsApp  : 6285183343636\033[0m"
echo -e "\033[31mTelegram : DelioGalileio\033[0m"
echo ""
# Tambahkan bagian lain dari skrip Anda di sini jika diperlukan
# Fungsi untuk menampilkan animasi loading
loading_animation() {
    local delay=0
    local spinstr='|/-\'
    local loading_text="LOADING..."
    local i=0
    while [ $i -lt ${#loading_text} ]; do
        local temp=${spinstr#?}
        printf " [%c] %s" "$spinstr" "${loading_text:0:i+1}"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\r"
        i=$((i + 1))
    done
    sleep 0
    printf "\r\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
}

# Fungsi untuk menampilkan teks animasi
animate_text() {
    local text=$1
    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep 0
    done
    echo ""
}

# Menampilkan teks dengan animasi
echo -e "${BLUE}Correct License!${RESET}"
animate_text "OPSI ADA DIBAWAH INI"
# Fungsi untuk menampilkan animasi loading
loading_animation() {
    local delay=0
    local spinstr='|/-\'
    local loading_text="LOADING"
    local i=0
    while [ $i -lt ${#loading_text} ]; do
        local temp=${spinstr#?}
        printf " [%c] %s" "$spinstr" "${loading_text:0:i+1}"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\r"
        i=$((i + 1))
    done
    sleep 0
    printf "\r\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
}

# Animasi loading dan menghapus
loading_animation
echo -ne "\033[K"  # Menghapus teks loading dari baris
sleep 0

echo "9. HAPUS THEME/ADDON"
echo ""
echo "𝗖𝗢𝗠𝗕𝗜𝗡𝗘𝗗 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗘𝗥 ( 𝗙𝗜𝗟𝗘𝗦 )"
echo "1A. INSTALL THEME ELYSIUM,AUTOSUSPEND"
echo "1B. INSTALL THEME STELLAR,AUTOSUSPEND"
echo "1C. INSTALL THEME NIGHT CORE"
echo ""
echo "𝗖𝗢𝗠𝗕𝗜𝗡𝗘𝗗 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗘𝗥 ( 𝗣𝗟𝗨𝗚𝗜𝗡𝗦 - 𝗙𝗜𝗟𝗘𝗦 )"
echo "2A. INSTALL THEME NEBULA ( UJI COBA )"
echo ""
echo "𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗘𝗥"
echo "11. INSTALL PLUGIN NEBULA ( WAJIB KETIKA MAU INSTALL THEME NEBULA )"
echo "12. MATIKAN SEMUA ANIMASI INSTALLER (TIDAK BERLAKU DI WEB ANDA HANYA MEMATIKAN TEXT ANIMATION INSTALLER)"
echo "13. KELUAR DARI INSTALLER"
echo ""
echo "𝗗𝗘𝗟𝗘𝗧𝗘 𝗧𝗛𝗘𝗠𝗘 / 𝗔𝗗𝗗𝗢𝗡 ( 𝗣𝗟𝗨𝗚𝗜𝗡𝗦 )"
echo "14. DELETE THEME NEBULA"
echo "15. DELETE THEME SLATE"
echo "16. DELETE THEME COOKIES"
echo ""
echo "𝗥𝗢𝗟𝗕𝗔𝗖𝗞 𝗙𝗜𝗟𝗘𝗦"
echo "R. ROLBACK FILES PTERODACTYL ( TIDAK MEMENGARUHI DATA - DATA SERVER )"
read -p "PILIH OPSI (1-16): " OPTION
case "$OPTION" in

R)
if [ ! -d "/var/www/pterodactyl" ]; then
  echo "Direktori pterodactyl_backup Tidak ada, silahlan hubungi Dev"
  exit
else
  echo -e "${BLUE}MEMPROSES${RESET}"
fi
cd /var/www/ && rm -r pterodactyl

mv pterodactyl_backup pterodactyl

cd /var/www/pterodactyl && rm -r pterodactyl
cp -rL /var/www/pterodactyl /var/www/pterodactyl_backup
cd /var/www/pterodactyl
sudo systemctl restart nginx
sudo chown -R www-data:www-data /var/www/pterodactyl
sudo chmod -R 755 /var/www/pterodactyl
composer install --no-dev --optimize-autoloader
php artisan cache:clear
php artisan config:cache
php artisan view:clear
sudo systemctl restart nginx
;;
1A)
#!/bin/bash

# Cek apakah direktori /etc/apt/keyrings sudah ada
if [ ! -d "/etc/apt/keyrings" ]; then
  sudo mkdir -p /etc/apt/keyrings
  echo "Direktori /etc/apt/keyrings telah dibuat."
else
  echo "Direktori /etc/apt/keyrings sudah ada."
fi

# Cek apakah file nodesource.gpg sudah ada
if [ ! -f "/etc/apt/keyrings/nodesource.gpg" ]; then
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "File nodesource.gpg telah didownload dan disimpan."
else
  echo "File nodesource.gpg sudah ada, skip download."
fi

# Cek apakah repositori sudah ditambahkan
if ! grep -q "nodesource" /etc/apt/sources.list.d/nodesource.list 2>/dev/null; then
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  echo "Repositori NodeSource telah ditambahkan."
else
  echo "Repositori NodeSource sudah ada, skip penambahan."
fi

# Update dan install nodejs & npm
sudo apt update
sudo apt install -y nodejs npm

echo -e "${BLUE} JIKA INSTALL NPM ERROR TETAP AKAN WORK, LANJUTKAN SAJA"
npm i -g yarn

REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
TEMP_DIR="themeinstaller"

cd /var/www && git clone "$REPO_URL"

cd /var/www && sudo mv "$TEMP_DIR/ElysiumTheme.zip" /var/www/
unzip -o /var/www/ElysiumTheme.zip -d /var/www/
rm /var/www/ElysiumTheme.zip

cd /var/www/pterodactyl
yarn

# Set flag OpenSSL legacy provider untuk build
export NODE_OPTIONS=--openssl-legacy-provider

# Build production dan perbaiki jika error
if ! yarn build:production; then
  echo "Ada kesalahan.. Proses fix.."
  export NODE_OPTIONS=--openssl-legacy-provider
  yarn
  yarn build:production
  npx update-browserslist-db@latest
fi

echo -e "${BLUE} KETIK yes UNTUK MELANJUTKAN${RESET}"
php artisan migrate
php artisan view:clear

cd /var/www && sudo mv "$TEMP_DIR/autosuspens.zip" /var/www/
unzip -o /var/www/autosuspens.zip -d /var/www/
cd /var/www/pterodactyl
bash installer.bash
rm /var/www/autosuspens.zip
cd /var/www && rm -r "$TEMP_DIR"

echo "( 𝗙𝗜𝗟𝗘𝗦 ) THEME ELYSIUM BERHASIL TERINSTAL"
echo "( 𝗙𝗜𝗟𝗘𝗦 ) ADDON AUTO SUSPEND BERHASIL DIINSTALL."
    ;;
    1B)
    #!/bin/bash

# Cek apakah direktori /etc/apt/keyrings sudah ada
if [ ! -d "/etc/apt/keyrings" ]; then
  sudo mkdir -p /etc/apt/keyrings
  echo "Direktori /etc/apt/keyrings telah dibuat."
else
  echo "Direktori /etc/apt/keyrings sudah ada."
fi

# Cek apakah file nodesource.gpg sudah ada
if [ ! -f "/etc/apt/keyrings/nodesource.gpg" ]; then
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "File nodesource.gpg telah didownload dan disimpan."
else
  echo "File nodesource.gpg sudah ada, skip download."
fi

if dpkg -l | grep -q "nodejs"; then
  echo "Node.js sudah terinstal."
else
  echo "Node.js belum terinstal. Menginstal Node.js sekarang..."
  sudo apt install -y nodejs
  if [ $? -eq 0 ]; then
    echo "Node.js berhasil diinstal."
  else
    echo "Terjadi kesalahan saat menginstal Node.js."
  fi
fi


# Cek apakah repositori sudah ditambahkan
if ! grep -q "nodesource" /etc/apt/sources.list.d/nodesource.list 2>/dev/null; then
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  echo "Repositori NodeSource telah ditambahkan."
else
  echo "Repositori NodeSource sudah ada, skip penambahan."
fi
if npm list -g --depth=0 | grep -q "yarn"; then
  echo "Yarn sudah terinstal."
else
  echo "Yarn belum terinstal. Menginstal yarn sekarang..."
  npm install -g yarn
  if [ $? -eq 0 ]; then
    echo "Yarn berhasil diinstal."
  else
    echo "Terjadi kesalahan saat menginstal Yarn."
  fi
fi
sudo apt update
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - 

REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
TEMP_DIR="themeinstaller"

cd /var/www && git clone "$REPO_URL"

cd /var/www && sudo mv "$TEMP_DIR/stellarrimake.zip" /var/www/
unzip -o /var/www/stellarrimake.zip -d /var/www/
rm /var/www/stellarrimake.zip

cd /var/www/pterodactyl
yarn

# Set flag OpenSSL legacy provider untuk build
export NODE_OPTIONS=--openssl-legacy-provider

# Build production dan perbaiki jika error
if ! yarn build:production; then
  echo "Kelihatannya ada kesalahan.. Proses fix.."
  export NODE_OPTIONS=--openssl-legacy-provider
  yarn
  yarn add react-feather 
  npx update-browserslist-db@latest
  yarn build:production
fi

echo -e "${BLUE} KETIK yes UNTUK MELANJUTKAN${RESET}"
php artisan migrate
php artisan view:clear

cd /var/www && sudo mv "$TEMP_DIR/autosuspens.zip" /var/www/
unzip -o /var/www/autosuspens.zip -d /var/www/
cd /var/www/pterodactyl
bash installer.bash
rm /var/www/autosuspens.zip
cd /var/www && rm -r "$TEMP_DIR"

echo "( 𝗙𝗜𝗟𝗘𝗦 ) THEME STELLAR BERHASIL TERINSTAL"
echo "( 𝗙𝗜𝗟𝗘𝗦 ) ADDON AUTO SUSPEND BERHASIL DIINSTALL."
    ;;
1C)
echo -e "${GREEN}Installing ${YELLOW}sudo${GREEN} if not installed${RESET}"
    apt install sudo -y > /dev/null 2>&1
    cd /var/www/ > /dev/null 2>&1
    echo -e "${GREEN}Unpack the themebackup...${RESET}"
    tar -cvf Pterodactyl_Nightcore_Themebackup.tar.gz pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Installing theme... ${RESET}"
    cd /var/www/pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Removing old theme if exist${RESET}"
    rm -r Pterodactyl_Nightcore_Theme > /dev/null 2>&1
    echo -e "${GREEN}Download the Theme${RESET}"
    git clone https://github.com/NoPro200/Pterodactyl_Nightcore_Theme.git > /dev/null 2>&1
    cd Pterodactyl_Nightcore_Theme > /dev/null 2>&1
    echo -e "${GREEN}Removing old theme resources if exist${RESET}"
    rm /var/www/pterodactyl/resources/scripts/Pterodactyl_Nightcore_Theme.css > /dev/null 2>&1
    rm /var/www/pterodactyl/resources/scripts/index.tsx > /dev/null 2>&1
    echo -e "${GREEN}Moving the new theme files to directory${RESET}"
    mv index.tsx /var/www/pterodactyl/resources/scripts/index.tsx > /dev/null 2>&1
    mv Pterodactyl_Nightcore_Theme.css /var/www/pterodactyl/resources/scripts/Pterodactyl_Nightcore_Theme.css > /dev/null 2>&1
    cd /var/www/pterodactyl > /dev/null 2>&1
    
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - > /dev/null 2>&1
    apt update -y > /dev/null 2>&1
    apt install nodejs -y > /dev/null 2>&1
    
    NODE_VERSION=$(node -v)
    REQUIRED_VERSION="v16.20.2"
    if [ "$NODE_VERSION" != "$REQUIRED_VERSION" ]; then
        echo -e "${GREEN}Node.js version is not ${YELLOW}${REQUIRED_VERSION}${GREEN}. Version: ${YELLOW}${NODE_VERSION}${RESET}"
        echo -e "${GREEN}Set version to ${YELLOW}v16.20.2${GREEN}... ${RESET}"
        sudo npm install -g n > /dev/null 2>&1
        sudo n 16 > /dev/null 2>&1
        node -v > /dev/null 2>&1
        npm -v > /dev/null  2>&1
        echo -e "${GREEN}Now the default version is ${YELLOW}${REQUIRED_VERSION}"
    else
        echo -e "${GREEN}Node.js Version is compatible: ${YELLOW}${NODE_VERSION} ${RESET}"
    fi

    apt install npm -y > /dev/null 2>&1
    npm i -g yarn > /dev/null 2>&1
    yarn > /dev/null 2>&1

    cd /var/www/pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Rebuilding the Panel...${RESET}"
    yarn build:production > /dev/null 2>&1
    echo -e "${GREEN}Optimizing the Panel...${RESET}"
    sudo php artisan optimize:clear > /dev/null 2>&1
    ;;
        2A)
    animate_text "( 𝗔𝗨𝗧𝗢𝗠𝗔𝗧𝗜𝗖 ) FITUR INI DALAM TAHAP PEMGEMBANGAN"
    ;;

    1)
        # Masukkan token GitHub langsung di sini
        GITHUB_TOKEN=""

        # Clone repositori menggunakan token
        REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
        TEMP_DIR="themeinstaller"

        # Mengkloning repositori
        git clone "$REPO_URL"

        sudo mv "$TEMP_DIR/ElysiumTheme.zip" /var/www/

        # Mengekstrak file ZIP dengan opsi untuk menggantikan file tanpa konfirmasi
        unzip -o /var/www/ElysiumTheme.zip -d /var/www/
        rm -r themeinstaller
        rm /var/www/ElysiumTheme.zip
        
        # Menjalankan perintah
        sudo mkdir -p /etc/apt/keyrings

        # Menyimpan output dan tidak meminta konfirmasi
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || true

        # Menambahkan repository
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

        # Update dan install nodejs
        sudo apt update
        sudo apt install -y nodejs
        apt install npm
        echo -e "${BLUE} JIKA INSTALL NPM ERROR TETAP AKAN WORK, LANJUTKAN SAJA"
        npm i -g yarn
        cd /var/www/pterodactyl
        yarn
        yarn build:production
echo -e "${BLUE} KETIK yes UNTUK MELANJUTKAN${RESET}"
        php artisan migrate
        php artisan view:clear
        animate_text "Tema Elysium berhasil diinstal."

        ;;
    4)
        # Masukkan token GitHub langsung di sini
        GITHUB_TOKEN=""

        # Clone repositori menggunakan token
        REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
        TEMP_DIR="themeinstaller"

        # Mengkloning repositori
        git clone "$REPO_URL"

        sudo mv "$TEMP_DIR/autosuspens.zip" /var/www/

        # Mengekstrak file ZIP dengan opsi untuk menggantikan file tanpa konfirmasi
        unzip -o /var/www/autosuspens.zip -d /var/www/
        rm -r themeinstaller
        rm /var/www/autosuspens.zip
        
        cd /var/www/pterodactyl
        bash installer.bash

        animate_text "AUTO SUSPEND BERHASIL DIINSTALL"

        ;;

    2)
    
cd /var/www
BLUEPRINT_FILE="/var/www/pterodactyl/blueprint.sh"
if [ ! -f "$BLUEPRINT_FILE" ]; then
    echo "𝗗𝗘𝗣𝗘𝗡𝗗 𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗕𝗘𝗟𝗨𝗠 𝗗𝗜𝗜𝗡𝗦𝗧𝗔𝗟 𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗜𝗡𝗦𝗧𝗔𝗟𝗟 𝗧𝗘𝗥𝗟𝗘𝗕𝗜𝗛 𝗗𝗔𝗛𝗨𝗟𝗨 𝗗𝗘𝗡𝗚𝗔𝗡 𝗠𝗘𝗠𝗜𝗟𝗜𝗛 𝗢𝗣𝗦𝗜 𝗡𝗢 𝟭𝟭"
    exit 1
fi

    # Clone repositori menggunakan token
    REPO_URL="https://@github.com/LeXcZxMoDz9/LeXcZUbot"
    TEMP_DIR="LeXcZUbot"

    # Mengkloning repositori
    cd /var/www/pterodactyl
    git clone $REPO_URL
    unzip -o LeXcZUbot/nebulaptero.zip -d var/www/pterodactyl
    blueprint -install nebula
cd /var/www/pterodactyl && rm -r nebula.blueprint
echo "NEBULA THEME BERHASIL DI INSTALL"
    ;;
     3)
cd /var/www
BLUEPRINT_FILE="/var/www/pterodactyl/blueprint.sh"
if [ ! -f "$BLUEPRINT_FILE" ]; then
    echo "𝗗𝗘𝗣𝗘𝗡𝗗 𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗕𝗘𝗟𝗨𝗠 𝗗𝗜𝗜𝗡𝗦𝗧𝗔𝗟 𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗜𝗡𝗦𝗧𝗔𝗟𝗟 𝗧𝗘𝗥𝗟𝗘𝗕𝗜𝗛 𝗗𝗔𝗛𝗨𝗟𝗨 𝗗𝗘𝗡𝗚𝗔𝗡 𝗠𝗘𝗠𝗜𝗟𝗜𝗛 𝗢𝗣𝗦𝗜 𝗡𝗢 𝟭𝟭"
    exit 1
fi

    # Clone repositori menggunakan token
    REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
    TEMP_DIR="themeinstaller"

    # Mengkloning repositori
    git clone "$REPO_URL"

    cd /var/ww/pterodactyl && bash blueprint.sh
    sudo mv "$TEMP_DIR/Slate-v1.0.zip" /var/www/
    unzip -o /var/www/Slate-v1.0.zip -d /var/www/
    cd /var/www/pterodactyl && blueprint -install slate
  cd /var/www/ && rm -r themeinstaller
  cd /var/www/ && rm -r Slate-v1.0.zip
    ;;
    6)

    #!/bin/bash
    animate_text "( 𝗔𝗨𝗧𝗢𝗠𝗔𝗧𝗜𝗖 ) FITUR INI DALAM TAHAP PEMGEMBANGAN"

;;
     7)
# Default URL gambar
DEFAULT_URL="https://database.obscura.web.id/Cat.jpg"

# Meminta input URL gambar dari pengguna
read -p "Masukkan URL gambar (tekan Enter untuk menggunakan URL default): " USER_URL

# Jika input kosong, gunakan URL default
if [ -z "$USER_URL" ]; then
    URL="$DEFAULT_URL"
else
    URL="$USER_URL"
fi

# Masuk ke direktori yang diinginkan
cd /var/www/pterodactyl/resources/views/templates || exit

# Cek jika file wrapper.blade.php mengandung kode CSS tertentu
if grep -q 'background-image' wrapper.blade.php; then
    echo "APAKAH ANDA SUDAH MENGHAPUS BACKGROUND ANDA SEBELUM MEMASANG?"
    read -p "JIKA BELUM PERNAH / SUDAH Ketik y, JIKA BELUM KETIK n: " CONFIRM

    if [ "$CONFIRM" != "y" ]; then
        echo -e "${RED}SILAHKAN HAPUS TERLEBIH DAHULU${RESET}"
        exit 1
    fi
fi

# Tambahkan kode CSS di bagian atas file wrapper.blade.php
{
  # Menyimpan konten baru yang akan ditambahkan
  echo '<!DOCTYPE html>'
  echo '<html lang="en">'
  echo '<head>'
  echo '    <meta charset="UTF-8">'
  echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">'
  echo '    <title>Obscura</title>'
  echo '    <style>'
  echo "        body {"
  echo "            background-image: url('$URL');"
  echo '            background-size: cover;'
  echo '            background-repeat: no-repeat;'
  echo '            background-attachment: fixed;'
  echo '            margin: 0;'
  echo '            padding: 0;'
  echo '        }'
  echo '    </style>'
  echo '</head>'
  echo '<body>'
  echo '    <!-- Konten lain di sini -->'
  echo '</body>'
  echo '</html>'
  echo ''
  
  # Tambahkan isi file wrapper.blade.php yang ada sebelumnya
  cat wrapper.blade.php
} > /tmp/new_wrapper.blade.php

# Salin file baru ke tempat file lama
mv /tmp/new_wrapper.blade.php wrapper.blade.php

echo -e "${BLUE}BACKGROUND BERHASIL DI GANTI${RESET}"
    ;;
     9)
        echo "HAPUS THEME/ADDON DIPILIH"
        # Contoh perintah untuk menghapus tema/addon
       
       cd /var/www/pterodactyl
 php artisan down
curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv 

chmod -R 755 storage/* bootstrap/cache 
 
composer install --no-dev --optimize-autoloader

php artisan view:clear

php artisan config:clear

php artisan migrate --seed --force
chown -R www-data:www-data /var/www/pterodactyl/*
php artisan up
        echo "Semua tema dan addon telah dihapus."
        ;;
    8)
# Path ke file yang akan diubah
file_path="/var/www/pterodactyl/resources/views/templates/wrapper.blade.php"

# Konten baru untuk file
cat << 'EOF' > "$file_path"
<!DOCTYPE html>
<html>
    <head>
        <title>{{ config('app.name', 'Pterodactyl') }}</title>

        @section('meta')
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
            <meta name="csrf-token" content="{{ csrf_token() }}">
            <meta name="robots" content="noindex">
            <link rel="apple-touch-icon" sizes="180x180" href="/favicons/apple-touch-icon.png">
            <link rel="icon" type="image/png" href="/favicons/favicon-32x32.png" sizes="32x32">
            <link rel="icon" type="image/png" href="/favicons/favicon-16x16.png" sizes="16x16">
            <link rel="manifest" href="/favicons/manifest.json">
            <link rel="mask-icon" href="/favicons/safari-pinned-tab.svg" color="#bc6e3c">
            <link rel="shortcut icon" href="/favicons/favicon.ico">
            <meta name="msapplication-config" content="/favicons/browserconfig.xml">
            <meta name="theme-color" content="#0e4688">
        @show

        @section('user-data')
            @if(!is_null(Auth::user()))
                <script>
                    window.PterodactylUser = {!! json_encode(Auth::user()->toVueObject()) !!};
                </script>
            @endif
            @if(!empty($siteConfiguration))
                <script>
                    window.SiteConfiguration = {!! json_encode($siteConfiguration) !!};
                </script>
            @endif
        @show
        <style>
            @import url('//fonts.googleapis.com/css?family=Rubik:300,400,500&display=swap');
            @import url('//fonts.googleapis.com/css?family=IBM+Plex+Mono|IBM+Plex+Sans:500&display=swap');
        </style>

        @yield('assets')

        @include('layouts.scripts')

        <!-- Google tag (gtag.js) -->
        <script async src="https://www.googletagmanager.com/gtag/js?id={{ config('app.google_analytics', 'Pterodactyl') }}"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', '{{ config('app.google_analytics', 'Pterodactyl') }}');
        </script>
    </head>
    <body class="{{ $css['body'] ?? 'bg-neutral-50' }}">
        @section('content')
            @yield('above-container')
            @yield('container')
            @yield('below-container')
        @show
        @section('scripts')
            {!! $asset->js('main.js') !!}
        @show
    </body>
</html>
EOF

# Memeriksa apakah penggantian berhasil
if [ $? -eq 0 ]; then
    echo "BACKROUND ANDA BERHASIL DI HAPUS"
else
    echo "TERJADI KESALAHAN SAAT MEMPERBARUI FILE!! SILAHKAN HUBUNGI 6285183343636 UNTUK MEMINTA BANTUAN"
fi
 ;;
    5)
        # Clone repositori menggunakan token
        REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
        TEMP_DIR="themeinstaller"

        # Mengkloning repositori
        git clone "$REPO_URL"

        sudo mv "$TEMP_DIR/googleanalitic.zip" /var/www/

        # Mengekstrak file ZIP dengan opsi untuk menggantikan file tanpa konfirmasi
        unzip -o /var/www/googleanalitic.zip -d /var/www/
        rm -r themeinstaller
        rm /var/www/googleanalitic.zip
        
        # Menjalankan perintah
        sudo mkdir -p /etc/apt/keyrings

        # Menyimpan output dan tidak meminta konfirmasi
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || true

        # Menambahkan repository
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

        # Update dan install nodejs
        sudo apt update
        sudo apt install -y nodejs
        apt install npm
        echo -e "${BLUE} JIKA INSTALL NPM ERROR TETAP AKAN WORK, LANJUTKAN SAJA"
        npm i -g yarn
        cd /var/www/pterodactyl
        yarn
        yarn build:production
echo -e "${BLUE} KETIK yes UNTUK MELANJUTKAN${RESET}"
        php artisan migrate
        php artisan view:clear
        echo -e "${BLUE}ADDON GOOGLE ANALITYC BERHASIL DIINSTAL${RESET}"
        ;;
        111)
cd /var/www/
# Mengecek keberadaan file blueprint.sh
BLUEPRINT_FILE="/var/www/pterodactyl/blueprint.sh"
if [ ! -f "$BLUEPRINT_FILE" ]; then
    echo "𝗗𝗘𝗣𝗘𝗡𝗗 𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗕𝗘𝗟𝗨𝗠 𝗗𝗜𝗜𝗡𝗦𝗧𝗔𝗟 𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗜𝗡𝗦𝗧𝗔𝗟𝗟 𝗧𝗘𝗥𝗟𝗘𝗕𝗜𝗛 𝗗𝗔𝗛𝗨𝗟𝗨 𝗗𝗘𝗡𝗚𝗔𝗡 𝗠𝗘𝗠𝗜𝗟𝗜𝗛 𝗢𝗣𝗦𝗜 𝗡𝗢 𝟭𝟭"
    exit 1
fi
# Clone repositori menggunakan token
REPO_URL="https://github.com/9fdxh42-koq/themeinstaller"
TEMP_DIR="themeinstaller"

# Mengkloning repositori
git clone "$REPO_URL"

sudo mv "$TEMP_DIR/cookies.zip" /var/www/pterodactyl
unzip -o /var/www/pterodactyl/cookies.zip -d /var/www/pterodactyl
cd /var/www/pterodactyl && blueprint -install cookies
cd /var/www/ && rm -r themeinstaller
cd /var/www/pterodactyl && rm -r cookies.zip
cd /var/www/pterodactyl && rm -r cookies.blueprint
echo "ADDON COOKIES BERHASIL DI INSTALL"
;;
   11)
     sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install -y nodejs
npm i -g yarn
cd /var/www/pterodactyl
yarn
yarn add cross-env
apt install -y zip unzip git curl wget
wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip
mv release.zip var/www/pterodactyl/release.zip
cd /var/www/pterodactyl
unzip release.zip
WEBUSER="www-data"; USERSHELL="/bin/bash"; PERMISSIONS="www-data:www-data";
sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"$WEBUSER\" #;|g" -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"$USERSHELL\" #;|g" -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"$PERMISSIONS\" #;|g" $FOLDER/blueprint.sh
chmod +x blueprint.sh
bash blueprint.sh
        ;;
    12)
        DISABLE_ANIMATIONS=1
        echo -e "${YELLOW}Semua animasi telah dimatikan.${RESET}"
        ;;
    13)
        echo -e "${BLUE}EXIT DARI INSTALLER DIPILIH${RESET}"
        exit 0
        ;;
     14)
# Navigasi ke direktori extensions
cd /var/www/pterodactyl/public/extensions

# Cek jumlah file di direktori extensions
file_count=$(ls | wc -l)

# Jika jumlah file tepat 2, tampilkan peringatan dan hentikan proses
if [ "$file_count" -eq 2 ]; then
    echo "𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗧𝗘𝗥𝗦𝗜𝗦𝗔 𝟭 𝗕𝗜𝗔𝗥 𝗧𝗜𝗗𝗔𝗞 𝗘𝗥𝗥𝗢𝗥 𝗜𝗡𝗜 𝗗𝗜𝗕𝗔𝗧𝗔𝗟𝗞𝗔𝗡"
    exit 1
else
    # Cek apakah direktori nebula ada
    if [ -d "nebula" ]; then
        # Jika folder nebula ada, navigasi ke folder tersebut dan hapus nebula
        cd nebula
        
        # Jalankan command untuk menghapus nebula
        blueprint -remove nebula
        echo "𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗡𝗘𝗕𝗨𝗟𝗔 𝗧𝗘𝗥𝗛𝗔𝗣𝗨𝗦"
    else
        # Jika folder nebula tidak ada, tampilkan peringatan
        echo "𝗧𝗛𝗘𝗠𝗘 𝗡𝗘𝗕𝗨𝗟𝗔 𝗧𝗜𝗗𝗔𝗞 𝗧𝗘𝗥𝗜𝗡𝗦𝗧𝗔𝗟"
    fi
fi
       ;;
15)
# Navigasi ke direktori extensions
cd /var/www/pterodactyl/public/extensions

# Cek jumlah file di direktori extensions
file_count=$(ls | wc -l)

# Jika jumlah file tepat 2, tampilkan peringatan dan hentikan proses
if [ "$file_count" -eq 2 ]; then
    echo "𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗧𝗘𝗥𝗦𝗜𝗦𝗔 𝟭 𝗕𝗜𝗔𝗥 𝗧𝗜𝗗𝗔𝗞 𝗘𝗥𝗥𝗢𝗥 𝗜𝗡𝗜 𝗗𝗜𝗕𝗔𝗧𝗔𝗟𝗞𝗔𝗡"
    exit 1
else
    # Cek apakah direktori nebula ada
    if [ -d "slate" ]; then
        # Jika folder nebula ada, navigasi ke folder tersebut dan hapus nebula
        cd slate
        
        # Jalankan command untuk menghapus nebula
        blueprint -remove slate
        echo "𝗣𝗟𝗨𝗚𝗜𝗡𝗦  𝗧𝗘𝗥𝗛𝗔𝗣𝗨𝗦"
    else
        # Jika folder nebula tidak ada, tampilkan peringatan
        echo "𝗧𝗛𝗘𝗠𝗘 𝗧𝗜𝗗𝗔𝗞 𝗧𝗘𝗥𝗜𝗡𝗦𝗧𝗔𝗟"
    fi
fi
;;
16)
# Navigasi ke direktori extensions
cd /var/www/pterodactyl/public/extensions

# Cek jumlah file di direktori extensions
file_count=$(ls | wc -l)

# Jika jumlah file tepat 2, tampilkan peringatan dan hentikan proses
if [ "$file_count" -eq 2 ]; then
    echo "𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗧𝗘𝗥𝗦𝗜𝗦𝗔 𝟭 𝗕𝗜𝗔𝗥 𝗧𝗜𝗗𝗔𝗞 𝗘𝗥𝗥𝗢𝗥 𝗜𝗡𝗜 𝗗𝗜𝗕𝗔𝗧𝗔𝗟𝗞𝗔𝗡"
    exit 1
else
    # Cek apakah direktori nebula ada
    if [ -d "cookies" ]; then
        # Jika folder nebula ada
        cd cookies
        
        # Jalankan command untuk menghapus 
        blueprint -remove cookies
        echo "𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗧𝗘𝗥𝗛𝗔𝗣𝗨𝗦"
    else
        # Jika folder tidak ada, tampilkan peringatan
        echo "𝗧𝗛𝗘𝗠𝗘 𝗧𝗜𝗗𝗔𝗞 𝗧𝗘𝗥𝗜𝗡𝗦𝗧𝗔𝗟"
    fi
fi
;;
    *)
        echo -e "${RED}Pilihan tidak valid.${RESET}"
        ;;
esac

animate_text "𝗣𝗥𝗢𝗦𝗘𝗦 𝗦𝗘𝗟𝗘𝗦𝗔𝗜"
