//화면 로딩 후 바로 실행
$(document).ready(function(){
	

	
});


//함수 선언 영역
(function($){
	
	//게시글 삭제
	deleteCustomer = function(){
		var customerCode = $('#customerCode').val();
		
		var result = confirm('정말 삭제하시겠습니까?');
		
		if(result){
			location.href='/customer/deleteCustomer?customerCode=' + customerCode;
		}
		
	};
	
	//댓글 수정
	updateCustomerReply = function() {
		var customeReplyCode = $('.customeReplyCode').val();
		
		
		$('.replyContent').empty();
		$('.upReply').html('<input type="text" name="content" id="replyContentUp" style="width: 92%"> <input type="submit" id="updateBtn" value="수정" >');
		
		
		var customerCode = $('#customerCode').val();
		
	};
	
	//댓글 삭제
	deleteCustomerReply = function() {
		var customerCode = $('#customerCode').val();
	};
	 
	
   
})(jQuery);
