//화면 로딩 후 바로 실행
$(document).ready(function(){
	
	//사용할 적립금 금액이 바뀌면
	$(document).on('change', '#savedMoney', function() {
		//수정된 적립금 금액
		//var savedMoneyText = $('#savedMoney').val();
		var savedMoney = parseInt($('#savedMoney').val());
		//상품 금액
		//var ticketPriceText = $('#ticketPrice').text();
		var ticketPrice = $('#ticketPrice').text();
		ticketPrice = ticketPrice.replace(/[^\d]+/g, "");
		
		//할인 금액 수정
		$('#salePrice').text(savedMoney.toLocaleString());
		
		//결제 금액 수정
		$('#totalPrice').text((ticketPrice - savedMoney).toLocaleString());
		$('.totalPrice').val(ticketPrice - savedMoney);
		
		//값 변경되는지 확인
		//console.log(savedMoney);
		//console.log(ticketPrice);
	});
	
	//이벤트 처리
	//$(document).on('click', '#id', function() {
    //});
   
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
   
})(jQuery);
























