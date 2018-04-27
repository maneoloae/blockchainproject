require 'sinatra' 
require './block'

b = Blockchain.new

####mining은 의미없는 수학문제를 푸는 것###

get '/' do
	"블럭 리스트입니다."
	
end


get '/mine' do
	b.mining.to_s#block에서 mining을 불러오기 + 문자열로 변환, "쓰면 문장 그대로 나#
	
end