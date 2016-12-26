Mostly a private repo, this won't help you much. I may eventually port this for public use once it matures a bit. 

Dependencies:

1. simplemysql (sudo pip install simplemysql)
  a. may require mysql_config (sudo apt-get install libmysqlclient-dev)
2. Python Requests

INSTALLATION

sensors:

1. Configure sensors (add info on how)

sudo apt-get install lm-sensors
sudo sensors-detect #Answer yes to all questions, including the last on to write the conf file
sudo service kmod start
sudo pwmconfig
sudo apt-get install fancontrol
sudo service start fancontrol

2. Tweak output (need to standardize this still)
...

poolstats:

1. Configure api_key (get it from the MPOS pool you're using) and add it to the config file


marketdata:

1. None, should work out of the box. Public API's only

Grant remote access to your db:

1. grant all on <database_name>.* to <user_name>@'<remote_ip>' identified by '<user_password>';

Final Notes:

1. Set up a MySQL Backup so you don't lose your historical data in the event of a serious failure!

