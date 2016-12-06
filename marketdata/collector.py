import requests
import datetime,time
import simplemysql
import config

epoch_time = int(time.time())
exchange_api_url=("https://poloniex.com/public?command=returnChartData&currencyPair"
                  "=BTC_ZEC&start=1405699200&end=" + str(epoch_time) + "&period=14400")

#Function for making an API call
def make_request(url):
    resp = requests.get(url)
    if resp.status_code != 200:
        raise ApiError('url {}'.format(resp.status_code))
    return resp


resp = make_request(exchange_api_url)

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

for candle_data in resp.json():

    candle_date        = candle_data['date']
    candle_high        = candle_data['high']
    candle_low         = candle_data['low']
    candle_open        = candle_data['open']
    candle_close       = candle_data['close']
    candle_volume      = candle_data['volume']
    candle_volquoted   = candle_data['quoteVolume']
    candle_avgweighted = candle_data['weightedAverage']

    try:

        #Insert values into db
        db.insert("marketdata", {"time": candle_date, "high": candle_high, "low": candle_low, 
                                 "open": candle_open, "close" : candle_close, "volume" : candle_volume,
                                 "quotedvol" : candle_volquoted, "avgweighted" : candle_avgweighted} )
        db.commit()

    except:
        print ("Error inserting values into db")
        raise
