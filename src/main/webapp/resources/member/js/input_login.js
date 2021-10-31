$(document).ready(function(){
	
	$(document).on('click', '#loginBtn', function() {
		
		// id = "id" / name = "userId"
		
			var id = $('#id').val();
			var pw = $('#pw').val();
			
			$.ajax({
				url : '/member/loginCheck',
				type : 'get',
				data:{'id':id, 'pw':pw}, //필요한 데이터
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
						
						$("#login_check").text("아이디 또는 비밀번호가 일치하지 않습니다.");
						$("#login_check").css("color", "red");
							
					}
					else {
							
						location.href = '/member/login';
							
					}
							
					}
					
				});
		});
	
});(jQuery);