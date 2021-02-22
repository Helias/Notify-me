# Notify-me

A shell function that notifies you via a Telegram bot.

It's useful when you need to compile a big project (like Qt 5.6) and want to get a notification when it finishes, but it can also be used to send messages through your bot!

## Usage

First of all, if you haven't got a token (for example because you have never made a Telegram Bot) ask [BotFather](https://telegram.me/botfather), just send **/newbot** and follow the procedure. Finally take the string after **"Use this token to access the HTTP API:"**, it should appear similar to this:

```
318682111:AAFouzmHLujO17LY3VJUfhnp4yn8qLIo9Uw
```

If you don't know your Telegram's **chat_id** talk to [**@GiveChatId_bot**](https://t.me/GiveChatId_bot) and send to him **/chatid**, it will write your chat_id, so put it on the configuration instead of **your_chat_id**

Or you could send a message to your own bot and then use this [link](https://api.telegram.org/bot**TOKEN**/getUpdates). You should see then that your message has been received by your bot and is listed. Traversing the json you should find a **chat** key with an **id** key inside which value is exactly your chat_id

Now the procedure differs based on which OS you're using.

### Linux and macOS

If you're using **Linux** restart the terminal or use:

```bash
source ~/.bashrc
```

If you're using **macOS** replace **~/.bashrc** with **~/.bash_profile** in the command above.

You can try these commands:

```bash
notify
sleep 3; notify "This is a test!"
```

the first command should send to you the default_message ("notify!"), the second will send you "This is a test!" after 3 seconds

### Windows

If you're using **Windows** you actually have three options:

1. You could make a copy of **example_config.json** in the same folder, rename it to **config.json** and insert the correct values in each field.
   Then you could use:
   `.\notify.ps1 -c`
   This will load data from the default configuration file, the one you just created!
2. Or you could use the previous command but pass a **second argument** which will be the path to another config.json file
3. Or you could skip the bureaucracy and pass all configurations with a **single command**:
   `.\notify.ps1 <chat_id> <bot_token>`
   A third argument could be provided to change message text

# Enjoy!

If you want to report something you could either:

- Open an issue
- Ask [me](http://telegram.me/Helias) via Telegram (Linux and macOS)
- Ask [Lorenzo](http://telegram.me/lorenzopappalardo7) via Telegram (Windows)
