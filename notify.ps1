function Notify {
  param ($chat_id, $bot_token, $message = "notify!")

  Invoke-WebRequest -Uri "https://api.telegram.org/bot$bot_token/sendMessage?chat_id=$chat_id&text=$message"
}

if ($args.Length -lt 2) {
  Write-Error "Needed arguments: <chat_id> <bot_token>"
}
else {
  $chat_id = $args[0]
  $bot_token = $args[1]
  if ($args.Length -eq 2) {
    Notify $chat_id $bot_token
  }
  else {
    $message = $null;
    for ($i = 2; $i -lt $args.Length; $i++) {
      $script:message += $args[$i]
      $script:message += ' '
    }

    Notify $chat_id $bot_token $message
  }
}
