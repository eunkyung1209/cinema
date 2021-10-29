<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
<div class="menuBodyDiv row justify-content-center">
	<div class="col">
		<div class="row">
			<div class="col-1 lineMenuDiv" >
				<button  value="-" class="navbar-toggler btn-outline-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					<img alt="" height="30px;" src="/resources/images/menu/lineMenu.png">
			    </button>
			</div>
			<div class="col-7 logoDiv" >
				<img alt="" height="70px" src="/resources/images/menu/logo.png">
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
						<a href="/customer/goCustomer?isNotice=N"><img alt="" width="35px" src="/resources/images/menu/center.png">고객센터</a>
						<a href="/sample/sample"> <img alt="" width="32px" src="/resources/images/menu/fastTicket.png"> 빠른예매</a>
						<a href="/member/myPage"><img alt="" width="32px" src="/resources/images/menu/myPage.png">마이페이지</a>
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
				            	<li><a class="dropdown-item" href="/movie/movieList?mvState=Y">현재상영작</a></li>
				            	<li><a class="dropdown-item" href="/movie/movieList?mvState=N">상영예정작</a></li>
				            	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<!-- 관리자 기능!! - 영화 관리 -->
				              	<li><a class="dropdown-item" href="">Something else here</a></li>
				            </ul>
				      	</li>
				          
				        <li class="nav-item dropdown">
				           	<a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				              	TICKET
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				            	<li><a class="dropdown-item" href="/reservation/goReserve">예매하기</a></li>
				             	<li><a class="dropdown-item" href="#">Another action</a></li>
				            	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<li><a class="dropdown-item" href="#">Something else here</a></li>
				           	</ul>
				     	</li>
				          
				        <li class="nav-item dropdown">
				           	<a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            	EVENT
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
				          
				        <li class="nav-item dropdown">
				           	<a class="nav-link dropdown-toggle" href="/board/boardList" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				              	COMMUNITY
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
				              	<li><a class="dropdown-item" href="/board/boardList">커뮤니티 게시판</a></li>
				              	<li><a class="dropdown-item" href="#">Another action</a></li>
				              	<li>
				                	<hr class="dropdown-divider">
				              	</li>
				              	<li><a class="dropdown-item" href="#">Something else here</a></li>
				            </ul>
				      	</li>
			      		<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
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
			      		</c:if>
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
			                  	<input type="text" name="id" class="form-control" id="inputId" placeholder="id" required>
			                  	<label for="floatingInput" style="color: #a4b0be">아이디</label>
			               	</div>
			               	<div class="form-floating">
			                  	<input type="password" name="pw" class="form-control" id="inputPw" placeholder="Password" required>
			                  	<label for="floatingPassword" style="color: #a4b0be">비밀번호</label>
			               	</div>
			               	<div class="col-12 d-grid mt-4">
			                  	<input type="submit" class="btn" value="로그인">
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
		            	<a class="nav-link active" aria-current="page" href="#">Home</a>
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















