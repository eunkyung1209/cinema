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
		
		//영화관에 따른 상영시간표를 ajax로 조회
		 $.ajax({
	            url: '/reservation/selectMovieTimeAjax1', //요청경로
	            type: 'post',
	            data:{'areaName':areaName}, //필요한 데이터
	            success: function(result) {
	            	
	            	$('#movieTimeBtn').empty();
	            	
	            	var str = '';
	            	
	            	//반복문
	            	$(result).each(function(index, element) {
	            		
					str += '<div class="col-3 m-1" ><div class="reserveInfoBtn"> ' ;
					str += '<div class="screenTimeDiv m-1">'  + element.screenTime + '</div>';
					str += '<div class="seatDiv m-1">' + '/';
					str += element.seatAll +' [' + element.theaterName + '] </div> </div> </div>';
	            		
	            		$('#movieTimeBtn').append(str);
					});
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });
		 
		 /*//영화관에 따른 영화를 조회
		 $.ajax({
	            url: '/reservation/selectMovieTimeAjax2', //요청경로
	            type: 'post',
	            data:{'areaName':areaName}, //필요한 데이터
	            success: function(result) {
	            	
	            	$('#movieTimeMovie').empty();
	            	
	            	//반복문
	            	$(result).each(function(index, element) {
	            		
	            		var str = '';
	            		
	            		str += '<li class="m-3 movieName" onclick="movieClick(\'' + element.mvCode + '\', \'' + element.title + '\', \''+ areaName +'\');" ';
	            		str += ' data-mvCode="' + element.mvCode + '">';
	            		str += '<div class="row justify-content-center" ><div class="col-10">';
	            		
	            		if(element.age == 12){
	            			str += '<img height="25px;" src="/resources/images/reservation/12.png">';
	            		}
	            		if(element.age == 15){
	            			str += '<img height="25px;" src="/resources/images/reservation/15.png">';
	            		}
	            		if(element.age == 19){
	            			str += '<img height="25px;" src="/resources/images/reservation/19.png">';
	            		}
	            		if(element.age == 0){
	            			str += '<img height="25px;" src="/resources/images/reservation/전체.png">';
	            		}
					
	            		str += element.title;
						str += '</div><div class="col-2 movieCheck" > </div></div>';
	            		
	            		$('#movieTimeMovie').append(str);
					});
	            	
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });*/
	};
	
	//영화를 선택
	movieClick = function(mvCode, title, areaName) {
		
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
		
		
		//영화관, 영화를 선택 후 상영시간표를 ajax로 조회
		 $.ajax({
	            url: '/reservation/selectMovieTimeAjax3', //요청경로
	            type: 'post',
	            data:{'areaName':areaName, 'mvCode':mvCode}, //필요한 데이터
	            success: function(result) {
	            	
	            	$('#movieTimeBtn').empty();
	            	
	            	var str = '';
	            	
	            	//반복문
	            	$(result).each(function(index, element) {
	            	
					str += '<div class="col-3 m-1" >'+ element.title +'<div class="reserveInfoBtn" onclick="movieTimeClick(\'' + element.mvTimeCode +'\');" data-mvTimeCode="' + element.mvTimeCode + '">';
					str += '<div class="screenTimeDiv m-1">'+  element.screenTime + '</div>';
					str += '<div class="seatDiv m-1">' + '/';
					str += element.seatAll +' [' + element.theaterName + '] </div> </div> </div>';
	            		
	            		$('#movieTimeBtn').append(str);
					});
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });
		
	};
	
	
	
	//달력의 날짜를 클릭하면..
	movieCalClick = function() {
		
		//만약 disabled를 선택한다면,,
		$(document).on('click', '.\-disabled-', function() { 
			alert('지난 날짜는 선택이 불가합니다.');
			
			var able = false;
		}); 
		
			
		var date = $(this).attr('data-date');
		
			alert('date' + date);
		
	};
	
	
	movieCalCellClick = function(){
		alert('셀클릭');
	};
	
	//상영시간표 버튼을 클릭하면..
	movieTimeClick = function(mvTimeCode) {
		
		//반복문
		$('.reserveInfoBtn').each(function(index, element){
			var mvTimeCodeAll = $(element).attr('data-mvTimeCode');
			
			
			
			if(mvTimeCode == mvTimeCodeAll){
				
				$(this).css('color', 'red')
				$('.reserveTitleMovieTime').text(mvTimeCode);
				
				
				var result = confirm('좌석 선택을 진행 하시겠습니까?');
				$(this).css('color', 'black')
					$('.reserveTitleMovieTime').empty();
				
				if(result){
					location.href='/reservation/seatChoice?mvTimeCode=' + mvTimeCode;
				}
			}
		});
		
	};
	 
	
   
})(jQuery);
