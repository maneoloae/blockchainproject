
require 'httparty'
require 'JSON'

url = "https://crix-api-endpoint.upbit.com/v1/crix/candles/minutes/1?code=CRIX.UPBIT.KRW-BTC"
output = HTTParty.get(url).body #upbit에서 return된 body를 보기위해서#
price = JSON.parse(output)
recent_price = price.first["tradePrice"]

puts price