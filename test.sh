test_func() {
	pacman -Sy --force --noconfirm blackarch &> /dev/null &
	testerpid="$!"
	pid="$!" pri=1 msg="Please wait while installing...\n*This may take awhile" load
	if [ "$testerpid" == "0" ]; then
		whiptail --title "Arch Linux Installer - Bl4cK ArCh" --msgbox "Install complete!" 15 60
	else
		whiptail --title "Arch Linux Installer - Bl4cK ArCh" --msgbox "Install failed..." 15 60
	fi
}

load() {
	{
		int="1"
		while(true)
		do
			proc=$(ps | grep "$pid")
			if [ "$?" -gt "0" ]; then break; fi
			sleep $pri
			echo $int
			int=$((int+1))
		done
		echo 100
		sleep 1
	} | whiptail --title "Arch Linux Installer - Bl4cK ArCh" --gauge "$msg" 8 78 0
}

test_func
