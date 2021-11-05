//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	//ajax 사용
//	$.ajax({
//        url: '', //요청경로
//        type: 'post',
//        data:{}, //필요한 데이터
//        success: function(result) {
//        	//ajax 실행 성공 시 실행되는 구간
//        	alert('성공');
//        },
//        error: function(){
//        	//ajax 실행 실패 시 실행되는 구간
//        	alert('실패');
//        }
//  });
	
	
});

//함수 선언 영역
(function($){
	//aaa = function(){
	//};
	
	updateRental = function(rtCode){
		//같은 rentalCode인 줄을 찾으려 반복한 뒤 데이터 갖고 페이지 이동!
		$('.updateRental').each(function(index, element){
			//모든 대관코드 담는 변수
			var allRentalCode = $(element).attr('data-rtCode');
			
			//대관코드가 수정하고자 하는 줄의 대관코드와 일치할 경우
			if(rtCode == allRentalCode){
				var theaterName = $(this).parent().parent().children().eq(2).children().val();
				var rtStartTime = $(this).parent().parent().children().eq(4).children(':first').val();
				var rtEndTime = $(this).parent().parent().children().eq(4).children(':last').val();
				var isComplete = $(this).parent().prev().children().val();
				
//				console.log('theaterName = ' + theaterName);
//				console.log('rtStartTime = ' + rtStartTime);
//				console.log('rtEndTime = ' + rtEndTime);
//				console.log('isComplete = ' + isComplete);
				
				location.href = '/admin/updateRental?rtCode=' + rtCode
												+ '&theaterName=' + theaterName
												+ '&rtStartTime=' + rtStartTime
												+ '&rtEndTime=' + rtEndTime
												+ '&isComplete=' + isComplete;
			}
		});
	};
	
})(jQuery);
























