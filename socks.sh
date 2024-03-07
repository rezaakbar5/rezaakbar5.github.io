#!/bin/bash
#===========WARNA TEKS============#
err="\033[31m[ERROR]\033[0m"
putih='\e[0m'
hitam="\033[30m"
merah="\033[31m"
hijau="\033[32m"
kuning="\033[33m"
biru="\033[34m"
ungu="\033[35m"
cyan="\033[36m"
putih="\033[37m"
NC="\e[0m"
sks="[ ${hijau}OK ${putih}]"
ip=$(curl ifconfig.me)
#=====================================
clear
echo -e "$hijau ____             _        ____    ___           _        _ _           ";
echo -e "/ ___|  ___   ___| | _____| ___|  |_ _|_ __  ___| |_ __ _| | | ___ _ __ ";
echo -e "\___ \ / _ \ / __| |/ / __|___ \   | || '_ \/ __| __/ _\` | | |/ _ \ '__|";
echo -e " ___) | (_) | (__|   <\__ \___) |  | || | | \__ \ || (_| | | |  __/ |   ";
echo -e "|____/ \___/ \___|_|\_\___/____/  |___|_| |_|___/\__\__,_|_|_|\___|_|   ";
echo -e "\e[0m"
echo ""
echo ""
echo -e "${kuning}Sc By Alfa${putih}"
echo -e "${kuning}Wa : 087715768324${putih}"
echo -e "${kuning}Tele : @faxsenpai${putih}"
echo ""
echo ""
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/OknumA2Nyell/tunneling/main/ip"
# checking_sc() {
  # useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  # if [[ $date_list < $useexp ]]; then
    # echo -ne
  # else
    # echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    # echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    # echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    # echo -e ""
    # echo -e "            ${merah}PERMISSION DENIED !${NC}"
    # echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    # echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    # echo -e "             \033[0;33mContact Admin :${NC}"
    # echo -e "      ${hijau}WhatsApp${NC} wa.me/6287715768324"
    # echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    # exit 0
  # fi
# }
 # if [[ $date_list > "2024-03-05" ]]; then
   # checking_sc
  # else
  # echo -ne
 # fi
# echo ""
read -p "$(echo -e "${cyan}Buat User Baru Untuk Socks5 : $putih")" usernya
read -p "$(echo -e "${cyan}Buat Password Baru : $NC")" pass
echo ""
read -p "$(echo -e "${biru}Klik Enter Untuk Melanjutkan Instalasi : > $putih")"
sudo apt update
sudo apt install -y dante-server net-tools ufw
sudo rm /etc/danted.conf
echo "logoutput: syslog
user.privileged: root
user.unprivileged: nobody

# The listening network interface or address.
internal: 0.0.0.0 port=1080

# The proxying network interface or address.
external: ens3

# socks-rules determine what is proxied through the external interface.
socksmethod: username

# client-rules determine who can connect to the internal interface.
clientmethod: none

client pass {
    from: $ip/0 to: 0.0.0.0/0
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
}" > danted.conf
sudo mv danted.conf /etc/danted.conf
sudo useradd -r -s /bin/false $usernya
echo -e "${ungu}Masukan password seperti yang di atas tadi$putih"
sudo passwd $usernya
sudo systemctl restart danted
echo -e "$sks Install Socks5 Telah Berhasil"
sleep 2
echo -e "
IP : ${cyan}$ip:1080$NC
User : ${cyan}$usernya$NC
Pass : ${cyan}$pass$NC
"
rm $0