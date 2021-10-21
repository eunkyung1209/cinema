//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	

	
});


//함수 선언 영역
(function($){

	checkPw = function() {
		var customerCode = $('#customerCode').val();
		var secretNumber = $('#secretNumber').val();
		var inputPw = $('#inputPw').val();
		var test = $('#test').val();
		
		
		if(test != secretNumber){
			alert('비밀번호를 다시 입력하세요');
			$('#test').val('');
			
		}
		
		else{
			location.href = '/customer/selectCustomerBoardDetail?customerCode=' + customerCode;
		}
		
	};     
   
})(jQuery);
