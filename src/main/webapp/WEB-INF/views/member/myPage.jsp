<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 스크립트 연결 -->

<script type="text/javascript" src="/resources/member/js/member_delete.js?ver=24"></script>

<style type="text/css">


/* 작성테이블 */
.writeTable{
margin: 0 auto;
width: 75%;
border-bottom: solid 1px #c9c9c8;
height: 500px;
}

.td:first-child{
	text-align: center;
	/* background-color: #f2f2f2; */
}
tr{
	/* border-bottom: 1px solid #c9c9c8; */
}

td{
	vertical-align: middle;
	padding: 3px;
	padding-left: 16px;
	/* border: 1px solid black; */
	text-align: left;
}

.mypage tr > td:first-child{
	padding-left: 0;
	padding-right: 30px;
}

input[type="password"], input[type="email"] {
	width: 68%;

}
select {
	width: 30%; 
}

/* 필수입력 빨간 별 */
.redStar{
	color: red;
} 

/* *필수입력 문장  */
.needInput{
	font-size: 13px;
	margin-left: 76%;
}
 

/*검색 버튼 기본폼 */
.common_btn{
	color: white;
	width: 80px;
	font-size: 11px;
}
.common_btn:hover{
	font-size: 11px;
	color: white;
	width: 80px;
}
.agree{
	background-color: white;
	width: 90%;
	margin: 0 auto;
}


/* 사진 글자 */
			.jb-wrap {
				width: 67%;
				margin: 0px auto;
				position: relative;
			}
			.jb-wrap img {
				width: 100%;
				vertical-align: middle;
			}
			.jb-text {
				position: absolute;
				top: 0px;
				width: 100%;
				height: 100%;
			}
			.jb-text-table {
				display: table;
				width: 100%;
				height: 100%;
			}
			.jb-text-table-row {
				display: table-row;
			}
			.jb-text-table-cell {
				display: table-cell;
				vertical-align: middle;
			}
			.memeber_name {
				margin: 0px 187px;
				margin-bottom: -37px;
				padding: 2px;
				width: 130px;
				text-align: right;
			}
			.memeber_id{
				margin: 0px 275px;
				margin-bottom: 1000px;
				padding: 2px;
				text-align: right;
				width: 130px;
			}

</style>


</head>
<body>

		<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>${memberDetail.nickName}님의 마이페이지</h5>
				</div>
			</div>
		</div>
	
		<!-- 공간 -->
		<div style="height: 30px;"></div>


