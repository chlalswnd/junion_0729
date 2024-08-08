<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서수정페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resumeModify.css">
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
		
		<section>			
            <div class="sectionInner">
                <form action="resumeModifyOk" method="post" id="frm">					
	                <div class="infoWrap">
						<input type="hidden" name="resume_num" value="${resumeInfo.resume_num}">
	                    <input class="resumeTitle" type="text" name="resume_title" id="resume_title" maxlength="20" value="${resumeInfo.resume_title}">
	                    <div class="resumeConWrap">
	                        <div class="resumeCon left">
	                            <div class="resumeConTop">
	                                <h5 class="name" name="user_name">${userInfo.user_name}</h5>
	                                <div class="ageSex">
	                                    <!-- <h5 class="age">${resumeInfo.resume_age}</h5> -->
	                                    <h5 class="age"></h5>
										<h5 id="sex" style="font-size: var(--font-size16); font-weight: 300;">${userInfo.user_gender}</h5>	                                    
	                                </div>
	                            </div>
	                            <div class="resumeConBottom">
	                                <div class="resumeCon mail">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-envelope"></i>
	                                    </span>
	                                    <h5 class="email">${userInfo.user_email}</h5>
	                                </div>
	                                <div class="resumeCon tel">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-phone"></i>
	                                    </span>
										<h5 class="tel">${userInfo.user_tel}</h5>
	                                    <!-- <input class="tel" type="text" maxlength="20" placeholder="전화번호" id="user_tel" name="user_tel"> -->
	                                </div>
	                                <div class="resumeCon location">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-location-dot"></i>
	                                    </span>
										<h5 class="user_location">${userInfo.user_location} ${userInfo.user_location2}</h5>
	                                    <!-- <input class="location" type="text" maxlength="20" placeholder="위치" id="user_address" name="user_address"> -->
	                                </div>
	                                <div class="resumeCon wantPay">
	                                    <span class="icon">
	                                        <i class="fa-solid fa-money-check"></i>
	                                    </span>										
	                                    <input class="wantPay" type="text" maxlength="20" value="${resumeInfo.resume_pay}" id="resume_pay" name="resume_pay">
	                                </div>
	                            </div>
	                        </div>
							<div class="resumeCon right">
								<div class="uploadResult">
									<ul class="resumeImage">
									</ul>
								</div>								    
	                        </div>
	                    </div> <!-- resumeConWrap 끝-->
	                </div> <!--infoWrap끝 : 개인정보  -->
	
	                <div class="sectionCon careerWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle carrer">경력</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody carrer">
	                        <div class="Bodycon career">
	                            <div class="year">
	                                <input class="from" type="date" name="career_start" value="${resumeInfo.career_start}">
	                                ~
	                                <input class="to" type="date" name="career_end" value="${resumeInfo.career_end}">
	                            </div>
	                            <input class="company" type="text" maxlength="20" value="${resumeInfo.resume_comName}" name="resume_comName">
	                            <input class="department" type="text" maxlength="20" value="${resumeInfo.resume_comPart}" name="resume_comPart">
	                            <input class="position" type="text" maxlength="20" value="${resumeInfo.resume_comPosition}" name="resume_comPosition">
	                            <select id="state" name="resume_status">
	                                <option value="재직중">재직중</option>
	                                <option value="퇴사">퇴사</option>
	                            </select>
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div> 	                                              
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- careerWrap 끝 -->
	
	                <div class="sectionCon schoolWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle school">학력</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody school">
	                        <div class="Bodycon school">
	                            <div class="year">
	                                <input class="from" type="date" name="resume_eduStart" value="${resumeInfo.resume_eduStart}">
	                                ~
	                                <input class="to" type="date" name="resume_eduEnd" value="${resumeInfo.resume_eduEnd}">
	                            </div>
	                            <input class="school" type="text" maxlength="20" value="${resumeInfo.resume_eduName}" name="resume_eduName">
	                            <input class="school" type="text" maxlength="20" value="${resumeInfo.resume_eduMajor}" name="resume_eduMajor">
	                            <select name="resume_eduStatus" id="resume_eduStatus">
	                                <option value="졸업">졸업</option>
	                                <option value="졸업예정">졸업예정</option>
	                                <option value="재학중">재학중</option>
	                                <option value="휴학중">휴학중</option>
	                            </select>
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div>	                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- schoolWrap 끝 -->
	
	                <div class="sectionCon academyWrap">
						<div class="sectionTitleWrap modify">
							<h3 class="sectionTitle academy">경험. 활동. 교육</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>	
	                    <div class="sectionConBody academy">
	                        <div class="Bodycon academy">
	                            <div class="year">
	                                <input class="from" type="date" name="resume_exStart" value="${resumeInfo.resume_exStart}">
	                                ~
	                                <input class="to" type="date" name="resume_exEnd" value="${resumeInfo.resume_exEnd}">
	                            </div>	                           
								<input class="where" type="text" maxlength="20" value="${resumeInfo.resume_exName}" name="resume_exName">
								<input class="where" type="text" maxlength="20" value="${resumeInfo.resume_exContent}" name="resume_exContent">
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span>                          -->
	                        </div>	                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- academyWrap 끝 -->
	
	                <div class="sectionCon prizeWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle prize">자격. 어학. 수상</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody prize">
	                        <div class="Bodycon prize">	                           
								<input class="from" type="date" name="resume_licenseDate" value="${resumeInfo.resume_licenseDate}">
	                            <input class="certificate" type="text" maxlength="20" value="${resumeInfo.resume_licenseContent}" name="resume_licenseContent">
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div>	                       
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- prizeWrap 끝 -->                
	
	                <div class="sectionCon portfolio">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle portfolio">포트폴리오 및 문서</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>                   
	
	                    <div class="sectionConBody portfolio">
	                        <div class="Bodycon portfolio">                            
	                            <input class="document" type="text" maxlength="20" value="${resumeInfo.resume_portfolio_name}" name="resume_portfolio_name">
	                            <input class="document" type="text" value="${resumeInfo.resume_portfolio_url}" name="resume_portfolio_url">
	                            <!-- <span class="icon delete">
	                                <i class="fa-regular fa-trash-can"></i>
	                            </span> -->
	                        </div>	                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- prizeWrap 끝 -->
	                
	                <div class="sectionCon techWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle tech">기술 스택 · 툴</h3> 
	                        <button class="saveTech" type="button">저장</button>
	                    </div>                    
	                    <div class="sectionConBody tech">
	                        <div class="Bodycon tech">
								<input type="text" class="techValue" id="techValue" name="stack_name" value="${resumeInfo.stack_name}"> <!-- resume_stack value 저장장소-->
	                            <div class="techCon">
	                                <div class="buttonTitle">기술</div>
	                                <div class="buttonWrap">	                                    
										<c:forEach var="dto" items="${stack_name}">
											<input type="button" class="tech <c:if test='${fn:contains(resumeInfo.stack_name, dto.stack_name)}'> active</c:if>" name="stack_name" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>    
	                            <div class="techCon">
	                                <div class="buttonTitle">디자인</div>
	                                <div class="buttonWrap">
	                                    <c:forEach var="dto" items="${stack_name2}">
											<input type="button" class="tech" name="stack_name" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>
	                            <div class="techCon">
	                                <div class="buttonTitle">기획</div>
	                                <div class="buttonWrap">
	                                    <c:forEach var="dto" items="${stack_name3}">
											<input type="button" class="tech" name="stack_name" value="${dto.stack_name}">
										</c:forEach>
	                                </div>
	                            </div>                        
	                        </div>                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- techWrap 끝 -->
	
	                <div class="sectionCon introduceWrap">
	                    <div class="sectionTitleWrap modify">
	                        <h3 class="sectionTitle tech">자기소개서</h3>
	                        <!-- <div class="addForm">
	                            <span class="icon">
	                                <i class="fa-solid fa-plus"></i>
	                            </span>
	                            <h5 class="add">추가</h5>  
	                        </div> -->
	                    </div>
	                    <div class="sectionConBody introduce">
	                        <div class="Bodycon introduce">
	                            <textarea name="resume_intro" id="introduceTxt" style="width: 100%; height: 300px;line-height: 24px;">${resumeInfo.resume_intro}</textarea>                            
	                        </div>                        
	                    </div> <!-- sectionConBody 끝 -->
	                </div> <!-- techWrap 끝 -->
	                <div class="resumeAllWrite">
	                    <button class="resumeAllWrite" type="submit">수정하기</button>
	                </div>

					
				</form>
            </div> <!-- sectionInner 끝 : 전체 1200 영역-->
        </section>
		
		<%@ include file="footer.jsp" %> 	
	</div>		
