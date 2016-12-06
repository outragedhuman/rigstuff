import datetime
import requests
import config
import simplemysql

#Timestamp for logging
timestamp = '{:%Y-%m-%d %H:%M:%S}'.format(datetime.datetime.now())

explorer_url='https://api.zcha.in/v1/mainnet/network'

pool_api_key= config.pool_api_key
pool_url='https://zec.suprnova.cc/index.php?page=api&action=getuserbalance&api_key=' + pool_api_key + '&id=45019'

#Function for making an API call
def make_request(url):
    resp = requests.get(url)
    if resp.status_code != 200:
        raise ApiError('url {}'.format(resp.status_code))
    return resp

#Query network information from block explorer
resp = make_request(explorer_url)

#Pull out just the difficulty
diff = resp.json()['difficulty']

#Query pool for statistics
resp = make_request(pool_url)

#Pull out just the unconfirmed balance
unconf_balance = resp.json()['getuserbalance']['data']['unconfirmed']

try:
    #Make database connection using parameters from config file
    db = simplemysql.SimpleMysql(
        host=config.host,
        db=config.db,
        user=config.user,
        passwd=config.passwd
    )
except:
    print ("Unable to connect to the database, did you set up your config.py file?")
    raise

try:

    #Insert values into db
    db.insert("balances", {"balance": unconf_balance, "time": timestamp, "difficulty": diff} )
    db.commit()

except:
    print ("Error inserting values into db")

