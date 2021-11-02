$(document).ready(function(){
	
	$(document).on('click', '#loginBtn', function() {
		
		// id = "id" / name = "userId"
		
			var id = $('#loginIdd').val();
			var pw = $('#loginPw').val();
			
			$.ajax({
				url : '/member/loginCheck',
				type : 'post',
				data:{'id':id, 'pw':pw}, //필요한 데이터
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 0) {
						
						$("#login_check").css("color", "red");
						$("#login_check").text("아이디 또는 비밀번호가 일치하지 않습니다.");
							
					}
					else {
							
						location.href = '/movie/mainPage';
							
					}
							
					}
					
				});
		});
	
});(jQuery);