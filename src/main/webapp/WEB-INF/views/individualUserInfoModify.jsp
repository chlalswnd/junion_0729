<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<% String session_pw=(String) session.getAttribute("login_pw"); %>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>개인-회원정보수정</title>
				<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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
				<style>
					:root {
						/* 컬러 모음 */
						--main-color: #FFA500;
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

					/* 드롭다운 메뉴 */
					.dorpdowmMain {
						display: flex;
					}

					.dropdown {
						display: flex;
						align-items: center;
					}

					.dropdownSub {
						display: flex;
					}

					.dropdownContent {
						position: absolute;
						display: none;
						text-align: center;
						margin-top: 20px;
						width: 160px;
						background-color: var(--color-white);
						border-radius: 5px;
						box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
						right: 11px;
					}

					.dropdownContent a {
						color: var(--color-black);
						padding: 12px;
						text-decoration: none;
						display: block;
						font-size: var(--color-black);
					}







					/* 프로필 : 사진 + 이름 */
					main .mainContainer .memberInfo {
						display: flex;
						align-items: center;
						margin-bottom: 40px;
					}

					main .mainContainer .memberInfo img.memberImg {
						width: 64px;
						height: 64px;
						margin-right: 20px;
					}

					main .mainContainer .memberInfo .memberName {
						font-size: var(--font-size32);
						font-weight: 600;
					}

					/* 메인 */
					main {
						display: flex;
						justify-content: center;
						padding: 50px 0 120px;
					}

					.infoWrap {
						display: flex;
						flex-direction: column;
						min-width: 1200px;
						gap: 40px 0;
					}


					/*회원정보수정 타이틀*/

					.infoTitle {
						font-size: var(--font-size32);
						color: var(--color-black);
						/* margin-top: 70px; */
					}

					/*회원사진 + 테이블*/
					.infoConWrap {
						display: flex;
						gap: 50px;
						/* margin-top: 80px; */


					}

					/*회원사진*/
					.infoConLeft {
						width: 100px;
					}



					/*회원정보 테이블*/
					.infoConRight {
						width: 1050px;
						/*border: 1px solid var(--input-gray);
						border-radius: 10x;
						box-sizing: border-box;
						border-collapse: collapse;
						font-size: var(--font-size16); */
					}

					.userInfoTable

					/*th,td넣기전에 큰 사각형에는 radius먹힘*/
						{
						
						border: 1px solid var(--input-gray);
						border-radius: 10x;
						box-sizing: border-box;
						border-collapse: collapse;
						font-size: var(--font-size16);
					}

					.userInfoTable th {
						width: 300px;
						background-color: var(--button-gray);
					}



					/*수정내용 input박스*/
					.userInfoTable .inputbox {
						box-sizing: border-box;
						height: 50px;
						/* width: inherit; */
						width: 750px;
						border: 1px solid var(--input-gray);
						font-size: 16px;
						border-radius: 6px;
						padding: 0 10px;
					}

					.userInfoTable .readonly {
						border: none;
						color: var(--color-gray);
					}

					/*테이블의 행열*/
					.userInfoTable th,
					td {
						border: 1px solid var(--input-gray);
						padding: 0 20px;
						text-align: start;
						height: 60px;
					}

					/*유효성검사*/
					.check_font {
						display: none;
					}

					/*희망직무, 기술스택 버튼들 */
					.userInfoTable .disF .position {
						display: flex;
						align-items: center;
						gap: 20px;
					}

					/*희망직무,기술스택 추가하기 버튼*/
					.userInfoTable .disF .modify {
						margin-left: auto;
						height: 44px;
						background-color: var(--main-color);
						border: none;
						color: var(--color-white);
						font-size: var(--font-size16);
						border-radius: 6px;
						cursor: pointer;
					}

					.userInfoTable .disF .stack,
					.userInfoTable .disF .workLocation {
						display: flex;
						align-items: center;
						gap: 20px;

					}


					.wishJob,
					.myStack {
						box-sizing: border-box;
						height: 50px;
						/* width: 750px; */
						border: 1px solid var(--input-gray);
						font-size: 16px;
						border-radius: 6px;
						padding: 0 10px;
						cursor: pointer;
					}


					/*수정내용 input박스*/
					input#stackInput,
					input#jobInput {
						box-sizing: border-box;
						height: 50px;
						/* width: inherit; */
						width: 750px;
						border: 1px solid var(--input-gray);
						font-size: 16px;
						border-radius: 6px;
						padding: 0 10px;
					}

					.userInfoTable .disF .workLocation select {
						width: 120px;
						height: 44px;
						border: 1px solid var(--input-gray);
						color: #787878;
						border-radius: 6px;
						cursor: pointer;
					}



					.userInfoTable td .Btn {
						background-color: var(--button-gray);
						border: 1px solid var(--input-gray);
						font-size: var(--font-size16);
						color: var(--color-gray);
						/* width: 100px; */
						height: 44px;
						padding: 10px;
						border-radius: 6px;
					}



					/*수정버튼*/
					.modifyBtn {
						display: flex;
						justify-content: center;
					}

					.buttonModify {
						background-color: #999;
						border: none;
						/* border: 1px solid var(--input-gray); */
						border-radius: 6px;
						width: 240px;
						height: 56px;
						/* margin: 40px auto; */
						font-size: 16px;
						color: var(--color-white);
						cursor: pointer;
					}
				</style>
		</head>

		<body>
			<div class="container">
				<%@ include file="nav_individual.jsp" %>
					<div class="mainContent">
						<header>
							<div class="userWrapper">
								<img src="images/people.svg" alt="">
								<div class="dorpdowmMain">
									<div class="dropdown">
										<div class="dropdownSub" id="dropdownSub">
											<h4 class="name" name="user_name" style="cursor: pointer;">${login_name}
											</h4>
											<div class="dropdownContent" id="dropdownContent">
												<a href="userInfo">
													<div>개인 정보 관리</div>
												</a>
												<a href="logout">
													<div>로그아웃</div>
												</a>
											</div> <!-- dropdownContent 끝-->
											<span class="icon">
												<i id="iconDown" class="fa-solid fa-caret-down"
													style="display: block; cursor: pointer;"></i>
												<i id="iconUp" class="fa-solid fa-caret-up"
													style="display: none; cursor: pointer;"></i>
											</span>
										</div> <!--dropdownSub 끝-->
									</div> <!--dropdown 끝-->
								</div><!--dropdownMain 끝-->
							</div>
						</header>

						<main>
							<div class="mainContainer">

								<div class="infoWrap">
									<form method="post" id="userInfoForm" name="userInfoForm" action="modifyInfo">
										<h2 class="infoTitle">회원 정보 수정</h2>
										<!-- <form method="post" action="updateMemInfo.jsp"> -->
										<!-- <form> -->
										<div class="infoConWrap">
											<div class="infoConLeft userImage" data-user-email="${userInfo.user_email}">
												<div class="uploadResult">
													<!-- <img src="images/people.svg" alt="#" class="resumeImage"> -->
													<ul class="userImage">
													</ul>
												</div>
												<div class="uploadDiv">
													<input type="file" name="uploadFile" id="fileUpload" multiple style="display: none;">
													<label for="fileUpload" style="cursor: pointer;" class="uploadText" style="display: none;">이미지 등록</label>
												</div>
												<!-- <input type="file" name="uploadFile" id="file" style="display: none;"> -->
												<!-- <label for="file" class="imgAddLabel" >
													<div class="comImage">
														<div class="building">
														</div>                                
													</div>
													<h3 style="cursor: pointer;" id="fileUpload">이미지 등록</h3>
												</label> -->
											</div>
											<div class="infoConRight">
												<table class="userInfoTable">
													<tr>
														<th>이름</th>
														<td><input class="inputbox readonly" type="text" name="user_name"
																value="${userInfo.user_name}" readonly="readonly"></td>
													</tr>
													<tr>
														<th>이메일</th>
														<td><input class="inputbox readonly" type="text" name="user_email"
																value="${userInfo.user_email}" readonly="readonly"></td>
													</tr>
													<tr>
														<th>생년월일</th>
														<td>
															<input class="inputbox" type="text" name="user_birthdate"
																id="user_birthdate" value="${userInfo.user_birthdate}"
																placeholder="생년월일을 1900-01-01형식으로 입력하세요" required>
															<div class="check_font" id="birth_check"></div>
														</td>
													</tr>
													<tr>
														<th>성별</th>
														<td>
															<input class="inputbox" type="text" name="user_gender"
																id="user_gender" value="${userInfo.user_gender}"
																placeholder="성별을 입력하세요" required>
															<div class="check_font" id="gender_check"></div>
														</td>
													</tr>
													<tr>
														<th>휴대폰</th>
														<td>
															<input class="inputbox" type="text" name="user_tel"
																id="user_tel" value="${userInfo.user_tel}"
																placeholder="전화번호를 입력하세요">
															<div class="check_font" id="tel_check"></div>
														</td>
													</tr>
													<tr>
														<th>희망직무</th>
														<td class="disF wide">
															<div class="position">
																<input class="inputbox readonly" type="text" id="jobInput"
																	name="user_job" value="${user_job}"
																	placeholder="희망직무를 선택해 주세요" onclick="openChild()"
																	readonly>
																<div class="check_font" id="job_check"></div>
															</div>
														</td>
													</tr>
													<tr>
														<th>기술스택</th>
														<td class="disF wide">
															<div class="stack">
																<input class="inputbox readonly" type="text" id="stackInput"
																	name="user_stack" value="${user_stack}"
																	placeholder="주요기술을 선택해 주세요" onclick="openChild2()"
																	readonly>
																<div class="check_font" id="stack_check"></div>
															</div>
														</td>
													</tr>
													<tr>
														<th>희망근무지역</th>
														<td class="disF">
															<div class="workLocation">
																<div class="search_box">
																	<select onchange="categoryChange(this)"
																		class="region" name="user_location"
																		id="user_location">
																		<c:choose>
																			<c:when
																				test="${userInfo.user_location != null}">
																				<option
																					value="${userInfo.user_location}"
																					selected>${userInfo.user_location}
																				</option>
																			</c:when>
																			<c:otherwise>
																				<option value>시/도 선택</option>
																			</c:otherwise>
																		</c:choose>
																		<option value="강원">강원</option>
																		<option value="경기">경기</option>
																		<option value="경남">경남</option>
																		<option value="경북">경북</option>
																		<option value="광주">광주</option>
																		<option value="대구">대구</option>
																		<option value="대전">대전</option>
																		<option value="부산">부산</option>
																		<option value="서울">서울</option>
																		<option value="울산">울산</option>
																		<option value="인천">인천</option>
																		<option value="전남">전남</option>
																		<option value="전북">전북</option>
																		<option value="제주">제주</option>
																		<option value="충남">충남</option>
																		<option value="충북">충북</option>
																	</select>
																</div>
																<div class="search_box">
																	<select id="state" class="constituency"
																		onchange="updateDistrict(this)"
																		name="user_location2" id="user_location2">
																		<c:choose>
																			<c:when
																				test="${userInfo.user_location2 != null}">
																				<option
																					value="${userInfo.user_location2}"
																					selected>${userInfo.user_location2}
																				</option>
																			</c:when>
																			<c:otherwise>
																				<option>군/구 선택</option>
																			</c:otherwise>
																		</c:choose>
																	</select>
																</div>
																<div class="check_font" id="location_check"
																	style="display: none;"></div>
															</div>
														</td>
													</tr>
													<tr>
														<th>비밀번호 확인</th>
														<td>
															<input class="inputbox" type="password" name="user_pw" placeholder="회원정보 보호를 위해 비밀번호를 입력하세요" required>
															<input type="hidden" name="session_pw" value="<%= session_pw %>">
															<div class="check_font" id="password_check"	style="display: none;"></div>
														</td>
													</tr>
												</table>
											</div><!-- infoCon right 끝 -->
										</form><!-- userInfoForm 끝 -->
									</div> <!-- infoConWrap 끝-->
									<div class="modifyBtn">
										<button class="buttonModify" type="submit">수정완료</button>
									</div>

									<!-- </form> -->
								</div> <!--infoWrap끝 : 개인정보  -->
							</div> <!-- mainContainer 끝 : 전체 1200 영역-->
						</main>
					</div><!-- mainContent-->
			</div>
			<%@ include file="footer.jsp" %>
		</body>

		</html>
		<script>

			$(document).ready(function () {
				
				/*
				2024-8-06 서연주(comRegistModify 참고)
				이미지 파일 로딩//즉시실행함수
				*/
				// user-email 변수 가져오기
				// var user_email = $(".userImage").data('user-email'); // 파일노출되는 div의 클래스명과 data이용
				var user_email = "<c:out value='${userInfo.user_email}'/>"; //c:out으로
				console.log("user_email:", user_email);

				// var uploadResultContainer = $(".userImage").find('.uploadResult ul');

				if (user_email) {
					$.ajax({
						url: '/getUserImageList',
						type: 'GET',
						data: { user_email: user_email },
						dataType: 'json',
						success: function (data) {
							console.log("Ajax success:", data);
							if(!data || data.length == 0){
								$(".uploadText").css('display', 'flex'); // 파일없으면 이미지등록 나타나게
							}
							showUploadResult(data);
						},
						error: function (xhr, status, error) {
							console.error('Error fetching file list for user_email ' + user_email + ':', error);
						}
					});
				}

			
				/*
				2024-08-06 서연주
				이미지 파일 누르면 삭제하기나 수정하기 할 수 있도록
				*/
				$(".uploadResult").on("click", "li", function (e) {
					console.log("uploadResult click");

					// 이미지 삭제 확인
					if (confirm("하나의 파일만 업로드할 수 있습니다. 삭제하고 다시 업로드 하시겠습니까?")) {
						
						// 1. 클릭된 이미지 제거
						$(this).remove();

						//2. 컨트롤러 단으로 업로든 된 실제 파일 삭제
						var targetFile = $(this).data("file");
						var type = $(this).data("type");
						
						$.ajax({
							type: "post"
							,data: {fileName: targetFile, type: type}
							,url: "deleteUserImage"
							,success: function(result){
								alert(result);
								//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
								uploadResultItem.remove();
							}
						});//end of ajax

						//3. 파일 업로드 입력 요소 트리거
						$("#uploadtext").click();
					}
				});

				/*
				2024-08-06 서연주
				파일(이미지) 업로드
				*/
				$("input[type='file']").change(function () {
				// $("#uploadtext").click(function () {
					var formData = new FormData();
					var inputFile = $("input[name='uploadFile']");
					var files = inputFile[0].files;

					for (var i = 0; i < files.length; i++) {
						if (!checkExtension(files[i].name, files[i].size)) {
							return false;
						}
						formData.append("uploadFile", files[i]);
					}

					// 파일 업로드 AJAX 요청
					$.ajax({
						type: "post",
						data: formData,
						url: "userUploadAjaxAction",
						processData: false,
						contentType: false,
						success: function (result) {
							alert("파일이 업로드 되었습니다.");
							console.log(result);
							showUploadResult(result); // 파일 업로드 결과 표시 함수 호출
						}
					});
				});


				// 파일 확장자와 크기 검사
				var regex = new RegExp("(.*?)\\.(exe|sh|alz)$"); // 정규식에서 \\를 추가하여 이스케이프 처리
				var maxSize = 5242880; // 5MB

				function checkExtension(fileName, fileSize) {
					if (fileSize >= maxSize) {
						alert("파일 사이즈 초과");
						return false;
					}
					if (regex.test(fileName)) {
						alert("해당 종류의 파일은 업로드할 수 없습니다.");
						return false;
					}
					return true;
				}



				// 업로드된 파일 목록 표시
				function showUploadResult(uploadResultArr) {
					if (!uploadResultArr || uploadResultArr.length === 0) {
						return;
					}

					var uploadUL = $(".uploadResult ul");
					var str = "";

					$(uploadResultArr).each(function (i, obj) {
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
						str += "<div>";
						str += "<span style='display:none;'>" + obj.fileName + "</span>";
						str += "<img src='/userImageDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>";//이미지 출력처리(컨트롤러단)
						str += "</div></li>";
					});

					uploadUL.append(str);
				}//showUploadResult function 끝



				//span x 영역 누르면 이미지 삭제 실행
				$(".uploadResult").on("click","span",function(){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var uploadResultItem = $(this).closest("li");

				console.log("@# targetFile=>"+targetFile);
				console.log("@# type=>"+type);
				console.log("@# uploadResultItem=>"+uploadResultItem);

					//컨트롤러 단에서 업로드된 실제파일 삭제
					$.ajax({
						type: "post"
						,data: {fileName: targetFile, type: type}
						,url: "deleteUserImage"
						,success: function(result){
							alert(result);
							//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
							uploadResultItem.remove();
						}
					});//end of ajax
				});//end of click  이미지 삭제 끝






				/*
				2024-07-12 서연주
				수정 버튼 누르면 formdata 가지고 컨트롤러로
				*/
				$("button.buttonModify").click(function (e) {
					e.preventDefault(); // 기본 폼 제출 동작 방지
					console.log("수정완료click");



					//모든 입력폼을 채웠는지 유효성 검사!
					var inval_Arr = new Array(7).fill(false);//모든 입력폼을 채웠는지 확인할 배열

					//생년월일 확인
					if (birthJ || ($('#user_birthdate').val() !== null && $('#user_birthdate').val() !== "")) {
						inval_Arr[0] = true;
					} else {
						alert("생년월일 값을 형식에 맞춰 입력해주세요.");
						$('#user_birthdate').focus();
						return; // 함수 종료
					}

					// 성별 확인
					// if(genderJ || ( $('#user_gender').val() === "남" && $('#user_gender').val() === "여")) {
					if (genderJ || ($('#user_gender').val() !== null && $('#user_gender').val() !== "")) {
						inval_Arr[1] = true;
					} else {
						alert("남/여 둘 중 하나를  입력해주세요.");
						$('#user_gender').focus();
						return; // 함수 종료
					}

					// 전화번호(휴대폰)확인
					if (phoneJ || ($('#user_tel').val() !== null && $('#user_gender').val() !== "")) {
						inval_Arr[2] = true;
					} else {
						alert("전화번호를 입력해주세요.");
						$('#user_tel').focus();
						return; // 함수 종료
					}

					// 희망직무 확인
					if ($('#jobInput').val() !== null && $('#jobInput').val() !== "") {
						console.log($('#jobInput').val());
						inval_Arr[3] = true;
					} else {
						alert("희망직무를 입력해주세요.");
						$('#jobInput').focus();
						return; // 함수 종료
					}

					// 기술스택 확인
					if ($('#stackInput').val() !== null && $('#stackInput').val() !== "") {
						inval_Arr[4] = true;
					} else {
						alert("기술스택을 입력해주세요.");
						$('#stackInput').focus();
						return; // 함수 종료
					}

					// 희망근무지역1 확인
					if ($('#user_location').val() !== null && $('#user_location').val() !== "") {
						inval_Arr[5] = true;
					} else {
						alert("희망근무지역을 입력해주세요.");
						$('#user_location').focus();
						return; // 함수 종료
					}
					// 희망근무지역2 확인
					if ($('#user_location2').val() !== null && $('#user_location2').val() !== "") {
						inval_Arr[6] = true;
					} else {
						alert("희망근무지역을 입력해주세요.");
						$('#user_location2').focus();
						return; // 함수 종료
					}


					var validAll = true;
					for (var i = 0; i < inval_Arr.length; i++) {

						if (inval_Arr[i] == false) {
							validAll = false;
						}
					}

					if (validAll) { // 유효성 모두 통과
						// alert('모든 정보를 정확히 입력하셨습니다.');
						console.log('모든 정보를 정확히 입력하셨습니다.');
					} else {
						alert('모든 정보가 입력되어야 합니다.')
						return; // 함수 종료
					}
					


					var formObj = $("form[id='userInfoForm']");
					var user_email = "<c:out value='${userInfo.user_email}'/>"; //c:out으로
					console.log(user_email)
					//업로드된 파일정보 hidden타입 input으로 body에 추가하기
					var str = "";

					$(".uploadResult ul li").each(function (i, obj) {
						var jobj = $(obj);
						str += "<input type='hidden' name='userAttachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
						str += "<input type='hidden' name='userAttachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
						str += "<input type='hidden' name='userAttachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
						str += "<input type='hidden' name='userAttachList[" + i + "].image' value='" + jobj.data("type") + "'>";
						str += "<input type='hidden' name='userAttachList[" + i + "].user_email' value='${userInfo.user_email}'>";
					});//파일정보 추가 끝
					formObj.append(str).submit();

					// let formData = new FormData();
					// let inputs = $("input");  //document의 input element 전부
					// let selects = $("select"); //document의 select element 전부

					// for (let i = 0; i < inputs.length; i++) {// FormData에 input에 담긴 데이터 담기
					// 	const name = inputs[i].name;
					// 	const value = inputs[i].value;

					// 	formData.append(name, value);
					// }

					// for (let i = 0; i < selects.length; i++) {// FormData에 select에 담긴 데이터 담기
					// 	const name = selects[i].name;
					// 	const value = selects[i].value;

					// 	formData.append(name, value);
					// }

					// for (let pair of formData.entries()) {// FormData에 데이터가 제대로 담겼는지 확인
					// 	console.log(pair[0] + ', ' + pair[1]);
					// }

					// // formData.submit(); 배열정보가 있어서 그냥 submit 은 안되는듯..
					// // AJAX 요청 수행
					// $.ajax({
					// 	type: "post", // 요청 메소드 유형
					// 	processData: false,  // 문자열화 방지
					// 	contentType: false, //application/x-www 방지 ...
					// 	// dataType : 'json',
					// 	data: formData, // 전송할 데이터
					// 	enctype: 'multipart/form-data',
					// 	async: false,
					// 	url: "/modifyInfo", // 요청을 보낼 URL
					// 	success: function (data) {
					// 		alert("수정 완료"); // 성공 시 알림
					// 		location.href = "userInfo"; // 성공 시 페이지 리다이렉트
					// 	},
					// 	error: function () {
					// 		alert("수정을 완료하지 못했습니다. 비밀번호를 확인해 주세요"); // 오류 시 알림
					// 	}
					// });//end of jax
				});;//수정하기 버튼 클릭 function 끝




				//생년월일 유효성 검사(yyyy-mm-dd 형식) : 0805 연주 추가
				var birthJ = false;

				// 생년월일	birthJ 유효성 검사
				// $('#user_birthdate').focus(function(){//input 창에 들어왔을 때
				// $('#user_birthdate').blur(function(){//input 창을 벗어났을 때
				$('#user_birthdate').on('input', function () {//입력필드에 입력할 때 마다
					var dateStr = $(this).val();

					// 정규식을 이용하여 YYYY-MM-DD 형식과 두 자리 월/일 검사
					var dateFormat = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;

					// 날짜가 올바른 형식인지 확인
					if (dateFormat.test(dateStr)) {
						var year = Number(dateStr.substr(0, 4)); // 입력한 값의 0~4자리까지 (연)
						var month = Number(dateStr.substr(5, 2)); // 입력한 값의 5번째 자리부터 2자리 숫자 (월)
						var day = Number(dateStr.substr(8, 2)); // 입력한 값 9번째 자리부터 2자리 숫자 (일)
						var today = new Date(); // 날짜 변수 선언
						var yearNow = today.getFullYear(); // 올해 연도 가져옴

						// 연도의 경우 1900보다 작거나 yearNow보다 크다면 false를 반환합니다.
						if (1900 > year || year > yearNow) {
							$('#birth_check').text('생년월일을 1900-01-01형식으로 입력하세요');
							$('#birth_check').css({ "display": "flex", "color": "red" });
						} else if (month < 1 || month > 12) {
							$('#birth_check').text('생년월일을 1900-01-01형식으로 입력하세요');
							$('#birth_check').css({ "display": "flex", "color": "red" });
						} else if (day < 1 || day > 31) {
							$('#birth_check').text('생년월일을 1900-01-01형식으로 입력하세요');
							$('#birth_check').css({ "display": "flex", "color": "red" });
							$('#user_birthdate').focus;
						} else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
							$('#birth_check').text('생년월일을 1900-01-01형식으로 입력하세요');
							$('#birth_check').css({ "display": "flex", "color": "red" });
						} else if (month == 2) { // 윤달 확인
							var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
							if (day > 29 || (day == 29 && !isleap)) {
								$('#birth_check').text('생년월일을 1900-01-01형식으로 입력하세요');
								$('#birth_check').css({ "display": "flex", "color": "red" });
							} else {
								// $('#birth_check').text('');
								birthJ = true;
								$('#birth_check').css('display', 'none');
							}
						} else {
							// $('#birth_check').text('');
							birthJ = true;
							$('#birth_check').css('display', 'none');
						}
					} else {
						// 형식이 맞지 않거나 두 자리 수가 아닐 때
						$('#birth_check').text('생년월일을 1900-01-01형식으로 입력하세요');
						$('#birth_check').css({ "display": "flex", "color": "red" });
					}

				}); //생년월일 유효성 검사 끝	


				// 휴대전화 유효성 검사
				var phoneJ = false;

				$('#user_tel').on('input', function () {	// 입력 필드에 입력할 때마다
					var dateStr = $(this).val();
					console.log(dateStr);

					// 정규식을 이용하여 YYYY-MM-DD 형식과 두 자리 월/일 검사
					var dateFormat = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;

					if (dateFormat.test(dateStr)) {   //올바른 형식인지 확인
						phoneJ = true;
						$('#tel_check').css('display', 'none'); // 유효하면 메시지를 숨김
					} else {
						$('#tel_check').text('휴대폰번호를 010-1111-2222 형식으로 입력해주세요.');
						$('#tel_check').css({ "display": "flex", "color": "red" });
					}
				});// 휴대전화 유효성 검사 끝



				// 성별 유효성 검사
				var genderJ = false;

				$('#user_gender').on('input', function () {	// 입력 필드에 입력할 때마다

					const gender = $(this).val();
					if (gender === "남" || gender === "여") {
						// 입력이 "남" 또는 "여"인 경우
						console.log("유효한 성별 입력:", gender); // 콘솔 로그에 유효한 입력 출력
						genderJ = true;
						$('#gender_check').css('display', 'none'); // 유효하면 메시지를 숨김
					} else {
						// 입력이 유효하지 않은 경우
						$('#gender_check').text('남/여 둘 중 하나를 입력해주세요.');
						$('#gender_check').css({ "display": "flex", "color": "red" });
					}
				});// 성별 유효성 검사 끝



				// 희망직무 유효성 검사

				$('#jobInput').on('input', function () {	// 입력 필드에 입력할 때마다

					const user_job = $(this).val();
					if (user_job === null || user_job === "") {// 입력이 null 또는 ""인 경우

						console.log("유효한 성별 입력:", gender); // 콘솔 로그에 유효한 입력 출력
						genderJ = true;
						$('#gender_check').css('display', 'none'); // 유효하면 메시지를 숨김
					} else {
						// 입력이 유효하지 않은 경우
						$('#gender_check').text('남/여 둘 중 하나를 입력해주세요.');
						$('#gender_check').css({ "display": "flex", "color": "red" });
					}
				});// 희망직무 유효성 검사 끝







			});//end of document ready





			// 추가하기 버튼 클릭 시 희망 직무/기술 스택 팝업 오픈
			//( 0805 연주 수정:자식 창이 로드된 후에 접근할 수 있도록 onload 이벤트 리스너를 사용)
			let openWin;

			function openChild() {
				// 부모창 이름 설정
				window.name = "parentForm";

				// 자식 창 열기
				openWin = window.open("userInfoModifyPop", "childForm", "width=548, height=620, resizable=no, scrollbars=no");

				// 창이 열렸는지 확인하고 값 가져오기
				openWin.onload = function () {
					// cInput 요소가 존재할 때 값 가져오기
					const value = openWin.document.getElementById("cInput") ? openWin.document.getElementById("cInput").value : '';
					console.log("cInput value:", value);
				};

			}
			function openChild2() {
				// 부모창 이름 설정
				window.name = "parentForm";

				// 자식 창 열기
				openWin = window.open("userInfoModifyPop2", "childForm", "width=548, height=620, resizable=no, scrollbars=no");

				// 창이 열렸는지 확인하고 값 가져오기
				openWin.onload = function () {
					// cInput2 요소가 존재할 때 값 가져오기
					const value2 = openWin.document.getElementById("cInput2") ? openWin.document.getElementById("cInput2").value : '';
					console.log("cInput2 value:", value2);
				};

			}








			//희망근무지역 선택 셀렉박스 기능
			function categoryChange(e) {
				const state = document.getElementById("state");

				const gangwon = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
				const gyeonggi = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
				const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
				const gyeongsangbuk = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
				const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
				const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
				const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
				const busan = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
				const seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
				const ulsan = ["남구", "동구", "북구", "중구", "울주군"];
				const incheon = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
				const jeonnam = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
				const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
				const jeju = ["서귀포시", "제주시", "남제주군", "북제주군"];
				const chungnam = ["천안시", "아산시", "서산시", "당진시", "홍성군", "보령시", "논산시", "공주시", "계룡시", "서천군", "부여군", "청양군", "태안군", "금산군", "예산군"];
				const chungbuk = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];


				if (e.value == "강원") {
					add = gangwon;
				} else if (e.value == "경기") {
					add = gyeonggi;
				} else if (e.value == "경남") {
					add = gyeongsangnam;
				} else if (e.value == "경북") {
					add = gyeongsangbuk;
				} else if (e.value == "광주") {
					add = gwangju;
				} else if (e.value == "대구") {
					add = daegu;
				} else if (e.value == "대전") {
					add = daejeon;
				} else if (e.value == "부산") {
					add = busan;
				} else if (e.value == "서울") {
					add = seoul;
				} else if (e.value == "울산") {
					add = ulsan;
				} else if (e.value == "인천") {
					add = incheon;
				} else if (e.value == "전남") {
					add = jeonnam;
				} else if (e.value == "전북") {
					add = jeonbuk;
				} else if (e.value == "제주") {
					add = jeju;
				} else if (e.value == "충남") {
					add = chungnam;
				} else if (e.value == "충북") {
					add = chungbuk;
				}

				state.options.length = 1;

				// "전체" 옵션 추가
				let allOption = document.createElement("option");
				allOption.value = "전체";
				allOption.innerHTML = "전체";
				state.appendChild(allOption);

				// 군/구 갯수;

				for (property in add) {
					let opt = document.createElement("option");
					opt.value = add[property];
					opt.innerHTML = add[property];
					state.appendChild(opt);
				}
				document.getElementById("notice_area1").value = e.value; // 시/도 값을 설정
			}

			function updateDistrict(element) {
				document.getElementById("notice_area2").value = element.value; // 군/구 값을 설정
			}



			// 드롭다운 메뉴 (하지수)

			function dropdown() {
				let click = document.getElementById("dropdownContent");
				let iconDown = document.getElementById("iconDown");
				let iconUp = document.getElementById("iconUp");

				if (click.style.display === "none" || click.style.display === "") {
					click.style.display = "block";
					iconDown.style.display = "none";
					iconUp.style.display = "block";
				} else {
					click.style.display = "none";
					iconDown.style.display = "block";
					iconUp.style.display = "none";
				}
			}
			document.getElementById("dropdownSub").addEventListener("click", dropdown); // 드롭다운 메뉴 끝
		</script>