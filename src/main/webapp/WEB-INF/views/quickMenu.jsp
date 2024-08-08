<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>푸터</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
	:root 
	{
	  /* 컬러 모음 */
	  --main-color:#FFA500;
	  --color-black: #111;
	  --color-white: #fff;
	  --color-gray: #787878;
	  --input-gray: #e5e5ec;
	  --button-gray: #f7f7f7;
	  --border-color-gray: #dadada;
	  --font-size32: 32px;
	  --font-size24: 24px;
	  --font-size16: 16px;
	  --font-size14: 14px;
	  --font-size12: 12px;
		}

	/* Footer */
	.quickMenu
	{
		position: fixed;
	    bottom: 10%;
	    right: 40px;
	    padding: 0 8px;
	    border-radius: 16px;
	    /* transform: translateY(-50%); */
	    width: 54px;
	    z-index: 9;
	}
	
	.quickMenu ul 
	{
		gap: 30px 0;
		display: flex;
		flex-direction: column;
	}
	
	.quickMenuCon 
	{
		border-radius: 50%;
		width: 52px;
		height: 52px;
		background: #fff;
		display: flex;
		justify-content: center;
		align-items: center;
		box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
		cursor:pointer;
	}
	
	.quickMenuCon:hover
	{
		background: var(--main-color);
	}
	
	.quickMenuCon:hover > .menuCon > .icon 
	{
		color: #fff;
	}
	
	.quickMenuCon:hover > .menuCon > .text 
	{
		display: block;
	}
	
	.quickMenuCon.scrollTop
	{
		background: #772409;
		margin-top: 10px;
	}
	
	.quickMenuCon.scrollTop a 
	{
		color: #fff;
	}
	
	.quickMenuCon:last-child 
	{
		border:0;
	}
	
	a.menuCon 
	{
		display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	    color: #111;
		position: relative;
	}
	
	a.menuCon .icon 
	{
		font-size: 20px;
		font-weight: 300 !important;
	}
	
	a.menuCon .text 
	{
		font-size: 12px;
		font-weight: 300;
		position: absolute;
		left: -130px;
		background: #fff;
		color: #111;
		min-width: 80px;
		padding: 10px;
		text-align: center;
		border-radius: 6px;
		box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
		display: none;
	}
</style>	
</head>
<body>
	<div class="quickMenu">
<!--	<div class="quickMenu">-->
		<ul>
			<li class="quickMenuCon">
				<a class="menuCon" href="cardPageList">
					<span class="icon">
						<i class="fa-regular fa-address-card"></i>
					</span>
					<span class="text">채용</span>
				</a>
			</li>
			<li class="quickMenuCon">
				<a class="menuCon" href="boardCommunity">
					<span class="icon">
						<i class="fa-regular fa-comments"></i>
					</span>
					<span class="text">커뮤니티</span>
				</a>
			</li>
			<li class="quickMenuCon">
				<a class="menuCon" href="dailyCS">
					<span class="icon">
						<i class="fa-solid fa-code"></i>
					</span>
					<span class="text">Daily CS</span>
				</a>
			</li>
			<li class="quickMenuCon">
				<a class="menuCon" href="">
					<span class="icon">
						<i class="fa-solid fa-volume-high"></i>
					</span>
					<span class="text">공지사항</span>
				</a>
			</li>	
			<li class="quickMenuCon scrollTop">
				<a class="menuCon">
					<span class="icon">
						<i class="fa-solid fa-arrow-up"></i>
					</span>
				</a>
			</li>							
		</ul>
	</div>	
</body>
</html>
<script>
$(document).ready(function() {

	$('.scrollTop').on('click', function() {	
		$(window).scrollTop(0);	
	});
	
});
</script>