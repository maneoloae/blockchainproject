require 'httparty'
require 'json'

price = HTTParty.get("https://api.fixer.io/latest").body
rate = JSON.parse(price)
usd = rate["rates"]["USD"].to_f
krw = rate["rates"]["KRW"].to_f
puts krw/usd