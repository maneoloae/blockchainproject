require 'sinatra' 
require './block' #blockchain class를 넣겠다#

b = Blockchain.new

####mining은 의미없는 수학문제를 푸는 것###

get '/' do

	message = "<center>" #메시지를 계속 찍겠다#

	b.all_chains.each do |a| #allchains의 블럭을 하나하나 뽑아서 돌 것임, a라는 이름으로 돌것#
		message << "번호는 : " + a["index"].to_s + "<br>" #문자를 더하여서 넣을 것임 + 띄워서 넣는 엔터#
		message << "Nonce는 : " + a["nonce"].to_s + "<br>"
		message << "시간은 : " + a["time"].to_s + "<br>"
		message << "앞 주소는 : " + a["previous_address"].to_s + "<br>"
		message << "내 주소는 : " + Digest::SHA256.hexdigest(a.to_s) + "&mbsp<br>"#앞 주소를 통짜로 해쉬한다음 내 주소까지 박아줌#
		message << "<hr>"
	end	
	message << "<hr>" #줄그어주는 것#
	message << "</center>"
end


get '/mine' do
	b.mining.to_s #block에서 mining을 불러오기 + 문자열로 변환, "쓰면 문장 그대로 나#
end
##이더스캔이 하는 일이 이것

get '/tx' do
	b.make_a_tx(params["sender"],params["receipent"],params["amount"])##브라우져와 ruby파일통신은 params##
end