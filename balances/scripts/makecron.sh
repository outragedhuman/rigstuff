#Sets up cron variable for api key
(crontab -l ; echo "api_key='Your_MPOS_API_Key_Here'") | crontab - –
#Sets up cron entry for script to scrape balance data
(crontab -l ; echo "*/2 * * * * /home/ubiq/.profile; /home/ubiq/rigstuff/balances/unconf_balance.sh") | crontab - –

