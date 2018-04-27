class Blockchain ###설계도청사진으로 logic만 들고있

	def mining ###0부터 10사이의 아무 숫자나 찍었을 때, 0이면 마이닝 성공####

	begin #begin에서 시작해라#
		nonce = rand(100000000) #1부터 10사이에 랜덤으로 뽑아서 nonce에 대입해라, 이 숫자 범위를 늘려가며 블럭난이도를 조절해보기#

	end while nonce !=0 #0이 아니면 계속 돌린다. !는 붙여서#

	nonce		#함수가 끝나면서 자기를 부르면 녀석한테 돌아가서 대체함. 제일 마지막에 나오는 수(nonce값직전가 대체함#)#

	end #digest로 sha 로직 불러올 수 있음#
end
