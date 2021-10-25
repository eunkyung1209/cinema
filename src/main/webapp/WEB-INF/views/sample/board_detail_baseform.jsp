<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bodyDiv{
	margin-top: 100px;
}

/* 상세보기 표 */
.boardDetail{
	margin: 0 auto;
	width: 100%;
	border-bottom: 1px solid #c9c9c8;
	border-top: 1px solid #c9c9c8;
}
 
tr, td{
height: 50px;
vertical-align: middle;
padding: 10px;

}

/* 제목 Tr */
.titleTr{
height: 10%; 
border-bottom: 1px solid #c9c9c8;
background-color: #f2f2f2
}

/* 본인 또는 관리자에게만 보이는 수정, 삭제 버튼 */
.correct{
	text-align: right;
}


</style>

</head>

<body>
<div class="row bodyDiv">
	<div class="col-12">
	
	<!-- 페이지 머릿말 -->
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="col-3 subjectDiv">
					<h5>페이지명</h5>
				</div>
			</div>
		</div>
	

		<!-- 상세보기 정보를 불러오는 테이블 입니다. 테이블명 : boardDetail -->
		<div class="row justify-content-center" >
			<div class="col-8 " >
				<table class="boardDetail" >
					<colgroup>
						<col width="*">
						<col width="20%">
						<col width="25%">
					</colgroup>
				
					<tr class="titleTr">
						<td colspan="2" >
						 ${customerBoard.isRead} 제목입니다.
						</td>	
						
						 <!-- 본인 또는 관리자에게만 보이는 버튼 -->
						<td class="correct" >
						<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.writer eq writer}">
							<li class="nav-item dropdown">
					           	<span class="nav-link dropdown-toggle" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									
					            </span>
					            <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
					              	<li><a class="dropdown-item" href="#">글 수정</a></li>
					              	<li><a class="dropdown-item" href="#">글 삭제</a></li>
					            </ul>
					     	</li>
							</c:if>
						</td>
						 	
						 
						 
					</tr>
					<tr style="height: 10%; text-align: right;" >
						<td>작성자 |  ${customerBoard.isRead} 양정훈 </td>
						
						<td>조회수 | ${customerBoard.isRead } 2</td>
						<td>등록일 | ${customerBoard.createDate} 2021-10-22</td>
					</tr>
					<tr>
						<td colspan="3">${customerBoard.content}
							<!-- 느낌 보라고 긴글 복사해왔어요 삭제하고 쓰시면 됩니다. -->
							안녕하세요.
							메가박스 안성스타필드지점 입니다. <br>
							스타필드 운영시간 外 영화 관람 시 아래와 같이 주차 및 도보 출입구 안내드립니다.<br>
							<br>
							# 스타필드 안성 운영시간 <br>
							- 10:00 ~ 22:00<br>
							- 10:00 ~ 21:00(사회적 거리두기 방역수칙 4단계 적용 시)<br>
							<br>
							1. 스타필드 운영시간 外 영화 관람 시<br>
							1) 자차 이용 시<br>
							- 본관 지상 주차장(서측진입로 - 마트킹 맞은편)만 이용 가능합니다.<br>
							- 서동대로에서 진입 > 좌회전 > 서측 진입로(마트킹 맞은편) > 본관 주차장 진입 > <br>
							  지상 1층 주차장 F/G 6~8번 기둥 부근에 주차 후 근처 출입구 이용(1번 HALL 출입구)<br>
							- 영화 관람 후 본관 지상 주차창 내부를 통하여 출차 바랍니다.<br>
							- 2.1M 이상 차량으로 방문 시 서측 진입로 야외 주차장 주차 후 <br>
							  출차 전 직원에게 문의바랍니다. (본관 지상 주차장 높이 제한 : 2.1M)<br>
							- 스타필드 주차안내(보안실) : 031-8092-1112<br>
							<br>
							2) 도보 이용 시<br>
							- 본관 지상 주차장 내 1층 출입구만 이용 가능 합니다.<br>
							- 서동대로에서 진입 > 좌회전 > 서측진입로(마트킹 맞은편)을 지나 >본관 지상주차장 진입 > 지상 1층 F/G 6~8번 기둥 근처 출입구 이용(1번 HALL 출입구)<br>
							- 도보 이용하여 방문 및 출입 시 차량에 주의하시길 바랍니다.<br>
							<br>
							2. 스타필드 운영시간 內 영화 관람 시<br>
							- 본관 지하 주차장 F1~12, P1~10 기둥 근처에 주차하신 후 엘리베이터를 이용하시면<br>
							  빠르게 이동 가능합니다.<br>
							<br>
							감사합니다.<br>
							메가박스 안성스타필드지점 올림.<br>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="height: 30px;"></div>
		
		<!-- 기본 버튼 클래스명: common_btn -->
		<div class="row justify-content-center">
			<div class="col-8 text-center"  >
				 <input class="common_btn" type="button" value="목록으로"  onclick="location.href=#;">
				
				
			
			</div>
		</div>
	
		
	
	</div>
</div>
</body>
</html>