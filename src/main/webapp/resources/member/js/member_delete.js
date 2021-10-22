/* 페이지 로딩 후 실행 */
$(document).ready(function(){


});

/* 함수선언 영역*/
(function($){
	deleteMember = function(id){
	      var result = confirm('정말 탈퇴하시나요?');
	      
	      if(result){
	         location.href = 'deleteMember?id=' + id;
	      }

     };
	

})(jQuery);