<!-- <form class="row g-3" action="/member/join" method="post" id="joinForm"> -->
<div class="row bodyDiv" >
	<div class="col-12">
	
		<!-- 글 작성 테이블 입니다. 테이블 클래스명 : writeTable 수정 후 사용바랍니다.-->
		<div class="row justify-content-center align-middle">
			
	<!-- 	<div class="row justify-content-center" >
			<div class="col-8" style="text-align: center;" >
				<div><img alt="" height="420px;" src="/resources/images/member/돼지저금통.PNG"><span></span> 이름</div>
				<div>
					이름
				</div>
			</div>
		</div> - -->
				
		<div class="jb-wrap">
			<div class="jb-image"><img alt="" width="700px;" height="420px;" src="/resources/images/member/돼지주황.PNG"></div>
			<div class="jb-text"> 
				<div class="jb-text-table">
					<div class="jb-text-table-row">
						<div class="jb-text-table-cell">
						
							<div class="memeber_name" style="font-size: 25px; margin-top: 10px;">
								<!-- <p class="memeber_name" style="font-size: 25px;"> -->
								
								
								<table class="pig" style="margin-left: 35px; margin-top:-6px;">
									<tr>
										<td colspan="4" style="width: 80px; background-color: none; "></td>
										
										<!-- 이름 / 아이디 -->
										<td colspan="10" style="width: 80px; font-size:11px; height: 80px; padding-top: 50px;">
											<span style="font-size:20px;">&nbsp;&nbsp;&nbsp;${memberDetail.name }님 </span>
											<span>&nbsp;&nbsp;${memberDetail.id }</span>
										</td>
										
										
										<td style="width: 80px; font-size:20px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										
										
										
									</tr>
									<tr>
									<td colspan="4" style="width: 80px; "></td>
									
										<!-- 등급  -->
										<td colspan="10" style="width: 80px; font-size:15px; height: 82px; padding-bottom: 56px;">
											&nbsp;&nbsp;&nbsp;&nbsp;고객님은 
											<c:if test="${memberDetail.point >= 0 and memberDetail.point <= 100 }">
											 	<span style="color: green; font-weight: bold;">그린</span>
											</c:if>
											<c:if test="${smemberDetail.point >= 101 and memberDetail.point <= 200 }">
											 	<span style="color: gray; font-weight: bold;">실버</span>
											</c:if>
											<c:if test="${memberDetail.point >= 201 and memberDetail.point <= 300 }">
											 	<span style="color: yellow; font-weight: bold;">골드</span>
											</c:if>
											<c:if test="${memberDetail.point >= 301 and memberDetail.point <= 500 }">
											 	<span style="color: aqua; font-weight: bold;">다이아</span>
											</c:if>
											<c:if test="${memberDetail.point >= 501}">
											 	<span style="color: #ed7d31 font-weight: bold;">VVIP</span>
											 </c:if>
											입니다.
										
										</td>
										
										<td style="width: 80px; font-size:15px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										
										
									</tr>
									
									<tr>
										<td style="width: 80px; font-size:10px; height: 80px;"></td>
										
										<!-- 포인트  -->
										<td colspan="9" style="width: 80px; font-size:15px; height: 13px; padding-top: 33px;s">
											${memberDetail.point }
											<span style="font-size: 11px">point</span>
										</td>
										
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										
										<!-- 적립금 돼지저금통 -->
										<td colspan="8" style="width: 90px; font-size:23px; height: 13px; font-weight: bold; padding-bottom: 42px; padding-left: 40px;">
											&nbsp;&nbsp;&nbsp;&nbsp;${memberDetail.savedMoney } $
										</td>
										
		
									</tr>
									<tr>
										<td style="width: 80px; font-size:10px; height: 80px;"></td>
										
										<!-- 마이시네마 -->
										<td colspan="9" style="width: 80px; font-size:15px; height: 13px; padding-top: 25px;">
											${memberDetail.myCinema }
										</td>
										
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td style="width: 80px; font-size:14px; height: 13px;"></td>
										<td colspan="5" style="width: 80px; font-size:14px; height: 13px;"></td>
										
									</tr>
									<tr>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
										<td style="width: 80px; font-size:0.1px; height: 0.1px;"></td>
		
									
										
										
									</tr>
									
									
		
								</table>
								<!-- </p> -->
							</div>
							
							
							
							
							
						</div>
					</div>
				</div>
				
						<%-- <div class="jb-text-table-cell">
							<p class="memeber_id" style="font-size: 15px;">${sessionScope.loginInfo.id }</p>
						</div> --%>
						
			</div>
		</div>				
			<div style="height: 30px;"></div>
			
			<div class="row justify-content-center">
				<div class="col-11">
				<table style="margin: 0 auto;" class="mypage">
				
					<tr>
						<!-- 메뉴 -->
						<td style="width: 225px; margin-right: 500px;">
						<!-- 	<img alt="" src="/resources/images/member/마이페이지-작은메뉴.PNG" style="width: 230px;"> -->
							 <img alt="" src="/resources/images/member/mypage_메뉴.PNG" style="width: 230px;">
						</td>
						
						<!-- 마이페이지 긴메뉴 -->
						<td rowspan="2" style="width: 784px; margin-right: 500px; height: 40px; padding-left: 0px;">
							<img alt="" src="/resources/images/member/마이페이지-긴메뉴.PNG" style="width: 783px;">
						</td>
					</tr>
					
					<tr>
						<!-- 1번 -->
						<!-- 메뉴 -->
						<td style="width: 225px; margin-right: 500px;" rowspan="3">
							<!-- 제목들 전체 -->
							<div style="padding-left: 35px; padding-bottom: 5px;">
							<!-- 대제목 -->
								<div style="font-size: 17px; padding-bottom: 30px; font-weight: bold;  margin-top: 15px;">
									나의 예매내역
								</div>
								<!-- 소제목 -->
								<div style="font-size: 14px; text-align:left; padding-left: 20px;">
									<a onclick="">예매내역 확인하기</a>
								</div>
								
							</div>
								<!-- 실선 -->
								<div style="border-bottom: 3px solid black; padding-top: 20px; border-bottom-color: gray; width: 204px; text-align: right; float: right; margin-right: 6px; margin-bottom: 25px;""></div>
								
								
							<!-- 2번 -->
							<!-- 제목들 전체 -->
							<div style="padding-left: 35px; padding-bottom: 5px;">
							<!-- 대제목 -->
								<div style="font-size: 17px; padding-bottom: 30px; font-weight: bold; margin-top: 15px;">
									관람권/쿠폰 관리
								</div>
								<!-- 소제목 -->
								<div style="font-size: 14px; text-align:left; padding-left: 20px;">
									<a onclick="">OISONE 영화관람권</a>
									<br>
									<br>
									<a onclick="">OISONE 할인쿠폰</a>
									<br>
									<br>
									<a onclick="">4DX RED CARD</a>
									<br>
									<br>
									<a onclick="">노블레스 BLACK 카드</a>
									<br>
									<br>
									<a onclick="">OISONE 무비패스카드</a>
									<br>
									<br>
									<a onclick="">OISONE 기프트카드</a>
									<br>
									<br>
									<a onclick="">OISONE 포토티켓 패스카드</a>
									<br>
									<br>
									<a onclick="">제휴카드 쿠폰</a>
									<br>
									<br>
									<a onclick="">간편결제/카드사 할인쿠폰</a>
								</div>
								
							</div>
								<!-- 실선 -->
								<div style="border-bottom: 3px solid black; padding-top: 20px; border-bottom-color: gray; width: 204px; text-align: right; float: right; margin-right: 6px; margin-bottom: 25px;""></div>
								
								
							<!-- 3번 -->
								<!-- 제목들 전체 -->
								<div style="padding-left: 35px; padding-bottom: 5px;">
								<!-- 대제목 -->
									<div style="font-size: 17px; padding-bottom: 30px; font-weight: bold; margin-top: 15px;">
										OISONE 포인트
									</div>
									<!-- 소제목 -->
									<div style="font-size: 14px; text-align:left; padding-left: 20px;">
										<a onclick="">포인트 적립/사용안내</a>
										<br>
										<br>
										<a onclick="">포인트 적립/사용내역</a>
									</div>
									
								</div>
									<!-- 실선 -->
									<div style="border-bottom: 3px solid black; padding-top: 20px; border-bottom-color: gray; width: 204px; text-align: right; float: right; margin-right: 6px; margin-bottom: 25px;"></div>
							
								
								<!-- 제목들 전체 -->
								<div style="padding-left: 35px; padding-bottom: 5px;">
								<!-- 대제목 -->
									<div style="font-size: 17px; padding-bottom: 30px; font-weight: bold; margin-top: 15px;">
										회원정보
									</div>
									<!-- 소제목 -->
									<div style="font-size: 14px; text-align:left; padding-left: 20px;">
										<a href="/member/memberDetail?id=${sessionScope.loginInfo.id }">개인정보 상세보기</a>
										<br>
										<br>
										<a href="/member/updateMyPage?id=${sessionScope.loginInfo.id }">개인정보 수정</a>
										
										
										<br>
										<br>
										<a onclick="">E-mail/SMS 수신설정</a>
										<br>
										<br>
											<a href="/member/updatePW?id=${sessionScope.loginInfo.id }">비밀번호 변경</a>
										<br>
										<br>
										<input type="hidden" value="${sessionScope.loginInfo.id }" class="id"> 
										<a onclick="deleteMember();">회원탈퇴</a>
									</div>
									
								</div>
									<!-- 실선 -->
								
							
						</td>

					</tr>
					
					<tr>
						<!-- 나의 큐엔에이 -->
						<td style="padding-left: 2px; width: 784px; margin-right: 500px; height: 100px; padding-bottom: 10px;">
							
							<!-- 테이블 -->
							
							<table style="width: 780px; height: 100px; border: 2.2px solid black;">
							
								<caption align="top">
									<span style="color: black; font-size: 18px;">
										나의 최근 Q/A 내역
										
										<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16" style="padding-bottom: 2px;">
										  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
										</svg>
									</span>
								</caption>
							
								<colgroup>
									<col width="5%">
									<col width="20%">
									<col width="*%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
								    <tr style="text-align: center; height: 40px; background-color: gray; color: white; ">
								      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">NO</th>
								      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">글 분류</th>
								      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">제목</th>
								      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">작성자</th>
								      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">등록일</th>
								    </tr>
								  </thead>
								  
								  <c:choose>
								  	<c:when test="${empty customerBoardList}">
								  		<tr style="text-align: center; padding-left: 0px;">
								  			<td class="align-middle" style="text-align: center; padding-left: 0px;" colspan="5">
								  				등록된 게시물이 없습니다.
								  			</td>
								  		</tr>
								  	</c:when>
								  	
								  	<c:otherwise>
								  		<c:forEach items="${customerBoardList}" var="customerBoard" varStatus="status">
										  <tbody>
											<tr style="text-align: center; height: 34px;">
										      <th scope="row" class="align-middle">${status.count }</th>
											  <td style="text-align: center;">
											  	<c:if test="${customerBoard.groupCode eq 'GROUP_001'}">
													기타
												</c:if>
												<c:if test="${customerBoard.groupCode eq 'GROUP_002'}">
													시설물 문의
												</c:if>
												<c:if test="${customerBoard.groupCode eq 'GROUP_003'}">
													영화 문의
												</c:if>
												<c:if test="${customerBoard.groupCode eq 'GROUP_004'}">
													결제 문의
												</c:if>
												<c:if test="${customerBoard.groupCode eq 'GROUP_005'}">
													분실물
												</c:if>
											  </td>   
										      <td class="align-middle" style="text-align: center; padding-left: 0px;"><a href="/customer/selectCustomerBoardPw?customerCode=${customerBoard.customerCode }&secretNumber=${customerBoard.secretNumber }">${customerBoard.title }</a> </td>
										      <td class="align-middle" style="text-align: center; padding-left: 0px;">${customerBoard.writer }</td>
										      <td class="align-middle" style="text-align: center; padding-left: 0px;">${customerBoard.createDate } </td>
										    </tr>
										   </tbody>
										</c:forEach>
								  	</c:otherwise>
								  </c:choose>
								  
								</table>
						
							</td>
						</tr>
					
					
					
					
						<!-- 나의 커뮤니티 -->
						<tr>
							<!-- 나의 커뮤니티 -->
							<td style="padding-left: 2px; width: 784px; margin-right: 500px; height: 100px; padding-bottom: 100px; padding-top: 30px;">
							
								<table style="width: 780px; height: 100px; border: 2.2px solid black;">
								
								<caption align="top">
									<span style="color: black; font-size: 18px;">
										나의 최근 커뮤니티 내역
										
										
										<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16" style="padding-bottom: 2px;">
										  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
										</svg>
									</span>
								</caption>
									
									<colgroup>
										<col width="5%">
										<col width="*">
										<col width="20%">
										<col width="20%">
										<col width="10%">
									</colgroup>
									<thead>
									    <tr style="text-align: center; height: 40px; background-color: gray; color: white; ">
									      
									      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;" >NO</th>
									      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">제목</th>
									      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">작성자</th>
									      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">등록일</th>
									      <th scope="col" class="align-middle" style="text-align: center; padding-left: 0px;">조회수</th>
									    </tr>
									  </thead>
									  
									  <tbody>
										<c:choose>
											<c:when test="${empty commuList }">
												<tr style="text-align: center;">
													<td class="align-middle" style="text-align: center; padding-left: 0px;" colspan="5">등록된 게시글이 없습니다.</td>
												</tr>
											</c:when>
							
											<c:otherwise>
												<c:forEach items="${commuList }" var="communityInfo" varStatus="status">
													<tbody>
														<%-- <c:if test="${sessionScope.loginInfo.nickName} eq ${communityVO.writer }"> --%>
														<tr style="text-align: center; height: 34px;">
															<th scope="row" class="align-middle">${status.count }</th>
															
															<c:if test="${communityInfo.isSecret eq 'Y'}">
																<td class="align-middle" style="text-align: center; padding-left: 0px;">
																	<img alt="" width="10px" src="/resources/images/community/자물쇠.PNG">
																	<a href="/community/selectCommuPw?commuCode=${communityInfo.commuCode }&secret=${communityInfo.secret }">${communityInfo.title }</a>
																 </td>
															</c:if>
															<c:if test="${communityInfo.isSecret eq 'N'}">
																<td class="align-middle" style="text-align: center; padding-left: 0px;">
																	<a href="/community/selectCommuDetail?commuCode=${communityInfo.commuCode }">${communityInfo.title }</a>
																 </td>
															</c:if>
															
															<td class="align-middle" style="text-align: center; padding-left: 0px;">${communityInfo.writer }</td>
															<td class="align-middle" style="text-align: center; padding-left: 0px;">${communityInfo.createDate }</td>
															<td class="align-middle" style="text-align: center; padding-left: 0px;">${communityInfo.readCnt }</td>
														</tr>
														<%-- </c:if> --%>
													</tbody>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										</tbody>
										
									</table>
							
							
								</td>
						
							</tr>
	

					

				</table>			
				</div>
			</div>
				
				
				
				
				
				
				
				
				



				<div style="height: 80px;"></div>
				
				<!-- 기본 버튼 클래스명: common_btn -->
				<div class="row justify-content-center">
					<div class="col-8" style="text-align: center;">
						<input class="common_btn" type="button" value="뒤로가기" onclick="location.href='/movie/mainPage';">
						
						<%-- <input class="common_btn" type="button" value="내정보수정" onclick="location.href='updateMyPage?id=${memberInfo.id }';"> --%>
						
						<%-- <input type="hidden" value="${sessionScope.loginInfo.id }" class="id"> 
						<input class="common_btn" type="button" value="회원탈퇴" onclick="deleteMember();"> --%>
						
					</div>
				</div>
			</div>
	</div>
</div>
<!-- </form> -->

</body>
</html>