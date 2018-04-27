require 'sinatra' 
require './block' #blockchain class를 넣겠다#

b = Blockchain.new

####mining은 의미없는 수학문제를 푸는 것###

get '/' do
	b.all_chains.to_s
end


get '/mine' do
	b.mining.to_s #block에서 mining을 불러오기 + 문자열로 변환, "쓰면 문장 그대로 나#
end