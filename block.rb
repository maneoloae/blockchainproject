
require 'securerandom'#uuid생성#
require 'httparty'
require 'json'

class Blockchain ###설계도청사진으로 logic만 들고있


	def initialize
		@chain = []#chainlist를 관리하기 위하여, 설정함 @가붙어서 지속됨#
		@tx = []
		@wallet = {} #복합정보를 가지고 뭐는 뭐다 이런 식으로 data set이기 때문에, {}를 씀#
		@node = [] #노드 추가, 단순 리스트라서[]를 씀#
	end


	def add_port(port) #포트정보를 더함#
		@node << port
		@node.compact!#nill값 제거. 포트값을 안 더하므로 nill이 생김#
	end

	def all_node
		@node
	end

	def ask_block #확인하는 것을 자동으로 하기 위해서 씀#
		@node.each do |n|
			n_blocks = HTTParty.get("http://localhost:"+n+"/number_of_blocks").body #body는 값으로 뽑아오기 위해서 넣음#
			if @chain.length < n_blocks.to_i
				#내 블럭 정보를 모두 JSON으로 만들고 ; JSON 통신
				#그 정보를 상대에게 던진다
				full_chain = @chain.to_json #블록간 싱크를 맞추기 위해서#
				bb = HTTParty.get("http://localhost:"+n+"/recv_chain?chain="+full_chain).body#내 블락체인 데이터를 JSON으로 뭉친다음에 recv로 보낸다#
				@chain = JSON.parse(full_chain) #노드간 체인을 비교하고 작으면 없앰#
			end#내가 들고있는 노드들의 정보를 빼와서 확인함#
		end
	end

	def add_block(block)
		block.each do |b|#하나씩 분리해서 b에 저장하고 체인에 밀어넣은다음에 끝남#
			@chain << b
		end
		@chain.to_json #블록이 긴녀석이 작은 녀석을 더해서, json으로 return함#
	end

	def wallet_list
		@wallet
	end

	def make_a_wallet
		address = SecureRandom.uuid.gsub("-", "") #myetherwallet도 uuid를 사용함,지갑 만들면 100원은 줄게#
		@wallet[address] = 100#숫자가 있으면 배열, 문자가 있으면 hash로생각함#
		@wallet
	end

	def make_a_tx(s, r, a)#서버단 params의 거래정보가 각각 넘어옴, 보내는사람,받는사람,양이 묶여서 작동을 하#
		

			if @wallet[s].nil?#보내는 사람 지갑주소 체크#
				"없는 지갑입니다."
			elsif @wallet[r].nil?#받는 사람 지갑주소 체크인데, 실제 비트코인과, 이더는 이런 기능 없음. 없어도 전송가능#
				"없는 지갑입니다."
			elsif @wallet[s].to_f < a.to_f
				"돈이 부족합니다."
			else

			@wallet[s] = @wallet[s] - a.to_f
			@wallet[r] = @wallet[r] + a.to_f

		tx = {
			"sender" => s,
			"receipent" => r,
			"amount" => a
		}
		@tx << tx #거래가 일어날 때마다, 매번 거래정보가 저장됨,저장#
		#실제 비즈니스 로직에서는, 트랜잭션 전, 하나하나 떼서 유효한 지 재검토를 함. 잔액보다 큰 돈을 빼려하면 트랜잭션을 지워버림#
		"다음 블럭에 쓰여집니다." + (@chain.length + 1).to_s #숫자를 문자로 바꿔서 더해야 하므로 / .은 변경한다는 뜻#
	end
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
		"transaction" => @tx #블록이 가지고 있는 앞의 주소를 point / 주소는 앞 블록의 hash값임, 박제#
	}
	@tx = [] #기존에 있는 거래정보빼고 다시 tx가 빈 걸로 선언,리셋#
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
