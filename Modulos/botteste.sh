#!/bin/bash
[[ $(screen -list| grep -c 'bot_teste') == '0' ]] && {
    clear
    echo -e "\E[44;1;37m     ACTIVATION BOT SSH TEST     \E[0m"
    echo ""
    echo -ne "\n\033[1;32mINFORM THE TOKEN\033[1;37m: "
    read token
    clear
    echo "-----------MODELO-----------"
    echo "=×=×=×=×=×=×=×=×=×=×=×=×=×="
    echo "   WELCOME MESSAGE   "
    echo "=×=×=×=×=×=×=×=×=×=×=×=×=×="
    echo "        FINAL MESSAGE         "
    echo ""
    echo -ne "\033[1;32mWELCOME MESSAGE:\033[1;37m "
    read bvindo
    echo -ne "\033[1;32mFINAL MESSAGE:\033[1;37m "
    read mfinal
    clear
    echo -ne "\033[1;32mBUTTON NAME 1 (SSH GENERATOR):\033[1;37m "
    read bt1
    clear
    echo -ne "\033[1;32mBUTTON NAME 2 (CUSTOM):\033[1;37m "
    read bt2
    echo -ne "\033[1;32mBUTTON 2 LINK (Ex: www.google.com): \033[1;37m "
    read link2
    clear
    echo -ne "\033[1;32mBUTTON NAME 3(CUSTOM):\033[1;37m "
    read bt3
    echo -ne "\033[1;32mBUTTON 3 LINK (Ex: www.google.com):\033[1;37m "
    read link3
    clear
    echo -ne "\033[1;32mTEST DURATION (IN HOURS):\033[1;37m "
    read dtempo
    clear
    echo ""
    echo -e "\033[1;32mSTARTING BOT TEST \033[0m\n"
    cd $HOME/BOT
    rm -rf $HOME/BOT/botssh
    wget https://raw.githubusercontent.com/xyclopscloud/sshextra/main/Install/botssh >/dev/null 2>&1
    chmod 777 botssh
    echo ""
    sleep 1
    sed -i "s/!#bvindo#!/$bvindo/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#mfinal#!/$mfinal/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#bt1#!/$bt1/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#bt2#!/$bt2/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#link2#!/$link2/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#bt3#!/$bt3/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#link3#!/$link3/g" $HOME/BOT/botssh >/dev/null 2>&1
    sed -i "s/!#dtempo#!/$dtempo/g" $HOME/BOT/botssh >/dev/null 2>&1
    sleep 1
    screen -dmS bot_teste ./botssh $token > /dev/null 2>&1
    clear
    echo "BOT ACTIVATED"
    menu
} || {
    screen -r -S "bot_teste" -X quit
    clear
    echo "BOT DISABLED"
    menu
