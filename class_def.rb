
class Dog #클래스는 소문자, 무조건 네이밍 단어 첫 번째는 알파벳 대문자

	def initialize #자동적으로 한바퀴돌고 시작함
		##@가 붙었다는 뜻은 이 클래스 내에서 아무 곳에서 쓸 수 있는 변수
		@weight = 0.5 ##boolean 쓸 때는 무조건 스몰
	end
	def my_weight
		@weight.to_s ##a문자와 숫자값을 더할 때, 변환을 해줘야 함
	end

	def eat
		@weight = @weight + 0.5
	end

end #weight가 던지고, 출력없이 로직으로만 돌아가게 변형함

##서버뒷단에서 로직을 담당. 컨트롤러역할


