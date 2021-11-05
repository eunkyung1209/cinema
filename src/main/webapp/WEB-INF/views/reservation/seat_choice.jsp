<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row bodyDiv justify-content-center">
	<div class="col-12">
		
		
		<!-- 예매하기 영역 -->
		<div class="row justify-content-center">
			<div class="col-10 reserveDiv" >
				<div class="row justify-content-center">
				
					<!-- 예매순서 -->
					<div class="col-1 reserveOrder" >
					
						<div class="row reserveOrderDiv" style="background-color: orange;">
							<div class="col-12">
								<div class="m-1" >01</div> 
								<div>상영시간</div> 
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">02</div> 
								<div>좌석선택</div>
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">03</div>
								<div>결제하기</div>
							</div>
						</div>
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1">04</div>
								<div>결제완료</div>
							</div>
						</div>
						
					</div>
					
					
					<!-- 영화관 선택 -->
					<div class="col-2 reserveArea" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleArea" >
								선택한 영화관
							</div>
						</div>
						<!-- 영화관 목록 -->
						<div class="row justify-content-center reserveAreaList">
							<div class="col-12 align-middle" >
								
								시트시트
								
							</div>
						</div>
					
					</div>
					
					<!-- 영화 선택 -->
					<div class="col-3 reserveMovie" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleMovie" >
								선택한 영화
							</div>
						</div>
						
						<!-- 영화목록 -->
						<div class="row justify-content-center reserveMovieList" id="movieTimeMovie">
							
						</div>
						
						
					</div>
					
					
					<!-- 상영시간 선택 -->
					<div class="col-6 reservemMovieTime" >
						<div class="row justify-content-center reserveTitle" >
							<div class="col-12 reserveTitleMovieTime" >
								
							</div>
						</div>
						
						<!-- 달력이 들어갈 공간 -->
						<div class="row">
							<div class="col-12 movieCalDiv" >
								<div class="row">
									<div class="movieCal col-6" id="datepicker" onclick="movieCalClick();">
									
									</div> 
									
									<div class="col-6" >
									</div>
								</div> 
								
								
								
							</div>
						</div>
							
						<!-- 상영시간 목록 -->
						<div class="row justify-content-center movieTimeList" >
							<div class="col-12" >
								
								<!-- 상영할 영화 제목 -->
								<div class="row">
									<div class="col-12">
									
									</div>
								</div>
								
								<!-- 상영시간이 뜨는 버튼 조회 -->
								<div class="row" id="movieTimeBtn" >
									
									  
								</div>	
							</div>
						</div>
						
					</div>
				
				
				
				
				</div>
			</div>
		</div>
	
	
	</div>
</div>


</body>
</html>