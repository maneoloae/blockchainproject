# encoding: UTF-8 ##한글지원을 위한 코드

require 'sinatra' #webserver 구동을 위한 서버 참고 ; http://sinatrarb.com #
require 'sinatra/reloader' ## server on/off 반복 최소화를 하기위하ㅇ
get '/mining' do ##주소가 들어가는 곳	
	"<h1 style='text-align:center'>채굴로 달리자으아아아.</h1>" ##html 및 CSS를 넣어서 꾸미면 됨

end


get '/make_a_transaction' do	
	'로그아웃 하셨습니다.'

end