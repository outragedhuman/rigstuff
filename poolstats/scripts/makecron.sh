#Creates cron table if it doesn't exist
crontab -e
#Sets up cron variable for api key
(crontab -l ; echo "api_key='Your_MPOS_API_Key_Here'") | crontab - –
#Sets up cron entry for script to scrape balance data
(crontab -l ; echo "*/2 * * * * python /home/ubiq/rigstuff/poolstats/poolstats.py") | crontab - –

