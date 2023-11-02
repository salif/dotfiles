#
# ~/.bash_profile
#

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	read -p 'Hi! ' mcinp
	if [[ $mcinp == "hello" ]]; then
		echo "ok"
	else
		exec startx -- -keeptty
	fi
fi
