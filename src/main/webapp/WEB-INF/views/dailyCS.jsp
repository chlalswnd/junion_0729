<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/dailyCS.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="js/index.js"></script> 
    
</head>
<body>
	<div class="container">
	    <%@ include file="header.jsp" %>
		<%@ include file="quickMenu.jsp" %>
<!--		<%@ include file="quickMenu.jsp" %>-->
		<section>
			<div class="wrap">
				<h3 class="sectionTitle">데일리CS</h3>
				<div class="tabWrap">
					<div class="tab leftTab">
						<form action="searchTab" method="post" id="searchTab">													
							<input type="hidden" name="cs_type" id="clickInput" value="">
							<input type="button" class="selectTab inputTabBtn <c:if test='${cs_type == "전체" or empty cs_type}'>active</c:if>"
							           value="전체" onclick="filterBtn(this)">
						    <input type="button" class="selectTab inputTabBtn <c:if test='${cs_type == "Java"}'>active</c:if>" 
							value="Java" onclick="filterBtn(this)">
						    <input type="button" class="selectTab inputTabBtn <c:if test='${cs_type == "Spring"}'>active</c:if>" 
							value="Spring" onclick="filterBtn(this)">
						    <input type="button" class="selectTab inputTabBtn <c:if test='${cs_type == "Javascript"}'>active</c:if>" 
							value="Javascript" onclick="filterBtn(this)">
						    <input type="button" class="selectTab inputTabBtn <c:if test='${cs_type == "HTML/CSS"}'>active</c:if>" 
							value="HTML/CSS" onclick="filterBtn(this)">
						</form>
					</div>
				</div>
				<div class="questionCardWrap">								
					<c:forEach var="item" items="${list}">
					    <div class="card">
					        <div class="cardH">
					            <h3 class="cardTitle">
					                ${item.cs_type}
					            </h3>
					        </div>
					        <div class="cardB">
					            ${item.cs_question_title}								
					        </div>
					        <div class="cardF">
					            <div class="check">																
					                <i class="fa-solid fa-circle-check"></i>
					                <c:if test="${not empty item.user_email and item.user_email == session_email}">참여</c:if>
					                <c:if test="${empty item.user_email or item.user_email != session_email}">미참여</c:if>
					            </div>
					            <button type="button" class="popOpen" onclick="questionPop(${item.cs_num})">문제풀기</button>
					        </div>
					    </div>
					</c:forEach>

					<div class="questionPop" style="display: none;">
					    <div class="popInner">
					        <div class="popHeader">
					            <h3>데일리CS문제</h3>								
					            <i class="fa-solid fa-xmark closebtn"></i>
					        </div>
					        <div class="popBody">
					            <h5 class="cs_type"></h5>
					            <p style="font-weight: 300;"></p>
					            <div class="questionWrap"></div>
					        </div>
					        <div class="popFooter">
					            <div class="questionExplane">해설<br><br></div>
					            <button type="button" class="questionComplete" id="questionComplete">완료</button>
					        </div>
					    </div>
					</div> <!-- questionPop 끝-->
				</div>	<!-- questionCardWrap 끝-->	
				<!--<h3>${pageMaker}</h3>-->
				<div class="div_page">
					<ul>
						<c:if test="${pageMaker.prev}">
							<!-- <li>Previous</li> -->
							<li class="paginate_button">
								<a href="${pageMaker.startpage - 1}">
									Previous
								</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">									
							<li class="paginate_button" ${pageMaker.cri3.pageNum == num ? "style='border:2px solid #FFA500; font-weight: 900';'" : ""}>
								<a href="${num}">
									${num}
								</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<!-- <li>next</li> -->
							<li class="paginate_button">
								<a href="${pageMaker.endpage + 1}">
									Next
								</a>
							</li>
						</c:if>
					</ul>
				</div> <!-- div_page-->
				<!-- 데이터를 가지고 컨트롤러단으로 가기때문에 listWithPaging-->
				<!-- <form action="listWithPaging" method="get" id="actionForm"> -->
				<!-- <form action="list" method="get" id="actionForm"> -->
				<form method="get" id="actionForm">
					<!-- 페이지 번호를 "pageNum" 이라는 이름으로 가져감 이건 굳이 보일필요는없기때문에 hidden type-->
					<input type="hidden" name="pageNum" value="${pageMaker.cri3.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri3.amount}">
				</form>
            </div>						
			</div>	
		</section>		
		<%@ include file="footer.jsp" %>
	</div>        
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   function questionPop(cs_num) {
       $.ajax({
           url: '/dailyCS',
           type: 'POST',
           data: { cs_num: cs_num },
           success: function(data) {
               // 서버로부터 받은 데이터를 팝업에 채웁니다.
               $('.cs_type').text(data.cs_type);
               $('.popBody p').html(data.cs_question_title.replace(/\n/g, '<br>')); // 줄바꿈을 <br>로 변환
               $('.questionExplane').html('해설<br><br>' + data.cs_question_explanation);
			   
			   // 질문 옵션들을 처리합니다.
               const question = data.cs_question_option;
               const questions = question.split(',');
               let str = "";
               for (let i = 0; i < questions.length; i++) {
                   str += "<input type='button' class='question' value='" + questions[i].trim() + "' data-option='" + (i + 1) + "'>";
               }
			                       
			   	$('.questionWrap').html(str);

               // 팝업을 표시합니다.
               $('.questionPop').show();
			   
			   $('input.question').click(function(){
					const userAnswer = $(this).attr('data-option');
	            	const correctAnswer = data.cs_answer_num;
					if (userAnswer == correctAnswer) {
	                    $(this).addClass('correct');						
						// 해설 표시
	                    $('.questionExplane').show();
	                } else {						
	                    $(this).addClass('incorrect');						                 
	                }				
					$('input.question').not(this).removeClass('incorrect'); 					
			   });
			   
			   // "완료" 버튼에 클릭 이벤트 추가
               $('#questionComplete').off('click').on('click', function() {
				   const user_email = '${sessionScope.login_email}'; // JSP에서 세션의 user_email 값을 가져옵니다.
                   modifyCheck(cs_num, user_email);
               });
           },
           error: function(error) {
               console.error('Error:', error);
           }
       });
   } // function questionPop () 끝
   
   // 문제풀이 참여여부
   function modifyCheck(cs_num, user_email) {
	console.log('modifyCheck 호출됨:', cs_num, user_email); 
      $.ajax({		
          url: '/modifyCheck',
          type: 'POST',
          data: { cs_num: cs_num, user_email: user_email },
          success: function(data) {    
			alert("문제풀이에 참여하셨습니다.")   
			console.log('modifyCheck 성공:', data);   
			$('.questionPop').hide();
			location.replace('dailyCS'); 
          },
          error: function(error) {
              console.error('Error:', error);
          }
      });
  } // function modifyCheck () 끝  
  
  // 버튼 필터링
  function filterBtn(button) 
  {
	var btnValue = button.value;
	document.getElementById('clickInput').value = btnValue;
	$('#searchTab').submit();
			
  }

   $(document).ready(function() {		
			
	   // 팝업 닫기
	   $('.closebtn').on('click', function() {
	       $('.questionPop').hide();
		   $('.questionExplane').hide();
	   });	   
	   
	    //2024-06-25 이재원 글자수 제한 + 넘는건 ...처리	        
	    $('.cardB').each(function()
	    {
	        var length = 80; //표시할 글자 수 정하기
	  
	        $(this).each(function()
	        {
	
	           if($(this).text().length >= length)
	            {
	                $(this).text($(this).text().substr(0, length) + '...');	//지정한 글자수 이후 표시할 텍스트 '...'
	            }
	        });
	
	    });			
				
    }); // document ready 끝
</script>
<script>
	var actionForm = $("#actionForm");

	// 페이지번호 처리
	$(".paginate_button a").on("click", function(e){
		// 기본 동작 막음
		e.preventDefault();
		console.log("@# href=>"+$(this).attr("href"));

		// 게시글 클릭 후 뒤로가기 누른 후 다른 페이지 클릭할때 &boardNo= 번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='cs_num']").val();
		if(bno != "") 
		{
			actionForm.find("input[name='cs_num']").remove();
		}

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// actionForm.submit();

		// ★ 뒤로가기했다가 다른번호 누르면 페이징 기능 고장나는거 수정 form action="list"를 빼고 이렇게 속성
		actionForm.attr("action","dailyCS").submit(); 
	}); // paginate_button 클릭 끝
	
</script>