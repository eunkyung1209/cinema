//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	//ID input태그 클릭 시 빨간 글자 지우기
	$(document).on('click', '#id', function() {
		//빨간 글자 삭제
		$('#aaa').remove();
		//join 버튼 비활성화
		$('#joinBtn').addClass('disabled');
	});
   
});

//함수 선언 영역
(function($){
	
	//비밀번호 일치 확인 후 submit
	goJoin = function(){
		var p1 = $('#pw').val();
		var p2 = $('#c_pw').val();
		
		if(p1 != p2){
			alert('비밀번호가 다릅니다.');
			$('input[type="password"]').val('');
			$('#pw').focus();
			
			return ;
		}
		
		$('#joinForm').submit();
					
	};
	
	//ID 중복 체크
	checkId = function(){
		var id = $('#id').val();
		
		if(id == ''){
			var aaa = $('#checkIdDiv').next().attr('id');
			
			//ID input 태그에 글자 입력하지 않고 중복확인 버튼을 누른 경우
			if(aaa != 'aaa'){
				//선택한 태그 뒤에 html코드를 넣는다.
				$('#checkIdDiv').after('<div id="aaa" style="color: red; font-size: 13px; margin-top: 2px;">아이디를 입력하세요.</div>');
			}
			
			return ;
		}
		
		$.ajax({
			url: '/member/checkId', //요청경로
			type: 'post',
			data:{'id':id}, //필요한 데이터
			success: function(result) {
				//기가입 : true, 미가입 : false
				
				//id 중복인 경우
				if(result){
					$('#checkIdDiv').after('<div id="aaa" style="color: red; font-size: 13px; margin-top: 2px;">중복된 아이디입니다.</div>');
				}
				//id 중복이 아닐 경우
				else{
					$('#checkIdDiv').after('<div id="aaa" style="color: blue; font-size: 13px; margin-top: 2px;">사용 가능한 아이디입니다.</div>');
					//$('#joinBtn').addClass('disabled');
					/*$('#joinBtn').removeClass('disabled');*/
				}
			},
			error: function(){
			//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
		
	};
	
	
	//닉네임 중복 체크
	checkNick = function(){
		var nickName = $('#nickName').val();
		
		if(nickName == ''){
			var bbb = $('#checkNickDiv').next().attr('nickName');
			
			//ID input 태그에 글자 입력하지 않고 중복확인 버튼을 누른 경우
			if(bbb != 'bbb'){
				//선택한 태그 뒤에 html코드를 넣는다.
				$('#checkNickDiv').after('<div nickName="bbb" style="color: red; font-size: 13px; margin-top: 2px;">닉네임을 입력하세요.</div>');
			}
			
			return ;
		}
		
		$.ajax({
			url: '/member/checkNick', //요청경로
			type: 'post',
			data:{'nickName':nickName}, //필요한 데이터
			success: function(result) {
				//기가입 : true, 미가입 : false
				
				//id 중복인 경우
				if(result){
					$('#checkNickDiv').after('<div nickName="bbb" style="color: red; font-size: 13px; margin-top: 2px;">중복된 닉네임입니다.</div>');
				}
				//id 중복이 아닐 경우
				else{
					$('#checkNickDiv').after('<div nickName="bbb" style="color: blue; font-size: 13px; margin-top: 2px;">사용 가능한 닉네임입니다.</div>');
					//$('#joinBtn').addClass('disabled');
					$('#joinBtn').removeClass('disabled');
				}
			},
			error: function(){
			//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
		
	};
   
})(jQuery);