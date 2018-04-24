
class Dog #클래스는 소문자, 무조건 네이밍 단어 첫 번째는 알파벳 대문자

	def initialize #자동적으로 한바퀴돌고 시작함
		@hungry = true ##@가 붙었다는 뜻은 이 클래스 내에서 아무 곳에서 쓸 수 있는 변수
		@weight = 0.5
		@age = 1
	end
	def my_weight
		puts "현재 몸무게 " + @weight.to_s ##a문자와 숫자값을 더할 때, 변환을 해줘야 함
	end

	def eat
		@weight = @weight + 0.5
		puts "먹는다"
	end

	def run
		puts "뛴다" 	
	end

	def walk
		puts "걷는다"
	end
end

aa = Dog.new ##Dog를 대입
bb = Dog.new ##다른 강아지가 태어나 각기 성장함
aa.my_weight##강아지가 .뒤에 붙는 변수로 활동할 것 
aa.eat
aa.my_weight
#전체 시스템 상태 유지를 위해서 도입하는 개념, 일종의 성질

#블록체인으로 치면, 노드가 계속 추가되는 것을 의미



