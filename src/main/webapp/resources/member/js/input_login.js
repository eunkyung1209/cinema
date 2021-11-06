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
						[]
						$("#login_check").css("color", "red");
						$("#login_check").css("text-align", "center");
						$("#login_check").css("padding-bottom", "5px");
						$("#login_check").text("아이디 또는 비밀번호가 일치하지 않습니다.");
						$('#loginIdd').val('');
						$('#loginPw').val('');
						

						$(document).on('click', '#loginIdd', function() {
							
							$('.check_font').remove();
						});
						
						
						

						
						
						
					}
					else {
							
						location.href = '/movie/mainPage';
							
					}
							
					}
					
				});
		});
	
});(jQuery);