<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/member/js/input_login.js?ver=13"></script>

<style type="text/css">

.menuBodyDiv{
	color: gray;
}
a{
	text-decoration: none;
}
.nav-link{
	color: gray;
}

.menuBodyDiv{
	/* height: 100px; */
	padding-left: 8%;
	padding-right: 8%;
}
.lineMenuDiv{
	padding-top: 20px;
}

.logoDiv{
	margin-top: 20px;
	text-align: right;
	height: 70px;
	padding-right: 150px;
}

.loginDiv{
	text-align: right;
	margin-top: 20px;
	font-size: 14px;

}

.mypageDiv{
	text-align: right;
	margin-top: 10px;
}

.menu_menu {
	font-weight: bold;
}

.menu_menu > ul{
	padding: 0;
}

.menu_menu li{
	display: inline-block;
	padding: 10px;
	margin-left: 20px;
	margin-right: 20px;
}

.loginDiv:hover{

}

/* .modal{
	color: black;
} */

.btn{
	background-color: black;
	color: white;

}

.lineMenuBody{
}

.loginDiv:hover {
	cursor: pointer;
}
.selectRental{
	cursor: pointer;
}

a{
	color: gray;
}

a:hover {
	font-weight: bold;
	color: gray;
}
/* #menuNav{
	display: none;
}
#menuMovie:checked + nav#menuNav{
	display: block;
} */

