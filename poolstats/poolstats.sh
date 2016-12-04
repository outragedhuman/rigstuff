#Timestamp for logging
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"

api_url='https://zec.suprnova.cc/index.php?page=api&action=getuserbalance&api_key='$api_key'&id=45019'
explorer_url='https://api.zcha.in/v1/mainnet/network'

#Grab balance from Suprnovapool API, extract unconfirmed balance only
unconf_balance="$(curl -X GET $api_url | jq '.getuserbalance.data.unconfirmed')"
#Grab difficulty from block explorer
diff="$(curl -X GET $explorer_url | jq '.difficulty')"

#Insert balance into database (Note: 'login-path' must be configured ahead of time using "mysql_config_editor set --login-path=local --host=localhost --user=username --password")
mysql --login-path=local -e"use zec_mining; INSERT INTO balances (balance, time, difficulty) VALUES
  ( '$unconf_balance', '$timestamp', '$diff' );"
