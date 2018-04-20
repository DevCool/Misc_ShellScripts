#!/bin/sh

testfunc() {
	TEST=$(whiptail --menu "Preferred Crap" 16 78 5 \
		"Option 1" "Hello world" \
		"Option 2" "Hello world agian" 3>&2 2>&1 1>&3)
	case "$TEST" in
		"Option 1")
			echo "Hello world"
		;;
		"Option 2")
			echo "Hello world again"
		;;
		*)
			exit
		;;
	esac
}

testfunc
