require 'sinatra' 
require './block' #blockchain class를 넣겠다#

b = Blockchain.new

####mining은 의미없는 수학문제를 푸는 것###

get '/' do

	message = "" #메시지를 계속 찍겠다#


	b.all_chains.each do |a| #allchains의 블럭을 하나하나 뽑아서 돌 것임, a라는 이름으로 돌것#
		message << a["index"].to_s + "<br>" #문자를 더하여서 넣을 것임 + 띄워서 넣는 엔터#
	end	


	message
end


get '/mine' do
	b.mining.to_s #block에서 mining을 불러오기 + 문자열로 변환, "쓰면 문장 그대로 나#
end