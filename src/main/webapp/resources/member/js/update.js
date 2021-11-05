
$(document).ready(function(){
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	// 닉네임 정규식
	var nickJ = /^[A-Za-z0-9ㄱ-힣]{1,10}$/;
	   
	//셀렉트박스의 값이 변경 되면
	//$(document).on('change', '#id', function() { 

	$("#id").blur(function() {
	// id = "id" / name = "userId"
	
		var id = $('#id').val();
		

		
		
		$.ajax({
			url : '/member/idCheck',
			type : 'post',
			data:{'id':id}, //필요한 데이터
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);
				


				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자 or 숫자 조합(4~12자)입력 가능합니다 :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				
				}, error : function() {
						console.log("실패");
				}
			});
	});
	
	
	// 이름에 특수문자 들어가지 않도록 설정
	$("#name").blur(function() {
		
		if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
				$("#reg_submit").attr("disabled", false);
		} else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
	
	// 휴대전화
	$('#tell').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(phoneJ.test($(this).val()));
			$("#tell_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#tell_check').text('휴대폰번호를 확인해주세요 :)');
			$('#tell_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
	
	
	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일	birthJ 유효성 검사
	$('#birthday').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
	    if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');
				$("#reg_submit").attr("disabled", true);
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
				$("#reg_submit").attr("disabled", true);
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
				$("#reg_submit").attr("disabled", true);
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
				$("#reg_submit").attr("disabled", true);
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
					$("#reg_submit").attr("disabled", true);
				}else{
					$('#birth_check').text('');
					birthJ = true;
					$("#reg_submit").attr("disabled", false);
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
				$("#reg_submit").attr("disabled", false);
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');
				$("#reg_submit").attr("disabled", true);
			}
		}); //End of method /*

	
	
	
	//이메일 중복 유효성 검사
	$("#email").blur(function() {
	
	var email = $('#email').val();
	
	$.ajax({
		url : '/member/emailCheck',
		type : 'post',
		data:{'email':email}, //필요한 데이터
		success : function(data2) {
			console.log("1 = 중복o / 0 = 중복x : "+ data2);							
			
			if (data2 == 1) {
					// 1 : 이메일이 중복되는 문구
					$("#email_check").text("이미 가입된 이메일입니다 :p");
					$("#email_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(mailJ.test(email)){
						// 0 : 이메일 길이 / 문자열 검사
						$("#email_check").text("");
						$("#reg_submit").attr("disabled", false);
			
					} else if(email == ""){
						
						$('#email_check').text('이메일을 입력해주세요 :)');
						$('#email_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#email_check').text("이메일은 eunbin@naver.com의 형식으로 가능합니다 :)");
						$('#email_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}
			
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
	
	
	
	//닉네임 중복 유효성 검사
	$("#nickName").blur(function() {

	var nickName = $('#nickName').val();
	
	$.ajax({
		url : '/member/nickNameCheck',
		type : 'post',
		data:{'nickName':nickName}, //필요한 데이터
		success : function(data3) {
			console.log("1 = 중복o / 0 = 중복x : "+ data3);							
			
			if (data3 == 1) {
					// 1 : 닉네임이 중복되는 문구
					$("#nickName_check").text("이미 사용중인 닉네임입니다 :p");
					$("#nickName_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(nickJ.test(nickName)){
						// 0 : 닉네임 길이 / 문자열 검사
						$("#nickName_check").text("");
						$("#reg_submit").attr("disabled", false);
			
					} else if(nickName == ""){
						
						$('#nickName_check').text('닉네임을 입력해주세요 :)');
						$('#nickName_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#nickName_check').text("닉네임은 문자 or 숫자 조합(1~10자리)입력 가능합니다 :)");
						$('#nickName_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}
			
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
	//비밀번호 일치 확인 검사
	//1-1 정규식 체크 검사
	$("#pw").blur(function() {
		
		if (pwJ.test($('#pw').val())) {
			console.log('true');
			$("#pw_check").text('');
			$("#reg_submit").attr("disabled", true);
		} else {
			console.log('false');
			$('#pw_check').text('영문 or 숫자 조합(4~12자리)입력 가능합니다 :)');
			$('#pw_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
	
	//1-2 비밀번호 일치 검사
	$("#pw2").blur(function() {
	
		if ($('#pw').val() != $(this).val()) {
			$("#pw2_check").text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		} else {
			$('#pw2_check').text('');
			$("#reg_submit").attr("disabled", false);
		}
	});

	
	

});(jQuery);	