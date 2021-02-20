$chat_id = $null
$bot_token = $null
$message = $null;

if ($args[0] -eq "-c") {
  Write-Host "Reading configuration file"

  $config = $null;

  if ($null -ne $args[1]) {
    Write-Host "From" $args[1]

    $config = Get-Content -Path $args[1] | ConvertFrom-Json
  }
  else {
    Write-Host "From default ./config.json"

    $config = Get-Content -Path "./config.json" | ConvertFrom-Json
  }

  $chat_id = $config | Select-Object -ExpandProperty chat_id
  $bot_token = $config | Select-Object -ExpandProperty bot_token
  $message = $config | Select-Object -ExpandProperty message
}
else {
  Write-Host "Reading passed arguments"

  if ($args.Length -lt 2) {
    Write-Error "Needed arguments: <chat_id> <bot_token>"
  }
  else {
    $chat_id = $args[0]
    $bot_token = $args[1]
    if ($args.Length -gt 2) {
      for ($i = 2; $i -lt $args.Length; $i++) {
        $message += $args[$i]
        $message += ' '
      }
    }
  }
}

function Notify {
  param ($chat_id, $bot_token, $message = "Notify!")

  Invoke-WebRequest -Uri "https://api.telegram.org/bot$bot_token/sendMessage?chat_id=$chat_id&text=$message"
}

if (($null -ne $chat_id) -and ($null -ne $bot_token)) {
  if ($null -eq $message) {
    Notify $chat_id $bot_token
  }
  else {
    Notify $chat_id $bot_token $message
  }
}