</body>
</html>
<script>
	$(document).ready(function()
	{	    		

		$('.Bodycon.tech input.tech').click(function(){
	        $(this).toggleClass('active');
	    });	

		var buttons = $('.Bodycon.tech input.tech');
		var techValue = $('#techValue');		
		var submit = $('button.saveTech');
		// 제출 버튼 클릭 시
		submit.on('click', function() {
        // 'on' 클래스가 있는 버튼들의 값을 배열에 저장
			var buttonValues = [];
			buttons.filter('.active').each(function() {
				buttonValues.push($(this).val());
			});

			techValue.val(buttonValues.join(', '));
		});

		// 나이계산하기
        const today = new Date();
        const birthDate = "<c:out value='${userInfo.user_birthdate}'/>";
        const birth = birthDate.substring(0,4);

        let age = today.getFullYear() - birth+ 1;
        const Age = document.querySelector('.age');

        console.log(birth);
        console.log(today);
        console.log(age);
        Age.append(age);
		
// =============================================================================

		var formObj = $("form[id='frm']");

		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");

			/*
				2024-07-24 하지수 
				유효성 검사
			*/
            var requiredFields = [
                {name: "resume_title", message: "이력서명을 입력해주세요."},
                {name: "resume_pay", message: "희망연봉을 입력해주세요."},
                {name: "career_start", message: "경력 시작일을 입력해주세요."},
                {name: "career_end", message: "경력 마감일을 입력해주세요."},
                {name: "resume_comName", message: "경력 회사명을 입력해주세요."},
                {name: "resume_comPart", message: "경력 부서명을 입력해주세요."},
                {name: "resume_comPosition", message: "경력 직책을 입력해주세요."},
                {name: "resume_status", message: "경력 재직여부를 입력해주세요."},
                {name: "resume_eduStart", message: "학력 시작일을 입력해주세요."},
				{name: "resume_eduEnd", message: "학력 마감일을 입력해주세요."},				
				{name: "resume_eduName", message: "학교명을 입력해주세요."},
				{name: "resume_eduMajor", message: "전공을 입력해주세요."},
				{name: "resume_eduStatus", message: "졸업여부를 입력해주세요."},				
				{name: "resume_exStart", message: "경험or활동or교육 시작일을 입력해주세요."},
				{name: "resume_exEnd", message: "경험or활동or교육 마감일을 입력해주세요."},
				{name: "resume_exName", message: "경험or활동or교육명을 입력해주세요."},
				{name: "resume_exContent", message: "경험or활동or교육내용을 입력해주세요."},
				
				{name: "resume_licenseDate", message: "자격증 날짜를 입력해주세요."},
				{name: "resume_licenseContent", message: "자격증 내용을 입력해주세요."},
				{name: "resume_portfolio_name", message: "포트폴리오명을 입력해주세요."},
				{name: "resume_portfolio_url", message: "포트폴리오 URL을 입력해주세요."},
				{name: "stack_name", message: "스택을 선택해주세요.",
						validate: function() {
							return $(".tech.active").length > 0;
						}
					},
                {name: "resume_intro", message: "자기소개를 입력해주세요."}
            ];

			// 유효성 반복 + 포커스 이동
            for (var i = 0; i < requiredFields.length; i++) {
                var field = requiredFields[i];

                // 일반 필드와 특별한 기술 스택 필드를 구분
                if (field.name === "stack_name") {
                    if (!field.validate()) {
                        alert(field.message);
                        $(".tech").first().focus(); // 'tech' 버튼 중 첫 번째에 포커스를 이동
                        return;
                    }
                } else {
                    var fieldValue = $("[name='" + field.name + "']").val().trim();
                    if (fieldValue === "") {
                        alert(field.message);
                        $("[name='" + field.name + "']").focus();
                        return;
                    }
                }
            } //유효성 검사 끝 --		

			
			// return;
			formObj.submit();
		});//end of button submit
		
