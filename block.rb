class Blockchain ###설계도청사진으로 logic만 들고있


	def initialize
		@chain = []#chainlist를 관리하기 위하여, 설정함 @가붙어서 지속됨#
		@tx = []
	end

	def make_a_tx(s, r, a)#서버단 params의 거래정보가 각각 넘어옴#
		tx = {
			"sender" => s,
			"receipent" => r,
			"amount" => a
		}
		@tx << tx #거래가 일어날 때마다, 매번 거래정보가 저장됨#
		"다음 블럭에 쓰여집니다." + (@chain.length + 1).to_s #숫자를 문자로 바꿔서 더해야 하므로 / .은 변경한다는 뜻#
	end

=begin
upbitsite가 위와 같은 형식으로 구성되어 있어서, 업비트의 웹서버가 받은 것을 로직으로 처리한 것을,
결과물로 처리하고 송금함
=end


	def mining ###0부터 10사이의 아무 숫자나 찍었을 때, 0이면 마이닝 성공####

		history = [] #nonce값이 나올 때마다, history에 밀어넣음, 얼마나 개고생했는지 보여주는 것#



	begin #begin에서 시작해라#
		nonce = rand(100000)
		hashed = Digest::SHA256.hexdigest(nonce.to_s)
		history << nonce
=begin 1부터 10사이에 랜덤으로 뽑아서 nonce에 대입해라, 
rand 범위를 늘려가며 블럭난이도를 조절해보기, 구글에 루비 해쉬를 검색하면문장나오
보통은 이런 1만 같은 규칙을 친절하게 주지 않음.
=end
	end while hashed[0..3] != "0000" 
=begin 0이 아니면 계속 돌린다. !는 붙여서
#hash암호를 복호화했을때, 앞에서 3자리까지가 0000일 경우가 답이다#
#채굴기들이 연산하느라, 네트워크가 구성되어서 인프라를 제공하는것#
=end
	
=begin
#nonce : 함수가 끝나면서 자기를 부르면 녀석한테 돌아가서 대체함. 제일 마지막에 나오는 수(nonce값직전가 대체함)#
#몇 번이나 시도했는지#
=end
	#digest로 sha 로직 불러올 수 있음#

	block = {
		"index" => @chain.size + 1, #화살표로 매칭의 표시임,과거에 나온 사이즈에 1을 더해주는 것#
		"time" => Time.now, #지금시간으로 바꿔줌#
		"nonce" => nonce,
		"previous_address" => Digest::SHA256.hexdigest(last_block.to_s),
		"transaction" => @tx #블록이 가지고 있는 앞의 주소를 point / 주소는 앞 블록의 hash값임#
	}
	@tx = [] #기존에 있는 거래정보빼고 다시 빈 걸로 선언#
	@chain << block

	 #chain뒤에 블락이 계속 박히는 것, 연결되는 것#
=begin
#fundamental하게 hash의 개념은 key value매칭의 연속된 묶음임. 암호화가 아니다.#
#암호된 단어로 1대1매칭되어 있기 때문에, 그렇게 부르는 것이다.one to one매칭의 묶음을 hash라 함#
#pyton의 똑같은 개념이 dictionary#
#lastblock을 해슁해서 주소로 쓰는 게 원래 방식. to_s로 한줄로 변환해줌#
=end
	
	end

	def last_block
		@chain[-1] #자동으로 예외처리가 됨#
	end


	def all_chains #블록체인 생태계의 모든 블록을 찍어내기 위한 코드#
		@chain
	end

end



=begin
list에서 역순으로 배열에 접근할 때, -를 쓰면 간단함

=end
