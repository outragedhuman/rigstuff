#Set up some variables for logging
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
#Legacy log file write location (will be deprecated and replaced with DB logging eventually)
log_location='/home/ubiq/unconf_balance.log'
#Currency suffix
suffix=' zec'

#Grab balance from Suprnovapool API
unconf_balance="$(curl -X GET "https://zec.suprnova.cc/index.php?page=api&action=getuserbalance&api_key="$api_key"&id=45019" | jq ".getuserbalance.data.unconfirmed")"
echo "$timestamp $unconf_balance$suffix" >> $log_location

#Insert balance into database (Note: 'login-path' must be configured ahead of time using "mysql_config_editor set --login-path=local --host=localhost --user=username --password")
mysql --login-path=local -e"use zec_mining; INSERT INTO balances (balance, time) VALUES
  ( '$unconf_balance', '$timestamp' );"