// 즉시실행함수
		(function(){
			console.log("@# document ready");
			var resume_num = "<c:out value='${resumeInfo.resume_num}'/>";
			console.log("@# resume_num=>"+resume_num);
			
			//컨트롤러단으로 연결				
			// boardNo를 던지면 리턴되는값 : function(arr) => 컨트롤러에 있는 new ResponseEntity<> 객체 전부 가져옴
			$.getJSON("/resumeGetFileList", {resume_num: resume_num}, function(arr)
			{ 
				console.log("@# arr=>"+arr);

				var str="";

				
				$(arr).each(function(i, attach)
				{
								
					//image type
					if(attach.image) 
					{
						var fileCallPath = encodeURIComponent(attach.uploadPath +"/s_"+ attach.uuid + "_" + attach.fileName);

						str += "<li data-path='" + attach.uploadPath + "'";
						str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'>";
						str + "<div>";						
						str +="<span style='display:none'>"+attach.fileName+"</span>";
						str +="<img src='/resumeDisplay?fileName="+fileCallPath+"'>"; // 이미지 출력 처리(컨트롤러단)
						str +="</div>";
						str +="<div class='imgController'>";
						str +="<span data-file=\'"+fileCallPath+"\'data-type='image' style='cursor:pointer'> X </span>";
						str +="</div>";
						str +="</li>";
					}
					else 
					{
						var fileCallPath = encodeURIComponent(attach.uploadPath +"/"+ attach.uuid + "_" + attach.fileName);
					
						str += "<li data-path='" + attach.uploadPath + "'";
						str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'"
						str + " ><div>";
						str +="<span>"+attach.fileName+"</span>";
						str +="<img src='./resources/img/attach.png'>";		
						str +="<span data-file=\'"+fileCallPath+"\'data-type='file' style='cursor:pointer'> X </span>";				
						str +="</div>";
						str +="</li>";
					}

				}); // arr.each 끝
				console.log("@#str=======>"+str);
				$(".uploadResult ul").html(str);
			}); // getJSON끝

			$(".uploadResult").on("click","li", function(e){
				console.log("@# uploadResult click");

				var liObj = $(this);
				console.log("@# liobj.path=>"+liObj.data("path"));
				console.log("@# liobj.uuid=>"+liObj.data("uuid"));
				console.log("@# liobj.fileName"+liObj.data("filename"));
				console.log("@# liobj.type"+liObj.data("type"));

				var path = encodeURIComponent(liObj.data("path") +"/"+ liObj.data("uuid") + "_" + liObj.data("filename"));
				console.log("@# var path=>"+path);

				if(liObj.data("type")) 
				{
					console.log("@# 01");
					console.log("@# view");

					showImage(path);
				}
				else 
				{
					console.log("@# 02");
					console.log("@# download");
					console.log("@# path=========>"+ path);
					// 컨트롤러의 download 호출
					//self.location="/download?fileName="+path;// 틀리면 download로 다시바꾸
					self.location="/resumeDownload?fileName="+path;
					
				}
			}); // .uploadResult 클릭 끝

			// 썸네일이미지 눌렀을때 100%로 확대
			function showImage(fileCallPath) 
			{
				// alert(fileCallPath);///

				$(".bigPicture").css("display","flex").show();
				//$(".bigPic").html("<img src='/resumeDisplay?fileName="+fileCallPath+"'>").animate({width:"100%", height:"100%"},1000); 
				 $(".bigPic").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:"100%", height:"100%"},1000); 
			}

			// 확대한 이미지 다시 되돌리기
			$(".bigPicture").on("click", function(e){
				$(".bigPic").animate({width:"0%", height:"0%"},1000);
				setTimeout(function(){
					$(".bigPicture").hide();
				}); 
			}); // .bigPicture click : 확대한이미지 되돌리기 끝 

		})();
		
// ============================================================================================		

	});
</script>