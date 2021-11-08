/* 페이지 로딩 후 실행 
$(document).ready(function(){

});

 함수선언 영역
	(aaa = function(id){
		 var result = confirm('정말 탈퇴하시나요?');
	      
	      if(result){
	         location.href = '/member/deleteMember?id=' + id;
	      };


(deleteMember = function(id){
	     var result = confirm('정말 탈퇴하시나요?');
	     var id = id;
	     
	     alert(id);
	      
	     if(result){
	        location.href = '/member/deleteMember?id=' + id;
	     };	

})(jQuery);*/



/*//함수 선언 영역
(function($){

	deleteMember = function() {
		var id = $('#id').val();
		
		alert(id);
		
			location.href = '/member/deleteMember?id=' + id;
		
	}; */    
   
/*})(jQuery);*/





//화면 로딩 후 바로 실행
$(document).ready(function(){});




(function($){

	deleteMember = function(){
		 var result = confirm('정말 탈퇴하시나요?');
		 var id = $('.id').val();
		 
		 
		 if(result == false){
		        
		        alert("탈퇴가 취소되었습니다.");
		        
		     }
	     
		 else if(result == true){
	        location.href = '/member/deleteMember?id=' + id;
	        
	        alert("탈퇴가 완료되었습니다.");
	        
	     }
	  };
     
})(jQuery);


