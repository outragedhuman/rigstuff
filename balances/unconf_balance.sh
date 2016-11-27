timestamp="$(date '+%H:%M:%S') "
log_location='/home/ubiq/unconf_balance.log'
suffix=' zec'

echo $api_key

unconf_balance="$(curl -X GET "https://zec.suprnova.cc/index.php?page=api&action=getuserbalance&api_key="$api_key"&id=45019" | jq ".getuserbalance.data.unconfirmed")"
echo $timestamp$unconf_balance$suffix >> $log_location
