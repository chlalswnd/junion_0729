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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcementsBoard.css">
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

						<h1>공지사항 목록</h1>
						<div id="announcements"></div>
						
						<table>
							<thead>
								
							</thead>
							<tbody>
								
							</tbody>	
						</table>
						
						
	                    <div class="headbox2">
	                        <h5 class="head1">
	                            공지사항
	                        </h5>
	                        <div class="hbox">

	                            <!-- usertype 확인해서 3인 경우에만 활성화하는 js 추가하기-->
	                            <h5 class="hb1">
	                                글쓰기
	                            </h5>
	                            <!-- <h5 class="hb2">
	                                고객센터
	                            </h5> -->
	                        </div>
	                    </div>

	                    <div class="secbox">



	                        <div class="headbox">



	                            <div class="listbox">
	                                    <div class="list">
	                                        <div class="ll">

												
												
												<c:forEach items="${announcementsBoard}" var="dto"> <!--list 반복문 시작-->
												    <a class="move_link" data-board-no="${dto.board_no}">
												        <div class="title">
												            <h5 class="l1">
												                ${dto.board_title}
												            </h5> 
												        </div>
												    </a>
												</c:forEach> <!--list 반복문 끝-->

												
												

	                                        </div>
	                                    </div> <!-- 리스트 끝-->
	                            </div> <!-- 리스트박스 끝-->
	                        </div> <!-- headbox 끝-->


	 
	                    </div><!-- secbox 끝 -->



						 	
						 <!-- 액션 폼 -->
						 <form id="actionForm" method="get">
	                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	                        <!-- 페이징 검색시 페이지번호 클릭할때 필요한 파라미터-->
	                        <input type="hidden" name="type" value="${pageMaker.cri.type}">
	                        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	                    </form>

	                    <!-- 페이징 기능 끝 -->


	                </div> <!--보드 끝-->

	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->

	<%@ include file="footer.jsp" %>
</body>







</html>
<script>
    $(function(){
        list();
    });

    function list(){
        $.ajax({
            url: '/api/announcements',
            type: 'GET',
            contentType: 'application/json',
            dataType: 'json',
			error:function(xhr,status,msg){
				alert("상태값"+status);
				
			},
            success: listResult
        });
    }

    function listResult(xhr){
        console.log(xhr.data);
        $("tbody").empty();
		$.each(xhr.data,function(idx,item){
			$('<tr>')
				.append($('<td>').html(item.board_no))
				.appendTo('tbody');
			});
	}

</script>



<!--document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/announcements')
        .then(response => response.json())
        .then(data => {
            const announcementsDiv = document.getElementById('announcements');
            data.forEach(announcement => {
                const announcementElement = document.createElement('div');
                announcementElement.innerHTML = `<a href="/announcement/${announcement.board_no}">${announcement.board_title}</a>`;
                announcementsDiv.appendChild(announcementElement);
            });
        })
        .catch(error => console.error('Error fetching announcements:', error));
});-->








