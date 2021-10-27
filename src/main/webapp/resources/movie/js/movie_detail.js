//화면 로딩 후 바로 실행
$(document).ready(function(){
	
});



//함수 선언 영역
(function($){
	
	//댓글 수정
	updateReply = function() {
		//-----코드 데이터-----
		var mvCode = $('.mvCode').value();
		var mvReplyCode = $('.mvReplyCode').value();
		
		//-----댓글 평점 수정칸-----
		//평점 데이터 가져옴
		var grade = $('.replyGrade').attr('data-grade');
		
		//선택한 하위 태그만 지움
		$('.replyGrade').empty();
		
		//다시 그림
		var gradeStr = ' <input type="number" name="grade" class="grade" min="0" max="5" value="' + grade + '" required>';
		
		//해당 노드의 마지막 자식 노드 뒤에 html 코드 추가
		$('.replyGrade').append(gradeStr);
		
		//-----댓글 내용 수정칸-----
		//댓글 데이터 가져옴
		var content = $('.replyContent').attr('data-content');
		
		//선택한 하위 태그만 지움
		$('.replyContent').empty();
		
		//다시 그림
		var contentStr = '<input type="text" name="mvReplyContent" class="mvReplyContent" style="width: 100%;" value="' + content + '" required> <input type="button" value="수정" onclick="updateResult();">';
		
		//해당 노드의 마지막 자식 노드 뒤에 html 코드 추가
		$('.replyContent').append(contentStr);
		
		
		//반복을 할 필요가 있나..?
//		$('.replyContent').each(function(index, element){
//			var allReplyCode = $(element).attr('data-replyCode');
//			
//			if(customeReplyCode == allReplyCode){
//				$(this).html('<div><input type="text" name="content" style="width: 92%"> <input type="submit" value="수정" ></div>');
//			}
//		});
	};
	
	updateResult = function() {
		//필요한 데이터 가져옴
		var mvCode = $('.mvCode').val();
		var mvReplyCode = $('.mvReplyCode').val();
		var grade = $('.grade').val();
	};
	
	//댓글 삭제
	deleteReply = function() {
		//필요한 데이터 가져옴
		var mvCode = $('.mvCode').val();
		var mvReplyCode = $('.mvReplyCode').val();
		
		//삭제할지 물어봄
		var result = confirm('댓글을 삭제하시겠습니까?');
		
		if(result){
			alert('삭제되었습니다.');
			location.href = '/movie/deleteReply?mvCode=' + mvCode + '&mvReplyCode=' + mvReplyCode;
		}
		
	};
	
	 
	
   
})(jQuery);
