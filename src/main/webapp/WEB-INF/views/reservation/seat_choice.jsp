<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.bodyDiv{
 text-align: center;
 padding: 0px;
}

/* 예매하기 영역 */
.reserveDiv{
	height: 800px;
	margin: 0 auto;
	margin: 20px;
	border: 1px solid gray;
}

/* 예매하기 순서 */
.reserveOrder{
	border-right: 1px solid gray; 

}
.reserveOrderDiv{
	height: 200px;	
	padding-top: 80px;
}

/* 선택한 타이틀 */
.reserveTitle{
	height: 200px;
	background-color: #f2f2f2;
	padding-top: 20px;
	border-bottom: 1px solid gray;
}

ul{
	padding: 10px;
}

.reserveTitlePeople{
	padding-top: 30px;
}

/* 좌석 하나하나 선택 */
.seat-wrapper{
	margin: 3px;
}


/*  */
.wrap {
    width: 100%;
    overflow: hidden;
}

ul, ol {
    list-style: none;
    float: left;
    overflow: hidden;
    padding: 0;
    margin: 0;
}

.colsHead {
    width: 100%;
    padding-left: 30px;
}
.rowsHead {
    width: 30px;
}

li {
    width: 30px;
    height: 30px;
    border: 1px;
    text-align: center;
    line-height: 30px;
}

.seat li {
    float: left;
    border: 1px solid skyblue;
}

.colsHead li {
    float: left;
    border: 1px solid white;
}
.rowsHead li {
    border: 1px solid white;
}

.reserve {
    background-color: orange;
}

.seat .ui-selecting {
    background: #FECA40;
}
.seat .ui-selected {
    background: #F39814; color: white;
}



</style>


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
					
						<div class="row reserveOrderDiv">
							<div class="col-12">
								<div class="m-1" >01</div> 
								<div>상영시간</div> 
							</div>
						</div>
						<div class="row reserveOrderDiv" style="background-color: orange;">
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
					
					
					<!-- 메인내용 선택 -->
					<div class="col-11 reserveContent" >
						<!-- 타이틀 -->
						<div class="row justify-content-center reserveTitle">
							<div class="col-12 reserveTitleMtInfo" >
								<div class="row">
									<div class="col-2 reserveTitleMovitTimeInfo" > 
										상영 시간 정보
									</div>
									
									<div class="col-10 reserveTitlePeople" >
										인원 수 
										<input type="number" value="0" min="0" max="20" required>
									</div>
									
									
								</div>
								
								
								
							</div>
						</div>
						
						<div class="row justify-content-center">
							<div class="col-12 seatContent">
								
								<div style="height: 50px;"></div>
								<img alt="" src="/resources/images/reservation/스크린.png">
								<div style="height: 50px;"></div>
								
								
								<fieldset>
								    <legend>좌석 설정</legend>
								    <p><label>행 : <input type="number" name="cols" value="4" /></label></p>
								    <p><label>열 : <input type="number" name="rows" value="4" /></label></p>
								</fieldset>
								
								<hr />
								
								<fieldset>
								    <legend>선택한 좌석명</legend>
								    <p class="result">없음</p>
								</fieldset>
								
								<div class="wrap">
								    <ul class="colsHead"></ul>
								    <ul class="rowsHead"></ul>
								    <ol class="seat"></ol>
								</div>
								
								<div id="count">
								    <p>선택한 좌석수 : <span id="wordcount">0</span>개</p>
								</div>
								
								<button id="reset"> 다시 선택하기 </button>
								
								
								
								
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