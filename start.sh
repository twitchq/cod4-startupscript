#!/bin/bash
# ------------------------------------
# Call Of Duty 4 
# Start/Stop/Restart/Status
# By Twitch
# 2019.01.03
# ------------------------------------

# Requirements: screen / apt-get install screen


# SETUP FOR YOU 
NAME="cod4" # SCREEN NAME
# STARTUP COMMAND
COMMAND='./cod4x18_dedrun +exec server.cfg +set dedicated 2 +set sv_punkbuster 0 +set sv_maxclients 22 +map_rotate +set fs_game "mods/xxx" +set fs_homepath "/home/serwer" +set fs_basepath "/home/serwer"'

case "$1" in
start)
# ---- START
screen -list | grep "${NAME}" && STATUS=1 || STATUS=0
if [ "$STATUS" == 0 ]
then
           screen -dmS ${NAME} ${COMMAND}
	       /bin/echo -e "\e[32mThe server has been started.\e[0m"
else
	   	   /bin/echo -e "\e[1;31mThe server is already running.\e[0m"
fi
;;
stop)
# ---- STOP
screen -list | grep "${NAME}" && STATUS=1 || STATUS=0
if [ "$STATUS" == 0 ]
then
	   /bin/echo -e "\e[1;31mThe server is not running, use the start function\e[0m"
else
       pkill ${NAME}
	   /bin/echo -e "\e[32mOK.... Server stopped\e[0m"
fi
;;
restart)
# ---- RESTART
screen -list | grep "${NAME}" && STATUS=1 || STATUS=0
if [ "$STATUS" == 0 ]
then
	   /bin/echo -e "\e[1;31mThe server is not running, use the start function\e[0m"
else
      pkill ${NAME}
      screen -dmS ${NAME} ${COMMAND}
	   /bin/echo -e "\e[32mOK.... Server restarted\e[0m"
fi
;;
status)
# ---- STATUS
screen -list | grep "${NAME}" && /bin/echo -e "\e[32mActive\e[0m" || /bin/echo -e "\e[1;31mPassive\e[0m"

;;
*)
echo "Usage: {start|stop|restart|status}" >&2
exit 1
;;
esac
