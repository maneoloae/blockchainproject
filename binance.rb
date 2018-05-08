require 'httparty'
require 'json'

price = HTTParty.get("https://api.binance.com/api/v1/trades?symbol=BTCUSDT").body
p = JSON.parse(price)
puts p.last
puts p[-1]["price"]