timestamp="$(date '+%H:%M:%S') "
log_location='/home/ubiq/unconf_balance.log'
suffix=' zec'


unconf_balance="$(curl -X GET "https://zec.suprnova.cc/index.php?page=api&action=getuserbalance&api_key=f4c19989e08aca88ebfdfd0da957f8d4043ff8eb19b12b43fb79ca4565c3da30&id=45019" | jq ".getuserbalance.data.unconfirmed")"
echo $timestamp$unconf_balance$suffix >> $log_location
