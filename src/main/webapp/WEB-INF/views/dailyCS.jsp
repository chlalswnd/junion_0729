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
		<section>
			<div class="wrap">
				<h3 class="sectionTitle">데일리CS</h3>
				<div class="tabWrap">
					<div class="tab leftTab">
						<input type="button" class="selectTab inputTabBtn active" value="전체">
						<input type="button" class="selectTab inputTabBtn" value="Java">
						<input type="button" class="selectTab inputTabBtn" value="Spring">
						<input type="button" class="selectTab inputTabBtn" value="FrontEnd">
						<input type="button" class="selectTab inputTabBtn" value="HTML/CSS">
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
					                ${item.cs_user_check}
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
					            <h5 class="cs_type">HTML/CSS</h5>
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
                   modifyCheck(cs_num);
               });
           },
           error: function(error) {
               console.error('Error:', error);
           }
       });
   } // function questionPop () 끝
   
   function modifyCheck(cs_num) {
	console.log('modifyCheck 호출됨:', cs_num); 
      $.ajax({		
          url: '/modifyCheck',
          type: 'POST',
          data: { cs_num: cs_num },
          success: function(data) {       
			console.log('modifyCheck 성공:', data);    
          },
          error: function(error) {
              console.error('Error:', error);
          }
      });
  } // function questionPop () 끝
   

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