//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	
	

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
	   
	  
	  
	
	
	 
	
});


//함수 선언 영역
(function($){
	
	//영화관을 선택
	areaNameClick = function(areaName){
		$('.areaCheck').empty;
		
		//반복문
		$('.areaName').each(function(index, element){
			var areaNameAll = $(element).attr('data-areaName');
			
			if(areaName == areaNameAll){
				$('.areaCheck').text('');
				$(this).children().children().next().text('V');
				$(this).children().children().next().css('color', 'red')
				
				$('.reserveTitleArea').text(areaName);
			}
		});
	};
	
	
	//영화를 선택
	movieClick = function(mvCode, title) {
		
		//반복문
		$('.movieName').each(function(index, element){
			var mvCodeAll = $(element).attr('data-mvCode');
			
			if(mvCode == mvCodeAll){
				$('.movieCheck').text('');
				$(this).children().children().next().text('V');
				$(this).children().children().next().css('color', 'red')
				
				$('.reserveTitleMovie').text(title);
			}
		});
		
		
	};
	
	
	 
	
   
})(jQuery);
