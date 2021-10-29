//화면 로딩 후 바로 실행
$(document).ready(function(){
	

	
});


//함수 선언 영역
(function($){
	
	//게시글 삭제
	deleteCommu = function(){
		var commuCode = $('#commuCode').val();
		
		var result = confirm('정말 삭제하시겠습니까?');
		
		if(result){
			location.href='/community/deleteCommu?commuCode=' + commuCode;
		}
		
	};
	
		
	/*//댓글 수정
	updateCustomerReply = function(customeReplyCode) {
		
		//반복문
		$('.replyContent').each(function(index, element){
			var allReplyCode = $(element).attr('data-replyCode');
			
			if(customeReplyCode == allReplyCode){
				$(this).html('<div><input type="text" name="content" style="width: 92%"> <input type="submit" value="수정" ></div>');
				
			}
		});
	};
	
	updateReply = function() {
		alert('수정 완료');
	};
	
	
	
	//댓글 삭제
	deleteCustomerReply = function(customeReplyCode) {
		
			var result = confirm('댓글을 삭제하시겠습니까?');
			var customerCode = $('#customerCode').val();
			
		if(result){
			location.href='/customer/deleteCustomerReply?customeReplyCode='+customeReplyCode +'&customerCode=' + customerCode;
		}
		
	};*/
	
	 
	
   
})(jQuery);