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