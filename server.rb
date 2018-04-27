require 'sinatra' 
require './block'

b = Blockchain.new

####mining은 의미없는 수학문제를 푸는 것###

get '/' do
	"블럭 리스트입니다."
	
end


get '/mine' do
	"마이닝 중입니다."
end