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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcements.css">
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


        <section> 	<!-- 섹션-->
            <div class="wrap">     
                <div class="board">

                    <div class="headbox2">
                        <h5 class="head1">
                            고객센터
                        </h5>
                    </div>

                    <div class="secbox">



                        <div class="headbox">
                            <div class="headbox">
                                <h5 class="head2">
                                    공지사항
                                </h5>
                            </div>


                            <div class="listbox">
                                    <div class="list">
                                        <div class="ll">

                                            <c:forEach items="${list}" var="dto"> <!--list 반복문 시작-->
                                                <a class="move_link" href="${dto.board_no}">
                                                    <div class="title">
                                                        <h5 class="l1">
                                                            [공지] 제목입니다제목입니다제목입니다제목입니다
                                                        </h5>
                                                    </div>
                                                </a>
                                            </c:forEach> <!--list 반복문 끝-->


                                            <div class="title2">
                                                <h5 class="l2">
                                                    + 모두 보기
                                                </h5>
                                            </div>

                                        </div>
                                    </div> <!-- 리스트 끝-->
                            </div> <!-- 리스트박스 끝-->
                        </div> <!-- headbox 끝-->


 
                        <div class="headbox">
                            <div class="headbox">
                                <a class="head2"  href="noticeCommunity">
                                    Q&A
                                </a>
                            </div>


                            <div class="listbox">
                                    <div class="list">
                                        <div class="ll">

											<c:set var="counter" value="0" />
											<c:forEach items="${boardList}" var="dto">
											    <c:if test="${counter < 5}">
											        <a class="move_link" href="${pageContext.request.contextPath}/noticeBoardDetailView?board_no=${dto.board_no}">
											            <div class="title">
											                <h5 class="l1">
											                    [Q&A] ${dto.board_title}
											                </h5>
											            </div>
											        </a>
										        <c:set var="counter" value="${counter + 1}" />
											    </c:if>
											</c:forEach>


                                            <div class="title2" >
                                                <a class="l2" href="noticeCommunity">
                                                    + 모두 보기
                                                </a>
                                            </div>

                                        </div>
                                    </div> <!-- 리스트 끝-->
                            </div> <!-- 리스트박스 끝-->
                        </div> <!-- headbox 끝-->
                        <div class="headbox">
                            <div class="headbox">
                                <a class="head2" href="announcementsTerms">
                                    회원약관
                                </a>
                            </div>


                            <div class="listbox">
                                <div class="list">
                                    <div class="ll">

										<c:forEach items="${termsBoardList}" var="ddd" varStatus="status"> <!--list 반복문 시작-->
										    <c:if test="${status.index < 5}"> <!-- 5개까지만 출력 -->
										        <a class="" href="${pageContext.request.contextPath}/announcementsTermsDetailView?board_no=${ddd.board_no}">
										            <div class="title">
										                <h5 class="l1">
										                    [${ddd.term_type}] ${ddd.board_title}
										                </h5>
										            </div>
										        </a>
										    </c:if>
										</c:forEach> <!--list 반복문 끝-->
                                        

                                        <div class="title2">
                                            <a class="l2" href="announcementsTerms">
                                                + 모두 보기
                                            </a>
                                        </div>

                                    </div>
                                </div> <!-- 리스트 끝-->
                            </div> <!-- 리스트박스 끝-->
                        </div> <!-- headbox 끝-->
                    </div><!-- secbox 끝 -->

					<!-- 숨겨진 폼 -->
					<form id="actionForm" method="get">
					    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					    <input type="hidden" name="type" value="${pageMaker.cri.type}">
					    <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					    <input type="hidden" name="board_no" value="">
					</form>
					
                </div> <!--보드 끝-->
            </div> <!-- wrap 끝 -->
        </section> <!--section 끝 -->


	<%@ include file="footer.jsp" %>
</body>







</html>
<script>
	
	
	$(document).ready(function() {
	    // 게시글 처리
	    $(".move_link").on("click", function(e) {
	        e.preventDefault();

	        console.log("@# move_link click~!!!");
	        console.log("@# href => " + $(this).attr("href"));

	        // URL 파라미터를 분석
	        var href = $(this).attr("href");
	        var params = new URLSearchParams(href.split('?')[1]);

	        // actionForm에 데이터 설정
	        var actionForm = $("#actionForm");

	        // 페이지 번호, 게시물 번호 등 정보를 설정
	        actionForm.find("input[name='board_no']").val(params.get('board_no'));
	        // 이미 actionForm에 설정된 pageNum, amount, type, keyword는 그대로 유지
	        // actionForm을 통해 페이지 이동
	        actionForm.attr("action", "noticeBoardDetailView").submit();
	    });
	});
</script>













