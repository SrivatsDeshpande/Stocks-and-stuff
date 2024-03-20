#!/usr/bin/env python3
print('Hola')
import yfinance as yf
import pandas as pd
indices = {'Dow Jones' : '^DJI', 
          'S&P 500': '^GSPC', 
          'NASDAQ' : '^IXIC', 
          'FTSE 100': '^FTSE',
          'CAC 40': '^FCHI', 
          'KOSPI': '^KS11'}
index = []

open_prices=[]
close_prices=[]
changes=[]
change_percents = []
for indice in indices.items():
    stock_data = yf.Ticker(indice[1])
    index.append(indice[0])
    stock_data = stock_data.history(period = '1D')
    
    open_price = stock_data['Open'][0]
    open_prices.append(open_price)
    close_price = stock_data['Close'][0]
    close_prices.append(close_price)
    change = open_price - close_price
    changes.append(change)
    change_percent = (change/open_price)*100
    change_percents.append(change_percent)

final = {
    'Index': index, 
    'Open': open_prices,
    'Close': close_prices,
    'Change': changes,
    'Change Percent': change_percents
}

data = pd.DataFrame(final)
print(data)
