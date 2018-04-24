
class Dog #클래스는 소문자, 무조건 네이밍 단어 첫 번째는 알파벳 대문자

	def eat
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
aa.run ##강아지가 aa란 이름으로 활동할 것 



