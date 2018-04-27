class Blockchain ###설계도청사진으로 logic만 들고있


	def initialize
		@chain = []#chainlist를 관리하기 위하여, 설정함 @가붙어서 지속됨#
	end
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
	history.size 
=begin
#nonce : 함수가 끝나면서 자기를 부르면 녀석한테 돌아가서 대체함. 제일 마지막에 나오는 수(nonce값직전가 대체함)#
#몇 번이나 시도했는지#
=end
	end #digest로 sha 로직 불러올 수 있음#

	block {
		"index" => 1, #화살표로 매칭의 표시임#
		"time" => 20329384
		"nonce" => 3234
	}
=begin
#fundamental하게 hash의 개념은 key value매칭의 연속된 묶음임. 암호화가 아니다.#
#암호된 단어로 1대1매칭되어 있기 때문에, 그렇게 부르는 것이다.one to one매칭의 묶음을 hash라 함#
#python의 똑같은 개념이 dictionary#

=end
end
