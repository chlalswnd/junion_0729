<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 목록페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcementsTermsDetailView.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->

</head>

<body>
	<%@ include file="header.jsp" %>
	<!-- 섹션-->
	        <section> 
	            <div class="wrap">     
	                <div class="board">


	                    <div class="titlebox">
	                        <h5 class="title">
	                            ${boardDetailView.board_title}
	                        </h5>
	                    </div> 

	                    <div class="lastline">
	                        <div class="line1">
	                            <div class="datebox">
	                                <h5 class="date">
										${boardDetailView.create_date}
	                                </h5>
	                            </div>

	                        </div>
	                        <div class="line2">

	                            <div class="rightb2box">
	                                <a href="#">
	                                    <h5 class="r2">
	                                        URL복사
	                                    </h5>
	                                </a>
	                            </div>
	                        </div>
	                    </div> <!-- 라스트라인 끝 -->

	                <div class="boardcontent">
	                    <div class="contentbox">
	                        <h5 class="content">
								${boardDetailView.board_content}
	                        </h5> 
	                    </div> 
	                </div><!-- 콘텐트 끝-->



	                <div class="buttonbox">

						<button class="button" onclick="window.location.href='${pageContext.request.contextPath}/announcementsTerms'">
						    <h5 class="but2">목록</h5>
						</button>
	                </div><!--버튼 끝 -->






	                </div> <!--보드 끝-->







	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->
	<%@ include file="footer.jsp" %>
</body>







</html>
<script>

	
</script>













