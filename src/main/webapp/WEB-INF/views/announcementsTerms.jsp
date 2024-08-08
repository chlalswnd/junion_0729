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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcementsTerms.css">
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

	                    <div class="headbox2">
	                        <h5 class="head1">
	                            회원약관
	                        </h5>
	                    </div>

	                    <div class="secbox">




	                        <div class="headbox">
	                            <div class="headboxbox">    
	                                <h5 class="head2">
	                                    개인회원 이용약관
	                                </h5>

	                            </div>



	                            <div class="listbox">
	                                    <div class="list">
	                                        <div class="ll">

												<c:forEach items="${announcementsTerms}" var="dto"> <!--list 반복문 시작-->
												    <c:if test="${dto.term_type == '개인'}"> <!-- '개인'인 항목만 -->
												        <a class="move_link" href="${pageContext.request.contextPath}/announcementsTermsDetailView?board_no=${dto.board_no}">
												            <div class="title">
												                <h5 class="l1">
												                    [개인] ${dto.board_title}
												                </h5>
												            </div>
												        </a>
												    </c:if>
												</c:forEach> <!--list 반복문 끝-->


	                                        </div>
	                                    </div> <!-- 리스트 끝-->
	                            </div> <!-- 리스트박스 끝-->
	                        </div> <!-- headbox 끝-->



	                        <div class="headbox">
	                            <div class="headboxbox">    
	                                <h5 class="head2">
	                                    기업회원 이용약관
	                                </h5>
									
									
									
									<!-- 나중에 usertype가 왜 인식안되는지 확인해보기 -->
									<c:if test="${login_email == 'admin@admin.com'}">
									    <a class="head3" href="announcementsTermsWriteView">
									        + 글쓰기
									    </a>
									</c:if>
									
	                            </div>


	                            <div class="listbox">
                                    <div class="list">
                                        <div class="ll">

											<c:forEach items="${announcementsTerms}" var="dto"> <!--list 반복문 시작-->
											    <c:if test="${dto.term_type == '기업'}"> <!-- '기업'인 항목만 -->
											        <a class="move_link" href="${pageContext.request.contextPath}/announcementsTermsDetailView?board_no=${dto.board_no}">
											            <div class="title">
											                <h5 class="l1" >
											                    [기업] ${dto.board_title}
											                </h5>
											            </div>
											        </a>
											    </c:if>
											</c:forEach> <!--list 반복문 끝-->



                                        </div>
                                    </div> <!-- 리스트 끝-->
	                            </div> <!-- 리스트박스 끝-->
	                        </div> <!-- headbox 끝-->
	                    </div><!-- secbox 끝 -->







	                </div> <!--보드 끝-->
	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->
	
	
	<%@ include file="footer.jsp" %>
</body>







</html>
<script>

	
</script>













