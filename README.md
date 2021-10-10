# 🔔 GoogleBot Nginx Telegram Notifier 

Get notification on Telegram if GoogleBot visit your website.

## 💡 How does it work?

Using `tail` and `grep` to monitor the nginx log file. Once it matches the word "GoogleBot" it'll immediately send notification to your telegram


## 🔧 Script Setup

- Download the [GoogleBot.sh](https://github.com/mcnaveen/GoogleBot-Nginx-Telegram-Notifier/blob/main/GoogleBot.sh) file on your linux server in `root` or `home` (Home Recommended)

- Open the file and add these values (Required) (Get Chat ID from here - <https://t.me/chatidx_bot>)

```sh
apiKey= Your Telegram Bot API Key
chatID= Your Chat ID
message="GoogleBot HIT" #You can customize this message
logFile=/var/log/nginx/access.log #Path to your Nginx access log file. (This one is default) 
```

- Now, Make it executable `chmod +x GoogleBot.sh`
- Next Setup `systemd` for Running this script continuously

```bash


# Navigate to this Directory
cd /etc/systemd/system

# Create New Service File
touch gbotnotify.service

# Create a Service file for systemd service
nano gbotnotify.service

```

- Now paste everything from <https://github.com/mcnaveen/GoogleBot-Nginx-Telegram-Notifier/blob/main/gbotnotify.service> and save it.

- Reload the systemd and enable the gbotnotify service

```bash
systemctl daemon-reload
systemctl enable gbotnotify
systemctl start gbotnotify
```

- You can Check the service status with

```bash
systemctl status gbotnotify
```

## ☑ LICENSE 

MIT

----

### Shoutout

Similar useful bash scripts: 
- Get Isso Comments Notification on your Telegram by @mskian - <https://github.com/mskian/isso-telegram-notifier/>