require 'sinatra'
require './class_def' ##class_def에서 짠 코드


aa = Dog.new 



get '/' do ##같은 디렉토리에 있어야함
	"Dog " + aa.my_weight
end

get '/eat' do
	aa.eat ##localhost로 호출할 때마다 살찜 이 친구가 불러오는 거
	"먹는다"
end

##데이터 쏴줌

#MVC 구성으로 되어있음. 사용자가 보는 것이 view : logic이 안 들어감
#view가 컨트롤러랑 계속 통신함. 이 페이지는 view