//화면 로딩 후 바로 실행
$(document).ready(function(){

	   //셀렉트박스의 값이 변경 되면
	   $(document).on('change', '#movieSeletor', function() { 
		   var mvCode = $('#movieSeletor').val();
		   
		   $.ajax({
	            url: '/reservation/selectMovieInfoAjax', //요청경로
	            type: 'post',
	            data:{'mvCode':mvCode}, //필요한 데이터
	            success: function(result) {
	            	
	            	var runningTime = result.runningTime;
	            	
	            	$('#runningTime').val(runningTime);
	            	
	            	
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });
		
	   });
	   
	   //셀렉트박스의 값이 변경 되면
	   $(document).on('change', '#areaSelector', function() {
		   var areaName = $('#areaSelector').val();
		   
		   $.ajax({
	            url: '/reservation/selectUseTheaterAjax', //요청경로
	            type: 'post',
	            data:{'areaName':areaName}, //필요한 데이터
	            success: function(result) {
	            	
            	$(result).each(function(index, element) {
            		
					$('.theaterCode').val(element.theaterCode);
					$('.theaterCode').text(element.theaterName);
				});
	            	
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });
		
	   });
	   
	   $(document).on('change', '#screenTime', function() {
		   var screenTime = $('#screenTime').val();
		   var runningTime = $('#runningTime').val();
		   var screenEndTime = '';
		   
		   
		   
	   });
	
	
	 
	
});


//함수 선언 영역
(function($){
	
	/*
	//게시글 삭제
	deleteCustomer = function(){
		var customerCode = $('#customerCode').val();
		
		var result = confirm('정말 삭제하시겠습니까?');
		
		if(result){
			location.href='/customer/deleteCustomer?customerCode=' + customerCode;
		}
		
	};*/
	
	
	
	
	 
	
   
})(jQuery);