.icon{
	width: 2rem;
	height: 2rem;
}
</style>
</head>
<body>
<div class="menuBodyDiv row justify-content-center">
	<div class="col">
		<div class="row">
			<div class="col-1 lineMenuDiv" >
				<a href="#" class="text-decoration-none" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list icon" viewBox="0 0 16 16">
						<path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
						<path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
					</svg>
				</a>
				<!-- <button  value="-" class="navbar-toggler btn-outline-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					<img alt="" height="30px;" src="/resources/images/menu/lineMenu.png">
			    </button> -->
			</div>
			<div class="col-7 logoDiv">
				<c:choose>
					<c:when test="${not empty logo }">
						<a href="/movie/mainPage"><img alt="" height="50px" src="/resources/images/menu/logo_black.png"></a>
					</c:when>
					<c:otherwise>
						<a href="/movie/mainPage"><img alt="" height="50px" src="/resources/images/menu/logo_white.png"></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-4">
				<div class="loginDiv" >
					<c:choose>
						<c:when test="${not empty sessionScope.loginInfo }">
							${sessionScope.loginInfo.nickName }님 반갑습니다.<br>
							<a href="/member/logout">Logout</a>
						</c:when>
						<c:otherwise>
							<span data-bs-toggle="modal" data-bs-target="#loginModal" class="loginDiv">Login</span>
							<a href="/member/join">Join</a>
						</c:otherwise>
					</c:choose>
				
					<div class="mypageDiv">
						<a href="/customer/goCustomer?isNotice=N">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
							</svg> 고객센터
						</a>
						&nbsp;&nbsp;
						<a href="/sample/sample">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-week-fill" viewBox="0 0 16 16">
								<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zM9.5 7h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5zm3 0h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5zM2 10.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3.5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"/>
							</svg> 빠른예매
						</a>
						&nbsp;&nbsp;
						<c:if test="${sessionScope.loginInfo != null}">
							<a href="/member/myPage">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
									<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg> 마이페이지
							</a>
						</c:if>
						<c:if test="${sessionScope.loginInfo == null}">
							<span data-bs-toggle="modal" data-bs-target="#loginModal" class="loginDiv">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
									<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg> 마이페이지
							</span>
						</c:if>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="row menubarDiv justify-content-center">
			<div class="col-12">
				<div class="col-12 menu_menu text-center">
					<ul>
					<%-- <c:choose>
						<c:when test="${empty sessionScope.loginInfo or sessionScope.loginInfo.isAdmin eq 'N' }"> --%>
				   		<!-- <li ><a href="#" > <label class="menuMovie" for="menuMovie">MOVIE</label> </a> 
				   			<input id="menuMovie" type="checkbox">
				   			<nav id="menuNav">
				   				<ul>
				   					<li>메롱</li>
				   					<li>메롱</li>
				   					<li>메롱</li>
				   				</ul>
				   			</nav>
				   		</li>
				   		<li><a href="#"> TICKET</a></li>
				   		<li><a href="#"> EVENT</a></li>
				   		<li><a href="#"> COMMUNITY</a></li> -->
				   		
				   		<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="/movie/movieList" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            	MOVIE
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				            	<li><a class="dropdown-item" href="/movie/movieList">홈</a></li>
				            	<li><a class="dropdown-item" href="/movie/movieList?mvState=Y">현재상영작</a></li>
				            	<li><a class="dropdown-item" href="/movie/movieList?mvState=N">상영예정작</a></li>
				            	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<!-- 관리자 기능 - 영화 관리 -->
				              	<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
					              	<li><a class="dropdown-item" href="/admin/movieManage">영화 관리</a></li>
				              	</c:if>
				            </ul>
				      	</li>
				          
				        <li class="nav-item dropdown">
				           	<a class="nav-link dropdown-toggle" href="/reservation/goReserve" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				              	TICKET
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				            	<li><a class="dropdown-item" href="/reservation/goReserve">예매하기</a></li>
				             	<li><a class="dropdown-item" href="#">Another action</a></li>
				            	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<!-- 관리자 기능 - 영화 상영시간 관리 -->
				              	<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
					              	<li><a class="dropdown-item" href="/reservation/goRegMovieTime">영화 상영시간 등록</a></li>
				              	</c:if>
				           	</ul>
				     	</li>
				          
				        <li class="nav-item dropdown">
				           	<a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            	EVENT / COMMUNITY
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				              	<li><a class="dropdown-item" href="/event/eventMain">이벤트/행사</a></li>
				              	<li><a class="dropdown-item" href="#">행사 일정</a></li>
				              	<li><a class="dropdown-item" href="/community/commuList">커뮤니티 게시판</a></li>
				              	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<!-- 관리자 기능 - 회원 관리 -->
				              	<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
					              	<li><a class="dropdown-item" href="/admin/adminMemberList">회원 관리</a></li>
				              	</c:if>
				            </ul>
				     	</li>
				          
				        <li class="nav-item dropdown">
				           	<a class="nav-link dropdown-toggle" href="/rental/goApplyRental" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				              	THEATER RENTAL
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				              	<li><a class="dropdown-item" href="/rental/goApplyRental">대관 예약 신청</a></li>
				              	<li>
				              		<c:if test="${sessionScope.loginInfo != null}">
										<a class="dropdown-item" href="/rental/selectRentalList">대관 예약 조회</a>
									</c:if>
									<c:if test="${sessionScope.loginInfo == null}">
										<span class="dropdown-item selectRental" data-bs-toggle="modal" data-bs-target="#loginModal" class="loginDiv">대관 예약 조회</span>
									</c:if>
				              	</li>
				              	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<!-- 관리자 기능 - 대관 관리 -->
				              	<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
					              	<li><a class="dropdown-item" href="/rental/rentalManage">대관 예약 관리</a></li>
				              	</c:if>
				            </ul>
				      	</li>
				      	
				      	<!-- 관리자 메뉴 -->
			      		<%-- <c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
			      			<li class="nav-item dropdown">
					            <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					              	ADMIN
					            </a>
					            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
					              	<li><a class="dropdown-item" href="/admin/adminMemberList">회원 관리</a></li>
					              	<li><a class="dropdown-item" href="/admin/movieManage">영화 관리</a></li>
					              	<li><a class="dropdown-item" href="/reservation/goRegMovieTime">영화 상영 등록</a></li>
					              	<li><a class="dropdown-item" href="#">홈페이지 관리</a></li>
					              	<li>
					                	<hr style="color: black;" class="dropdown-divider">
					              	</li>
					              	<li><a class="dropdown-item" href="#">기타</a></li>
					            </ul>
					       	</li>
			      		</c:if> --%>
			      		
				        <%-- </c:when>
						<c:otherwise>
				          <!-- !!!!!!!!!!! 관리자 페이지!!!!!!!!!!!!! -->
				        <li class="nav-item dropdown">
				            <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				              	ADMIN
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				              	<li><a class="dropdown-item" href="/admin/adminMemberList">회원 관리</a></li>
				              	<li><a class="dropdown-item" href="/admin/movieManage">영화 관리</a></li>
				              	<li><a class="dropdown-item" href="#">홈페이지 관리</a></li>
				              	<li>
				                	<hr style="color: black;" class="dropdown-divider">
				              	</li>
				              	<li><a class="dropdown-item" href="#">기타</a></li>
				            </ul>
				       	</li>
				 		</c:otherwise>
				 	</c:choose> --%>
				 	</ul>
				 	
				</div>
			</div>
		</div>
		
   		<!-- 로그인 Modal : 팝업창 -->
	   <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	      	<div class="modal-dialog">
	         	<div class="modal-content">
	            	<div class="modal-header"><!-- 팝업창 위쪽의 제목과 X 버튼 -->
	               		<h5 class="modal-title" id="exampleModalLabel" style="color: black;">로그인</h5>
	               		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            	</div>
		            <div class="modal-body"><!-- 팝업창 중간의 내용 -->
		            
			           <form action="/member/login" method="post">
			            
			               	<div class="form-floating mb-3">
			                  	<input type="text" name="id" class="form-control" id="loginIdd" placeholder="id" required>
			                  	<label for="floatingInput" style="color: #a4b0be">아이디</label>
			               	</div>
			               	<div class="form-floating">
			                  	<input type="password" name="pw" class="form-control" id="loginPw" placeholder="Password" required>
			                  	<label for="floatingPassword" style="color: #a4b0be">비밀번호</label>
			               	</div>
			               	<div class="col-12 d-grid mt-4">
			               		<input type="button" class="btn" id="loginBtn" value="로그인">
			                  	<div class="check_font" id="login_check"></div>
			                  	
			                  	<!-- <input type="button" class="btn" value="로그인" onclick="checkLogin();"> -->
			               	</div>
			               	
			          </form>
			            
		            </div>
		            <!-- 
		            <div class="modal-footer">팝업창 아래쪽의 버튼 2개
		               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		               <button type="button" class="btn btn-primary">Save changes</button>
		            </div>
		             -->
	         	</div>
	      	</div>
	   	</div>
	   
	  <!-- 메뉴맵 -->
		<div class="offcanvas offcanvas-start lineMenuBody" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel" >
		    <div class="offcanvas-header">
		       	<h5 class="offcanvas-title" id="offcanvasNavbarLabel">MENU MAP</h5>
		        <button type="button" class="btn-close text-reset" style="background-color: white;" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		    </div>
		    <div class="offcanvas-body">
		      	<form class="d-flex" action="#">
		          	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		          	<button class="btn btn-outline-secondary" type="submit">Search</button>
		        </form>
		        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
		          	<li class="nav-item">
		            	<a class="nav-link active" aria-current="page" href="/movie/mainPage">Home</a>
		          	</li>
		          	<li class="nav-item">
		            	<a class="nav-link" href="#">Link</a>
		          	</li>
		          	<li class="nav-item dropdown">
		            	<a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		              		Dropdown
		            	</a>
				       	<ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				          	<li><a class="dropdown-item" href="#">Action</a></li>
				            <li><a class="dropdown-item" href="#">Another action</a></li>
				            <li>
				              	<hr class="dropdown-divider">
				            </li>
				            <li><a class="dropdown-item" href="#">Something else here</a></li>
				       	</ul>
		          	</li>
		       	</ul>
		  	</div>
		</div>
</div>
</div>
</body>
</html>















