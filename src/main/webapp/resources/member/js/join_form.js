	function openPostCode(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            // 첫번째는 우편번호
	        	document.getElementById('postCode').value = data.zonecode;
	            // 두번째는 도로주소
                document.getElementById("addr").value = data.roadAddress;
	        }
	   	 }).open();	
	}























