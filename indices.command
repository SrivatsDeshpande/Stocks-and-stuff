#!/usr/bin/env python3
print('Hello!')
print('Please wait 10-15 seconds')
import yfinance as yf
import pandas as pd
indices = {
         
          'Dow Jones' : '^DJI', 
          'S&P 500': '^GSPC', 
          'NASDAQ' : '^IXIC', 
          'DAX': '^GDAXI',
          'FTSE 100': '^FTSE',
          'CAC 40': '^FCHI', 
          'KOSPI': '^KS11',
           'Nikkei': '^N225',
           'Hang Seng Index': '^HSI',
           'SSE Composite' : '000001.SS',
           'USD/INR': 'INR=X',
         'Sensex': '^BSESN',
          'NIFTY': '^NSEI',
          'BANKNIFTY': '^NSEBANK',
   
           
           }
index = []

open_prices=[]
close_prices=[]
changes=[]
change_percents = []
for indice in indices.items():
    stock_data = yf.Ticker(indice[1])
    index.append(indice[0])
    stock_data = stock_data.history(period = '1D')
    
    open_price = round(stock_data['Open'][0],2)
    open_prices.append(open_price)
    close_price = round(stock_data['Close'][0],2)
    close_prices.append(close_price)
    change = round(close_price - open_price,2)
    changes.append(change)
    change_percent = str(round((change/open_price)*100,2))+"%"
    if change>0:
        change_percent = "+" + change_percent
    
       
    
        
    
    change_percents.append(change_percent)

final = {
    'Index': index, 
    'Open': open_prices,
    'Close': close_prices,
    'Change': changes,
    'Change Percent': change_percents
}

data = pd.DataFrame(final)



idx = pd.IndexSlice
usa = data.loc[idx[0:2]]
europe = data.loc[idx[3:5]]
asia = data.loc[idx[6:9]]
inr = data.loc[[10]]
india = data.loc[idx[11:13]]


print('Indian Markets: ')
print(india)
print()
print()
print('American Markets: ')
print(usa)
print()
print()
print('European Markets: ')
print(europe)
print()
print()
print('Asian Markes: ')
print(asia)
print()
print()
print('USD/INR: ')
print(inr)
   
input('Type exit to close: ')
