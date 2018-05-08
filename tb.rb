require 'telegram/bot'
require 'JSON'
require 'httparty'

token = '597202520:AAGZtv7XIHYwaFglsjSUAopS_N6YYcy0caE'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, " + message.from.morgan)

    when '/kimchi'


      3.times do
	      url = "https://crix-api-endpoint.upbit.com/v1/crix/candles/minutes/1?code=CRIX.UPBIT.KRW-BTC"
	      output = HTTParty.get(url).body #upbit에서 return된 body를 보기위해서#
	      price = JSON.parse(output)
	      recent_price = price[0]["tradePrice"].to_f #[0]이 들어간다면, 쿠키, 뒤에는 해쉬#
	 	  bot.api.send_message(chat_id: message.chat.id, text: recent_price)

	 	  binance_price = HTTParty.get("https://api.binance.com/api/v1/trades?symbol=BTCUSDT").body
	 	  parsed_price = JSON.parse(binance_price)
		  binance_p = parsed_price.last["price"].to_f

		  fixer_price = HTTParty.get("https://api.fixer.io/latest").body
		  rate = JSON.parse(fixer_price)
		  usd = rate["rates"]["USD"].to_f
		  krw = rate["rates"]["KRW"].to_f
		  total_rate = krw/usd

		  msg = ""
		  msg << "김프는 " + ((recent_price / (binance_p * total_rate) - 1) * 100).round(2).to_s + "%, \n"
		  msg << "가격은 " + (recent_price/10000).round(0).to_s + "만 원"


		  bot.api.send_message(chat_id: message.chat.id, text: msg)
		  sleep(5)
	  end

    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end