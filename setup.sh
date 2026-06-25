#!/bin/bash

# টার্মাক্স আপডেট ও প্রয়োজনীয় প্যাকেজ ইনস্টল
pkg update && pkg upgrade -y
pkg install figlet toilet -y

# কিবোর্ড বাটন মডিফাই করা
mkdir -p ~/.termux
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > ~/.termux/termux.properties

# ইউজারের কাছ থেকে নাম ইনপুট নেওয়া
clear
echo -e "\e[1;33m─────────────────────────────────────────────────────\e[0m"
echo -e "\e[1;32m      ⚡ PARVEJ BHAI'S BANNER SETUP TOOL ⚡          \e[0m"
echo -e "\e[1;33m─────────────────────────────────────────────────────\e[0m"
echo ""
read -p "Enter Your Name For Banner: " username

# যদি ইউজার নাম না দিয়ে এন্টার চাপে, তবে ডিফল্ট নাম সেট হবে
if [ -z "$username" ]; then
    username="PARVEJ BHAI"
fi

# .bashrc ফাইলে কাস্টম ব্যানারটি রাইট করা
cat << EOF > ~/.bashrc
clear
echo -e "\e[1;36m┌─────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[1;32m\$(figlet -f small "  $username")\e[0m"
echo -e "\e[1;36m└─────────────────────────────────────────────────────┘\e[0m"
echo -e "\e[1;95m            ❖  WELCOME TO TERMUX TERMINAL  ❖        \e[0m"
echo ""
EOF

echo ""
echo -e "\e[1;32m[✔] Setup Completed Successfully!\e[0m"
echo -e "\e[1;31m[-] Termux will close now. Restart Termux to see changes.\e[0m"
sleep 3
logout
