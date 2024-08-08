<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>인재풀(개인) 목록페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jobpostingIndividualSupport.css">
	<!-- import font-awesome, line-awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
	<!-- import pretendard font -->
	<link rel="stylesheet" as="style" crossorigin
		href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
	<!-- import js -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->

</head>

<body>
	<%@ include file="header.jsp" %>

		<!-- 섹션-->
		<section>
			<div class="wrap">
				<div class="devlist">


					<div class="personpool">
						<h5 class="t1">
							원하는 직무에 딱 맞는 우수한 인재를 찾아보세요
						</h5>
					</div>


					<form method="get" id="searchForm">
						<!-- 추천순/최신순 탭 정보 보냄 -->
						<input type="hidden" name="orderType" id="orderType" value="${orderType}">
						<div class="filterbox">	
							<div class="left">
								<div class="sbox1">
									<!-- <select class="select1" id="stackSelect" name="stackType" onchange="selectSearchBox()"> -->
									<select class="select1" id="stackSelect" name="stackType">
										<option value="" <c:out value="${pageMaker.cri.stackType == null ? 'selected':''}"/>>기술스택 무관</option>
										<c:forEach var="stack" items="${stackList}">
											<option value="${stack}" <c:out value="${pageMaker.cri.stackType eq stack ? 'selected':''}"/>>${stack}</option>
										</c:forEach>
									</select>
								</div>
								<!-- selectbox 끝  -->

								<!-- @@@@@@@개인 회원은 dropbox 직업/직무로 보이고 선택할 수 있도록@@@@@@@@@@@ -->

								<div class="sbox2">
									<!-- <select class="select1" id="jobSelect" name="jobType" onchange="selectSearchBox()"> -->
									<select class="select1" id="jobSelect" name="jobType">
										<option value="" <c:out value="${pageMaker.cri.jobType == null ? 'selected':''}"/>>직군/직무 무관</option>
										<c:forEach var="job" items="${jobList}">
											<option value="${job}" <c:out value="${pageMaker.cri.jobType eq job ? 'selected':''}"/>>${job}</option>
										</c:forEach>
									</select>
								</div>
								<!-- selectbox 끝  -->

								<div class="sbox">
									<!-- <select class="select1" id="locationSelect" name="locationType" onchange="selectSearchBox()"> -->
									<select class="select1" id="locationSelect" name="locationType">
										<option value="" <c:out value="${pageMaker.cri.locationType == null ? 'selected':''}"/>>지역 무관</option>
										<c:forEach var="location" items="${locationList}">
											<option value="${location}" <c:out value="${pageMaker.cri.locationType eq location ? 'selected':''}"/>>${location}</option>
										</c:forEach>
									</select>
								</div>
								<!-- selectbox 끝  -->

								<div class="sbox">
									<!-- <select class="select1" id="careerselect" name="careerType" onchange="selectSearchBox()"> -->
									<select class="select1" id="careerselect" name="careerType">
										<option value="" <c:out value="${pageMaker.cri.careerType == null ? 'selected':''}"/>>경력 무관</option>
										<option value="0" <c:out value="${pageMaker.cri.careerType eq '0' ? 'selected':''}"/>>신입</option>
										<option value="1" <c:out value="${pageMaker.cri.careerType eq '1' ? 'selected':''}"/>>1년차</option>
										<option value="2" <c:out value="${pageMaker.cri.careerType eq '2' ? 'selected':''}"/>>2년차</option>
										<option value="3" <c:out value="${pageMaker.cri.careerType eq '3' ? 'selected':''}"/>>3년이상</option>
									</select>
								</div>
								<!-- selectbox 끝  -->
								
								<div class="left">
									<button class="fil2" type="button" onclick="setAllToNone()">
										<div class="f1">
											<h5 class="but1">
												전체 무관
											</h5>
										</div>
									</button>
								</div>
							</div>
							<!-- 레프트 끝 -->

							<!-- <div class="right" style="visibility: hidden;"> -->
							<div class="right">
								<button class="fil2" id="searchButton">
									<div class="f1">
										<h5 class="but1">
											검색
										</h5>
									</div>
								</button>
							</div>


							<input type="hidden" name="pageNum" value="1">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<!-- 라이트 끝 -->
							
							
						</div>
					</form>
					<!-- filterbox 끝 -->

					<div class="selbox">
						<div class="sel">
							<button class="tab-btn ${orderType == 'recommendation' ? 'active' : ''}"
								onclick="switchTab('recommendation', event)">추천순</button>
						</div>
						<div class="sel">
							<button class="tab-btn ${orderType == 'latest' ? 'active' : ''}" 
								onclick="switchTab('latest', event)">최신순</button>
						</div>
					</div>

					<!-- <div id="recommendation" class="form-box active"> -->
						<c:forEach items="${jobpostingIndividualSupport}" var="sup">
							<div class="pplist"> <!--  pplist 시작-->
								<div class="pp" data-resume-num="${sup.resume_num}">
									<div class="imgbox">
										<div class="uploadResult">
                                            <ul>
												<img src="images/people.svg" alt="#" class="img">
                                            </ul>
                                        </div>
									</div>
									<div class="tt">
										<h5 class="t1">
											${sup.user_name}
										</h5>
									</div>
									<div class="tt">
										<h5 class="t1">
											${sup.user_gender} ${sup.korean_age}세
										</h5>
									</div>
									<div class="tt">
										<h5 class="t1">
											<c:if test="${sup.career_years != 0}">
												${sup.career_years}년차
											</c:if>
											<c:if test="${sup.career_years == 0}">
												신입
											</c:if>
										</h5>
									</div>

									<div class="buttbox1">
										<div class="b1">
											<c:forEach var="stacks" items="${sup.stackList}">
												<div class="stack-item">${stacks}</div>
											</c:forEach>
										</div>
									</div>
									
									<div class="buttbox1">
										<div class="b1">
											<c:forEach var="jobs" items="${sup.jobList}">
												<div class="job-item">${jobs}</div>
											</c:forEach>
										</div>
									</div>

									<div class="right">
										<div class="buttbox2">
											<h5 class="b2">
												<button type="button" class="view_resume"
												onclick="location.href='resumeInfo2?resumeNum=${sup.resume_num}'">
													이력서열람
												</button>
											</h5>
										</div>
										<div class="buttbox2">
											<h5 class="b2">
												<!-- <button type="button" class="proposalbutt" style="display:none;" onclick="setUserEmail('${sup}')"> -->
												<button type="button" class="proposalbutt" style="display:none;" <c:if test="${sup.check_offer > 0}">disabled</c:if>
														onclick="setUserEmail('${sup.user_email}'); setResumeNum('${sup.resume_num}')">
													<c:choose>
														<c:when test="${sup.check_offer > 0}">
															제안완료
														</c:when>
														<c:otherwise>
															제안하기
														</c:otherwise>
													</c:choose>
												</button>
											</h5>
										</div>

										
										<!-- 팝업창 구조 -->
										<!-- <div id="proposalPopup" class="popup" style="display: none;">
											<div class="popup-content">
												<span class="close">&times;</span>
												<form>
													<div class="popTitle" style="text-align: center;">
														<h3>포지션 제안</h3>
													</div>
													<hr>
													<div >
														<p><h4></h4></p>
														<p></p>
													</div>
													<hr>
													<div>
														<textarea id="proposalMessage" name="proposalMessage">안녕하세요, 저희 회사의 Java 개발자 포지션에 대해 제안을 드립니다.													귀하의 프로필이 이 포지션에 적합하다고 판단되어 제안 드립니다.															저희 회사에서 귀하와 함께 일할 수 있기를 기대합니다.</textarea>
													</div>
													<hr>
													<div>
														<h4>채용 포지션</h4>
														<p>직무&emsp;</p>
														<p>경력&emsp;</p>
														<p>&emsp;</p>
													</div>
													<div>
														<select class="NoticeTitle" id="titleSelect" name="titleSelect">
															<c:forEach var="offerInfo" items="${offerInfo}">
																<option value="${offerInfo.notice_title}">${offerInfo.notice_title}</option>
															</c:forEach>
														</select>
													</div>
													<input type="submit" value="제안하기">
												</form>
											</div>
										</div> -->


										<!-- 팝업창 구조 -->
										<!-- 드롭박스 선택으로 회원의 채용공고의 정보 불러오는 코드가 어려웠음 -->
										<div id="proposalPopup" class="popup" style="display: none;">
											<div class="popup-content">
												<span class="close">&times;</span>
												<form method="get" action="sendOffer">
													<div class="popTitle" style="text-align: center;">
														<p><h3>포지션 제안</h3></p>
													</div>
													<hr>
													<div>
														<p><h4 id="selectedTitle">공고 제목</h4></p>
														<p id="selectedCompany">기업 이름</p>
													</div>
													<hr>
													<div>
														<textarea id="offerMessage" name="offer_content" placeholder="달콤한 제안을 속삭여주세요 ><"></textarea>
													</div>
													<hr>
													<div>
														<p><h4>채용 포지션</h4></p>
														<p>직무&emsp;<span id="selectedJob"></span></p>
														<p>경력&emsp;<span id="selectedCareer"></span></p>
														<p><span id="selectedPay1">급여</span>&emsp;<span id="selectedPay2"></span><span>만원</span></p>
													</div>
													<div>
														<select class="NoticeTitle" id="titleSelect" name="titleSelect" onchange="updateOfferInfo()" required>
															<option value="" disabled selected>공고를 선택해주세요.</option>
															<c:forEach var="offer" items="${offerInfo}">
																<option value="${offer.notice_title}" data-com-name="${offer.com_name}" data-job="${offer.notice_job}"
																		data-career="${offer.notice_career}" data-pay1="${offer.notice_pay1}" data-pay2="${offer.notice_pay2}"
																		data-offerInfo="${offer}" data-num="${offer.notice_num}">
																	${offer.notice_title}
																</option>
															</c:forEach>
														</select>
													</div>
													<!-- <input type="hidden" value="" id="noticeTitle" name="notice_title">
													<input type="hidden" value="" id="comName" name="com_name">
													<input type="hidden" value="" id="noticeJob" name="notice_job">
													<input type="hidden" value="" id="noticeCareer" name="notice_career">
													<input type="hidden" value="" id="noticePay1" name="notice_pay1">
													<input type="hidden" value="" id="noticePay2" name="notice_pay2"> -->
													<input type="hidden" value="" id="noticeNum" name="notice_num">
													<!-- <input type="hidden" value="" id="offerInfo" name="offerInfoDTO"> -->
													<input type="hidden" value="" id="userEmail" name="user_email">
													<input type="hidden" value="" id="resumeNum" name="resume_num">
													<input type="hidden" value="${login_email}" id="comEmail" name="com_email">
													<input type="submit" value="제안하기">
												</form>
											</div>
										</div>


										<div class="date">
											<h5 class="d1">
												<!-- ${sup.resume_writeDate} -->
											</h5>
										</div>
									</div>

								</div>
							</div> <!--  pplist 끝-->
						</c:forEach>
					<!-- </div> -->
					<!-- 반복문 끝 -->

					<!-- <h3>${pageMaker}</h3> -->
					<div class="div_page">
						<ul>
							<c:if test="${pageMaker.prev}">
								<!-- <li>[Previous]</li> -->
								<li class="paginate_button">
									<a href="${pageMaker.startpage - 1}">
										[Previous]
									</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
								<!-- <li>[${num}]</li> -->
								<!-- <li ${pageMaker.cri.pageNum == num ? "style='color: red;'" : ""}> -->
								<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='border:2px solid #FFA500; font-weight: 900';" : ""}>
									<!-- [${num}] -->
									<a href="${num}">
										${num}
									</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<!-- <li>[Next]</li> -->
								<li class="paginate_button">
									<a href="${pageMaker.endpage + 1}">
										[Next]
									</a>
								</li>
							</c:if>
						</ul>
					</div>
				
					<form id="actionForm" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<!-- 페이징 검색시 페이지 번호 클릭할 때 필요한 파라미터 -->
						<input type="hidden" name="stackType" value="${pageMaker.cri.stackType}">
						<input type="hidden" name="locationType" value="${pageMaker.cri.locationType}">
						<input type="hidden" name="careerType" value="${pageMaker.cri.careerType}">
						<input type="hidden" name="jobType" value="${pageMaker.cri.jobType}">
						<!-- hidden 값 미스매치로 페이지가 나오지 않는 오류 있었음 -->
					</form>

				</div> <!-- devlist 끝 -->
			</div> <!-- wrap 끝 -->
		</section> <!--section 끝 -->


		<%@ include file="footer.jsp" %>
