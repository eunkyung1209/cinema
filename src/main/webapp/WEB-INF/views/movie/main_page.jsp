<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/resources/sample/css/sample.css"> -->
<style type="text/css">
body{
	background-color: black;
	color: white;
 	margin: 0;
    padding: 0;
}

.mainBannerSwiper{
	z-index: 3;
}
/* .mainBigPicture_j{
	background-image: url(resources/images/main/메인사진.jpg);
	background-size: cover;
	background-position: center;
	height: 684px;
} */

/* .logo{
	margin-top : 250px;
	margin-bottom : 200px;
	border-bottom: solid 5px white;
	opacity: 0.2;
} */
.logo > img{
	text-align: center;
}

.nowTime{
	font-size: 15px;
	text-align: right;
	padding-bottom: 14px;
}
.nowTime img{
	width: 25px;
	height: 25px;
}

.number{
	padding: none;
	background-color: white;
	color:red;
	font-size: 30px;
	text-align: center;
	position: absolute;
	top: 2%;
	left: 2%;
}
.star{
	width: 17px;
	height: 17px;
}
.card{
	background-color: black;
}


.chatIcon{
	text-align: right;

}
</style>
</head>
<body>



<div class="row justify-content-center">
	<!-- 상단 사진 변경 --><!-- Swiper -->
	<div class="swiper mainBannerSwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><a><img src="/resources/images/main/메인사진.jpg" width="100%;"></img></a></div>
			<div class="swiper-slide"><a><img src="/resources/images/main/로고.png" width="100%;"></img></a></div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div>
	
	

	
	
	
	
			<%-- <div style="width: 400px; height: 600px; top: 400px; right: 150px; position: absolute; z-index: 3;" id="chat">
			
         <div style="background-color: rgb(255, 209, 4); border-radius: 15px;" align="center"> 
            <div style="height: 100px; line-height: 44px; padding-left: 15px;" align="left">
            
            	<div style="height: 7px"></div>
            
               <div style="font-weight: bold; font-size: 30px;">
               		OISONE TALK
               		
               		<svg xmlns="http://www.w3.org/2000/svg" width="27" height="28" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
					  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>
               		
               </div>
              	
               
               <div style="padding-left: 180px;">
               
               		<button type="button"  style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:80px;height: 35px" onclick="openSocket();" > 채팅 참여</button>
               		<!-- <button type="button"  style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:120px;height: 25px" onclick="javascript:clearText();">대화내용 지우기</button> -->
        			<button type="button"  style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:80px;height: 35px; padding-top: -30px;" onclick="closeSocket();"><span style="padding-bottom: 5px;">채팅 나가기</span></button>
        		
        	   </div>	
        			
        			<div style="height: 30px"></div>
        			
               <i class="icon-down-open close" ></i>
               <!-- <button type="button" onclick="closeSocket();">대회방 나가기</button> --> 
            </div>
            <div style="height: 440px; background: white; border-radius: 10px; width: 350px; overflow: auto;" id="messageDiv">
            
               <div id="messages" style="text-align: left; padding-left: 10px;">
               
               
            </div>
               
               
            </div> <!-- Server responses get written here -->
            <div style="height: 10px"></div>
               <div style="background-color: white; height: 80px;border-radius: 10px; width: 350px; padding: 5px">
              
               
                  <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
                  <input type="text" id="messageinput" style="width: 250px; height: 68px; border: none;"> 
                  
                  <button type="button" id="sendBtn" style="background: #191970 ; outline: none;border: none;border-radius: 6px;color: white;   width:53px;height: 40px" onclick="send();">전송</button> 
               		
               
               </div>
               
                <!-- Server responses get written here -->
    			<div id="messages"></div>
               
               
            <div style="height: 10px"></div>
  
		
		
		
		
		
		</div>	
	</div> --%>
	
	
	
       
      
	
	
	
	
	
	
	
	
	
	
	
<!-- 	<div class="row mainBigPicture_j">
		
	</div> -->
	
	<!-- 로고 -->
	<div class="row logo justify-content-center mt-5">
		<div class="col-5"></div>
		<div class="col-2">
			<img src="/resources/images/main/로고.png" width="98%">
		</div>
		<div class="col-5"></div>
	</div>
	
	<!-- 현재 일시 -->
	<div class="row text-right nowTime justify-content-center">
		<div class="col-10">
			<img src="/resources/images/main/메인서브-시계.png">
			${nowDateTime } 기준
		</div>
	</div>
	
	<!-- 영화 목록 조회 -->
	<div class="row">
		<div class="col-1"></div>
		<c:forEach items="${movieList }" var="movieInfo" varStatus="status">
			<div class="col-2">
				<div class="card mb-3">
					<a href="/movie/movieDetail?mvCode=${movieInfo.mvCode }"><img src="/resources/images/movie/${movieInfo.imgList[0].attachedImgName }" class="card-img-top"></a>
					<div class="card-body">
						<div class="number">${status.count }</div>
						<h5 class="card-title">${movieInfo.title }</h5>
						<p class="card-text">
							${movieInfo.genre } 
							&nbsp;|&nbsp; 
							<img src="/resources/images/main/메인서브-별점.PNG" class="star">${movieInfo.grade }
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="col-1"></div>
	</div>
	
	<!-- 영화 예시 -->
	<div class="row">
		<div class="col-1"></div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">베놈2</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브02.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브03.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브04.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-2">
			<div class="card mb-3">
				<a href="#"><img src="/resources/images/main/메인서브-01.png" class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">영화제목</h5>
					<p class="card-text">
						<img src="/resources/images/main/메인서브-별점.PNG" class="star"> 7.5 &nbsp;|&nbsp;
						<img src="/resources/images/main/메인서브-좋아요.PNG" class="star">
					</p>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
</div>
</body>
<script>
	var swiper = new Swiper(".mainBannerSwiper", {
		slidesPerView : 1,
		spaceBetween : 30,
		centeredSlides : true,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		loop : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});

	var swiper = new Swiper(".itemSwiper", {
		slidesPerView : 1,
		spaceBetween : 10,
		autoplay : {
			delay : 2000,
			disableOnInteraction : true,
			loop : true,
		},
			loop : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		breakpoints : {
			640 : {
				slidesPerView : 2,
				spaceBetween : 20,
			},
			768 : {
				slidesPerView : 4,
				spaceBetween : 40,
			},
			1024 : {
				slidesPerView : 5,
				spaceBetween : 50,
			},
		},
	});
	
	
	
	
	
	
	/*  */
	
	
	
	
</script>
</html>