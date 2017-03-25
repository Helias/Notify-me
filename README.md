# Notify-me

I made a shell function to notify me via a Telegram bot.

It was useful when I needed to compile a big project (like Qt 5.6) and I needed to know when it finish.

# Usage

You can create an alias on your file **~/.bashrc** (if this file doesn't exist create it with $ touch ~/.bashrc) just adding and configuring this code:

```bash
# Telegram notify
notify() {
	chatid=your_chat_id #chat_id
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
```

If you don't know your **chat_id** of Telegram talk to **@GiveChatId_bot** and send to him **/chatid**, it will write your chat_id, so put it on the configuration instead of **your_chat_id**

If you haven't a token (so you never made a Bot of Telegram) ask **@BotFather**, send him /newbot, send him a name of the bot (like NotifyMe) and an username, be sure that this username is not already taken from another user. Finally take the strings after **"Use this token to access the HTTP API:"**, it should be like this:

```
318682111:AAFouzmHLujO17LY3VJUfhnp4yn8qLIo9Uw
```

Now, restart the terminal or use:

```bash
$ source ~/.bashrc
```

and try to type these commands:

```bash
$ notify
$ sleep 3; notify "This is a test!"
```

the first command should send to you the default_message ("notify!"), the second will send you "This is a test!" after 3 seconds

Enjoy it!

If you want to report something open an issue or ask me via Telegram at **[@Helias](http://telegram.me/Helias)**
