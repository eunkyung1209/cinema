//화면 로딩 후 바로 실행
$(document).ready(function(){
	
});



//함수 선언 영역
(function($){
	
	//댓글 수정
	updateReply = function(mvReplyCode) {
		//같은 mvReplyCode인 댓글 찾으려 반복한 뒤 코드 변경!
		$('.replyContent').each(function(index, element){
			//모든 댓글코드 담는 변수
			var allReplyCode = $(element).attr('data-mvReplyCode');
			
			//댓글코드가 수정하고자 하는 댓글의 댓글코드와 일치할 경우
			if(mvReplyCode == allReplyCode){
				//해당 class="replyContent"를 갖는 태그 근처의
				//평점 값 감싸는 span 태그 안의 data-grade 속성 값 가져옴
				var grade = $(this).prev().prev().children(':last').attr('data-grade');
				
				//평점 값 적힌 곳 input 태그로 변경
				$(this).prev().prev().children(':last').html(' <input type="number" name="grade" min="0" max="5" value="' + grade + '" required>');
				
				//해당 class="replyContent"를 갖는 태그 안의 data-content 속성 값 가져옴
				var content = $(this).attr('data-content');
				
				//댓글 내용 적힌 곳 input 태그로 변경
				$(this).html('<div><input type="text" name="mvReplyContent" style="width: 92%;" value="' + content + '" required> <input type="submit" value="수정"></div>');
			}
		});
		
//		//-----코드 데이터-----
//		var mvCode = $('.mvCode').value();
//		var mvReplyCode = $('.mvReplyCode').value();
//		
//		//-----댓글 평점 수정칸-----
//		//평점 데이터 가져옴
//		var grade = $('.replyGrade').attr('data-grade');
//		
//		//선택한 하위 태그만 지움
//		$('.replyGrade').empty();
//		
//		//다시 그림
//		var gradeStr = ' <input type="number" name="grade" class="grade" min="0" max="5" value="' + grade + '" required>';
//		
//		//해당 노드의 마지막 자식 노드 뒤에 html 코드 추가
//		$('.replyGrade').append(gradeStr);
//		
//		//-----댓글 내용 수정칸-----
//		//댓글 데이터 가져옴
//		var content = $('.replyContent').attr('data-content');
//		
//		//선택한 하위 태그만 지움
//		$('.replyContent').empty();
//		
//		//다시 그림
//		var contentStr = '<input type="text" name="mvReplyContent" class="mvReplyContent" style="width: 100%;" value="' + content + '" required> <input type="button" value="수정" onclick="updateResult();">';
//		
//		//해당 노드의 마지막 자식 노드 뒤에 html 코드 추가
//		$('.replyContent').append(contentStr);
	};
	
	
	//댓글 삭제
	deleteReply = function(mvReplyCode) {
		//영화코드 데이터 가져옴
		var mvCode = $('#mvCode').val();
		
		//삭제할지 물어봄
		var result = confirm('댓글을 삭제하시겠습니까?');
		
		if(result){
			alert('삭제되었습니다.');
			location.href = '/movie/deleteReply?mvCode=' + mvCode + '&mvReplyCode=' + mvReplyCode;
		}
		
	};
	
	 
	
   
})(jQuery);
