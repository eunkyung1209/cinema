<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<!-- 태그 초기화 작업 -->
<link rel="stylesheet" href="/resources/common/reset.css?ver=14">
<!-- 제이쿼리 문법을 로딩 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 사용을 위해 css, js를 로딩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<!-- <script src="/resources/event/js/event_Date.js?ver=2"></script> -->
<!-- 슬라이드 -->
<link  rel="stylesheet"  href="https://unpkg.com/swiper@7/swiper-bundle.min.css?ver=1" />

<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<style type="text/css">
.aaa{
	background-color: aqua;
}
.container-fluid{
	/* width: 90%; */
	margin-top: 20px;
	margin-bottom: 20px;
}
.menuBodyDiv{
	/* height: 100px; */
	padding-left: 8%;
	padding-right: 8%;
}
body {
  line-height: 1;
  font-family: 'S-CoreDream-5Medium'; 
  font-size: 14px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col">
			<tiles:insertAttribute name="menu"/>
		</div>
	</div>
	<div class="row" style="padding-top: 10px;">
		<div class="col">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<tiles:insertAttribute name="foot"/>
		</div>
	</div>
</div>
</body>
</html>

















