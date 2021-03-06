//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	   $(document).on('click', '.movieCalDiv', function() { 
		   
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
				//영화관을 다시 누르면 상영시간버튼 초기화
				$('#movieTimeBtn').empty();
				$('.dateCheck').text('');
				$('.reserveTitleMovieTime').text('');
				
				$('.areaCheck').text('');
				$(this).children().children().next().text('V');
				$(this).children().children().next().css('color', 'red')
				
				$('.reserveTitleArea').text(areaName);
				
			}
		});
		
		/*//영화관에 따른 상영시간표를 ajax로 조회
		 $.ajax({
	            url: '/reservation/selectMovieTimeAjax1', //요청경로
	            type: 'post',
	            data:{'areaName':areaName}, //필요한 데이터
	            success: function(result) {
	            	
	            	$('#movieTimeBtn').empty();
	            	
	            	var str = '';
	            	
	            	//반복문
	            	$(result).each(function(index, element) {
	            		
					str += '<div class="col-3 m-1" >' + element.title + '<div class="reserveInfoBtn"> ' ;
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
	      });*/
		 
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
				
				//영화를 다시 누르면 상영버튼 초기화
				$('#movieTimeBtn').empty();
				$('.dateCheck').text('');
				$('.reserveTitleMovieTime').text('');
				
				$('.movieCheck').text('');
				$(this).children().children().next().text('V');
				$(this).children().children().next().css('color', 'red')
				
				
				$('.codeValue').html('<input type="hidden" id="mvCode">');
				$('#mvCode').val(mvCode);
				$('.reserveTitleMovie').text(title);
				
			}
		});
		
		
		/*//영화관, 영화를 선택 후 상영시간표를 ajax로 조회
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
	      });*/
		
	};
	
	//달력을 선택하면,,
	calClick  = function(screenDay) {
		
		var areaName = $('.reserveTitleArea').text();
		var mvCode = $('#mvCode').val();
		
		
		//반복문
		$('.calDiv').each(function(index, element){
			var dateAll = $(element).attr('data-date');
			
			if(dateAll == screenDay){
				
				$('.dateCheck').text('');
				$(this).next().text('V');
				$(this).next().css('color', 'red')
				
				$('.reserveTitleMovieTime').text(screenDay);
			}
		});
		
		
		
		//영화관, 영화, !날짜!를 선택후 ajax로 조회
		$.ajax({
	            url: '/reservation/selectMovieTimeAjax3', //요청경로
	            type: 'post',
	            data:{'areaName':areaName, 'mvCode':mvCode, 'screenDay':screenDay}, //필요한 데이터
	            success: function(result) {
	            	
	            	$('#movieTimeBtn').empty();
	            	
	            	
	            	//반복문
	            	$(result).each(function(index, element) {
	            	
	            	var str = '';	
	            		
					str += '<div class="col-3 m-1" >' + '<span class="movieTitleR">'+ element.title + '</span>'+'<div class="reserveInfoBtn" onclick="movieTimeClick(\'' + element.mvTimeCode +'\');" data-mvTimeCode="' + element.mvTimeCode + '">';
					str += '<a title="'+ element.screenEndTime +'"><div class="screenTimeDiv m-1" >'+  element.screenTime + '</div></a>';
					str += '<div class="seatDiv m-1">' + element.seatLeft + '/';
					str +=  element.seatAll +' [' + element.theaterName + '] </div> </div> </div>';
	            		
	            		$('#movieTimeBtn').append(str);
					});
	            	
	            },
	            error: function(){
	             //ajax 실행 실패 시 실행되는 구간
	               alert('실패');
	            }
	      });
		
	};
	
	
	
	
	
	//상영시간표 버튼 클릭하여 좌석선택 페이지로 이동
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
