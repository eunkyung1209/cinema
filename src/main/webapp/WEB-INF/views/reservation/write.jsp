<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/reserve.css">
    <link rel="stylesheet" href="css/header.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    
    
    <style>
    * {
    font-size: 11px;
}

body {
    background-color: #FDFCF0;
}


/* header */

.header-nav-wrapper {
    background: url(../images/bg_header.gif) repeat-x 0 0;
    background-position: center;
    background-size: contain;
    height: 120px;
    padding-top: 4px;
}

.header-nav-container {
    position: fixed;
}

.header {
    display: flex;
    justify-content: space-between;
    padding-left: 40px;
    padding-right: 150px;
}

.header-inner {
    display: flex;
}

.header-inner>div {
    border-right: 1px solid #DDDDDD;
    margin-left: 8px;
    padding-right: 4px;
}


/* //header */


/* nav */

.nav-line {
    background-color: red;
    border-radius: 50px;
    height: 5px;
    /* background-image: linear-gradient(to right, white 33%, rgba(255, 255, 255, 0) 0%);
  background-position: bottom;
  background-size: 15px 1px;
  background-repeat: repeat-x; */
}

.nav-wrapper {
    /* background: url(../images/bg_header.gif) repeat-x 0 0; */
    /* width: 100%;*/
    height: 94px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.nav-content {
    padding-top: 15px;
}

.movieLogo-wrapper {
    text-align: center;
}

.cgvLogo {
    width: 120px;
    margin-left: 150px;
    /* margin-right: -40px; */
}

.cgvMovie {
    width: auto;
    height: 28px;
}

.nav-inner {
    display: flex;
    /* margin-left: -250px; */
    margin-left: 150px;
    margin-right: auto;
    align-items: center;
    padding-bottom: 15px;
}

.nav-inner>div>button {
    padding-top: 5px;
    font-size: 14px;
    font-weight: bold;
    margin-left: 15px;
}

.search-wrapper {
    margin-left: 70px;
    height: 20px;
}

.search-wrapper>input {
    width: 100px;
    height: 20px;
}

.searchButton {
    margin: 0 !important;
    padding: 2px !important;
    background-color: red;
    color: white;
    width: 30px;
    height: 100%;
    font-size: 10px !important;
}


/* content */

.reserve-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    height: 800px;
    /* border: 1px solid #dddddd; */
}

.reserve-container>div {
    border: 1px solid #dddddd;
}

.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.movie-part {
    width: 284px;
}

.theater-part {
    width: 264px;
}

.day-part {
    width: 91px;
}

.time-part {
    width: 384px;
}

.sort-wrapper {
    margin: 10px 6px 6px 10px;
    /* padding: 3px; */
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}

.sort-wrapper>div {
    padding: 3px;
}

.sort-wrapper>div:hover {
    border-bottom: 1px solid #111111;
}

.sort-selected {
    font-weight: bold;
    border-bottom: 1px solid #111111;
}

.sort-korean {
    margin-left: 6px;
}

.reserve-date {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 770px;
    overflow: scroll;
    overflow-x: hidden;
}

.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
}

.movie-week-of-day {
    margin-left: 5px;
    font-size: 10px;
    width: 12px;
    height: 22px;
    line-height: 22px;
}

.movie-day {
    text-align: center;
    width: 34px;
    height: 22px;
    font-size: 17px;
    font-weight: bold;
}

.saturday {
    color: #31597E;
    font-weight: bold;
}

.sunday {
    color: #AF2D2D;
    font-weight: bold;
}

.movie-date-wrapper-active {
    background-color: #333333;
}

.movie-date-wrapper-active>* {
    color: white;
}
    </style>
</head>

<body>
    
    <h2>이메일 보내기</h2>
<form method="post" action="/email/send"> 
<!-- post방식으로 자료를 컨트롤러로 보냄 -->
 
발신자 이름 : <input name="senderName"><br>
발신자 이메일 : <input name="senderMail"><br>
수신자 이메일 : <input name="receiveMail"><br>
제목 : <input name="subject"><br>
내용 : <textarea rows="5" cols="80" name="message"></textarea>
	<!-- <img alt="" src="/resources/images/reservation/이메일.png" name="message"> -->
<br>
<input type="submit" value="전송">
</form>
<span style="color:red;">${message}</span>
 
    
</body>

</html>