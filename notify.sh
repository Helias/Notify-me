# Telegram notify
notify() {
	chatid=your_chat_id
	token=your_token_bot
	default_message="notify!"

	if [ -z "$@" ]
	then
		curl -s --data-urlencode "text=$default_message" "https://api.telegram.org/bot$token/sendMessage?chat_id=$chatid" > /dev/null
	else
		curl -s --data-urlencode "text=$@" "https://api.telegram.org/bot$token/sendMessage?chat_id=$chatid" > /dev/null
	fi
}

alias notify=notify

