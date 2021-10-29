//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	

	
});


//함수 선언 영역
(function($){

	checkPw = function() {
		var customerCode = $('#commuCode').val();
		var secretNumber = $('#number').val();
		var inputPw = $('#inputPw').val();
		var test = $('#test').val();
		
		
		if(test != number){
			alert('비밀번호를 다시 입력하세요');
			$('#test').val('');
			
		}
		
		else{
			location.href = '/community/selectCommuDetail?commuCode=' + commuCode;
		}
		
	};     
   
})(jQuery);