</body>





</html>
<script>
	$(document).ready(function () {
		var userType = '${login_usertype}';

		// 모든 'proposalbutt' 클래스 버튼에 대해 반복
		$('.proposalbutt').each(function () {
			// userType이 '2'일 경우에만 버튼을 표시
			if (userType === '2') {
				$(this).css('display', 'block');
			} else {
				$(this).css('display', 'none');
			}
		});
		$('.sbox1').each(function () {
			// userType이 '2'일 경우에만 드롭박스 보임
			if (userType === '2') {
				$(this).css('display', 'block');
			} else {
				$(this).css('display', 'none');
			}
		});
		$('.sbox2').each(function () {
			// userType이 '1'일 경우에만 드롭박스 보임
			if (userType === '1') {
				$(this).css('display', 'block');
			} else {
				$(this).css('display', 'none');
			}
		});



		// 기존의 userType 관련 코드 유지
		// 팝업창 열기
		$('.proposalbutt').click(function() {
			$('#proposalPopup').css('display', 'block');
		});

		// 팝업창 닫기
		$('.close').click(function() {
			$('#proposalPopup').css('display', 'none');
			$('#offerMessage').val(''); // 텍스트 영역 초기화
			$('#titleSelect').prop('selectedIndex', 0); // 드롭다운 초기화
			$('#selectedTitle').text('공고 제목');
			$('#selectedCompany').text('기업 이름');
			$('#selectedJob').text('');
			$('#selectedCareer').text('');
			$('#selectedPay1').text('급여');
			$('#selectedPay2').text('');
			$('#noticeNum').val('');
			$('#userEmail').val('');
			$('#resumeNum').val('');
		});

		// 팝업창 외부 클릭 시 닫기
		// $(window).click(function(event) {
		// 	if (event.target == document.getElementById('proposalPopup')) {
		// 		$('#proposalPopup').css('display', 'none');
		// 	}
		// });


		// 이미지 가져오는 함수
		$('.pp').each(function () {
			// con클래스 data-resumeNum 속성에서 값을 가져옴
			var resumeNum = $(this).data('resume-num');
			
			// 현재 con클래스 .uploadResult 요소를 선택
			var uploadResultContainer = $(this).find('.uploadResult ul');

			if (resumeNum) {
				$.ajax({
					url: '/resumeGetFileList',
					type: 'GET',
					data: { resume_num: resumeNum },
					dataType: 'json',
					success: function(data) {
						console.log('Data fetched for resume_num ' + resumeNum + ':', data); // 확인용 콘솔 로그
						showUploadResult(data, uploadResultContainer);
					},
					error: function(xhr, status, error) {
						console.error('Error fetching file list for notice_num ' + resumeNum + ':', error);
					}
				});
			} 
		});
	});

	// 이미지 가져옴
	function showUploadResult(uploadResultArr, uploadResultContainer){
		if (!uploadResultArr || uploadResultArr.length == 0) {
			console.log('No upload results found.'); // 확인용 콘솔 로그
			return;
		}

		var str = "";

		$(uploadResultArr).each(function (i, obj) {
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

			str += "<li data-path='" + obj.uploadPath + "'";
			str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
			str += "<div>";
			str += "<span style='display:none;'>" + obj.fileName + "</span>";
			str += "<img src='/resumeDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
			str += "</div></li>";
		});

		console.log('Appending upload results:', str); // 확인용 콘솔 로그
		uploadResultContainer.empty().append(str);
	}


	function setAllToNone() {
		// 모든 select 요소를 "무관" 옵션으로 설정
        document.getElementById('stackSelect').value = "";
        document.getElementById('jobSelect').value = "";
        document.getElementById('locationSelect').value = "";
        document.getElementById('careerselect').value = "";
		document.getElementById('searchForm').submit();
	}
		
		
	/*
	// 드롭박스 선택만 하면 바로 서치되도록 함
	function selectSearchBox() {
		document.getElementById('searchForm').submit();
    }
	*/


	function switchTab(tab, event) {
		// event.preventDefault(); // 기본 동작 방지

		document.querySelectorAll('.tab-btn').forEach(function (el) {
			el.classList.remove('active');
		});

		// 'orderType' 히든 필드의 값을 설정하고 폼을 제출
		document.getElementById('orderType').value = tab;
    	document.getElementById('searchForm').submit();
	}




    // if (true) {
    //     disableButton(proposalButton);
    // }

    function setUserEmail(userEmail) {
        // userEmail 값을 설정
        document.getElementById('userEmail').value = userEmail;
    }


    function setResumeNum(resumeNum) {
        // userEmail 값을 설정
        document.getElementById('resumeNum').value = resumeNum;
    }


    function updateOfferInfo() {
        // 선택된 옵션을 가져옴
        var select = document.getElementById('titleSelect');
        var selectedOption = select.options[select.selectedIndex];

        // data 속성을 사용하여 관련 정보 가져옴.
        var noticeTitle = selectedOption.value;
        var comName = selectedOption.getAttribute('data-com-name');
        var job = selectedOption.getAttribute('data-job');
        var career = selectedOption.getAttribute('data-career');
        var pay1 = selectedOption.getAttribute('data-pay1');
        var pay2 = selectedOption.getAttribute('data-pay2');

        var num = selectedOption.getAttribute('data-num');
        // var offerInfo = selectedOption.getAttribute('data-offerInfo');

        // DOM 요소에 값을 업데이트합니다.
        document.getElementById('selectedTitle').textContent = noticeTitle;
        document.getElementById('selectedCompany').textContent = comName;
        document.getElementById('selectedJob').textContent = job;
        document.getElementById('selectedCareer').textContent = career;
        document.getElementById('selectedPay1').textContent = pay1;
        document.getElementById('selectedPay2').textContent = pay2;

		// document.getElementById('noticeTitle').value = noticeTitle;
		// document.getElementById('comName').value = comName;
		// document.getElementById('noticeJob').value = job;
		// document.getElementById('noticeCareer').value = career;
		// document.getElementById('noticePay1').value = pay1;
		// document.getElementById('noticePay2').value = pay2;
		document.getElementById('noticeNum').value = num;
		// document.getElementById('offerInfo').value = offerInfo;
    }
    

	var actionForm = $("#actionForm");

	//페이지 번호 처리
	// $(".paginate_button").on("click", function (e){
	$(".paginate_button a").on("click", function (e) {
		//기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@# href=>" + $(this).attr("href"));

		// 게시글 클릭후 뒤로가기 누른 후 다른 게시글 클릭할 때 &boardNo=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='boardNo']").val();
		if (bno != "") {
			actionForm.find("input[name='boardNo']").remove();
		}

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		// actionForm.submit();
		actionForm.attr("action", "jobpostingIndividualSupport").submit();
	});//end of paginate_button click

	$(".move_link").on("click", function (e) {
		e.preventDefault();

		console.log("@# move_link click~!!!");
		console.log("@# href=>" + $(this).attr("href"));

		var targetBno = $(this).attr("href");

		// 게시글 클릭후 뒤로가기 누른 후 다른 게시글 클릭할 때 &boardNo=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='boardNo']").val();
		if (bno != "") {
			actionForm.find("input[name='boardNo']").remove();
		}

		// "content_view?boardNo=${dto.boardNo}" 를 actionForm 으로 처리
		actionForm.append("<input type='hidden' name='boardNo' value='" + targetBno + "'>");
		// actionForm.submit();
		actionForm.attr("action", "content_view").submit();
	});//end of move_link click

	var searchForm = $("#searchForm");

	// Search 버튼 클릭
	$("#searchButton").on("click", function (e) {
		// alert("검색");
		searchForm.attr("action", "jobpostingIndividualSupport").submit();
	});//end of searchForm click
</script>