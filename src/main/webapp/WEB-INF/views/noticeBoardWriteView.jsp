<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 상세페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice_board_write.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>-->
	
	<script>
		function fn_submit(){
			//form 요소 자체
			var formData = $("#frm").serialize();

			$.ajax({
				 type:"post"
				,data:formData
				,url:"noticeBoardWrite"
				,success: function(data){
					alert("저장완료");
					location.href="noticeBoardList";
				}
				,error: function(){
					alert("오류발생");
				}
			});
		}
	</script>
</head>

<body>
	<%@ include file="header.jsp" %>

	<!-- 섹션-->
	        <section> 
	            <div class="wrap">     
	                <div class="board">

						<form id="frm" method="post" action="noticeBoardWrite"> <!-- 폼 시작 -->
						<input type='hidden' name='login_email' value='${logim_email}'>
						
		                    <div class="headbox">
		                        <h5 class="head">
		                            글쓰기
		                        </h5>
		                    </div> 
		             
		                    <div class="titlebox"> <!-- 제목 -->
		                        <input class="title" type="text" name="board_title" id="title" placeholder="제목을 입력해 주세요" >
		                    </div> <!-- 콘텐트박스 끝-->
	
								

							
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>

							<div class="uploadResult">
								<ul>

								</ul>
							</div><!--업로드 끝 -->

										
		                    <div class="uploadbox"> <!-- css설정 주기위해서 남겨둠 -->
							</div>
								
							
		                    <div class="contentbox"> <!-- 글 내용-->
		                        <textarea class="content" name="board_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
		                    </div>
	
		                    <div class="buttonbox">
		                        <button id="wri" class="button" type="submit" >
		                            <h5 class="but1">등록</h5>
		                        </button>
		                        <button formaction="noticeBoardList" class="button" type="list">
		                            <h5 class="but2">취소</h5>
		                        </button>
		                    </div><!--버튼 끝 -->
						</form> <!-- 폼 끝 -->
							
	                </div> <!--보드 끝-->

	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->


		<%@ include file="footer.jsp" %>
</body>
</html>

<script>
	$(document).ready(function () {
		var formObj = $("form[id='frm']");

		// 폼 제출 버튼 클릭 이벤트
		$("button[type='submit']").on("click", function (e) {
			e.preventDefault(); // 기본 폼 제출 방지
			console.log("submit clicked");

			// 제목과 내용의 유효성 검사
			var title = $("#title").val().trim();
			var content = $("#content").val().trim();

			if (title.length === 0) {
				alert("제목을 입력해 주세요");
				$("#title").focus();
				return false; // 폼 제출 방지
			}

			if (content.length === 0) {
				alert("내용을 입력해 주세요");
				$("#content").focus();
				return false; // 폼 제출 방지
			}

			var str = "";

			// 업로드된 파일 정보를 폼에 추가
			$(".uploadResult ul li").each(function (i, obj) {
				var jobj = $(obj);
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].image' value='" + jobj.data("type") + "'>";
			});

			console.log(str);
			formObj.append(str).submit(); // 유효성 검사 통과 시 폼 제출
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

		// 파일 선택 시 이벤트 처리
		$("input[type='file']").change(function () {
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
				url: "noticeUploadAjaxAction",
				processData: false,
				contentType: false,
				success: function (result) {
					alert("파일이 업로드 되었습니다.");
					console.log(result);
					showUploadResult(result); // 파일 업로드 결과 표시 함수 호출
				}
			});
		});

		// 업로드된 파일 목록 표시
		function showUploadResult(uploadResultArr) {
			if (!uploadResultArr || uploadResultArr.length === 0) {
				return;
			}

			var uploadUL = $(".uploadResult ul");
			var str = "";

			$(uploadResultArr).each(function (i, obj) {
				var fileCallPath = encodeURIComponent(obj.uploadPath + (obj.image ? "/s_" : "/") + obj.uuid + "_" + obj.fileName);
				str += "<li data-path='" + obj.uploadPath + "'";
				str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "<div><span>" + obj.fileName + "</span>";
				str += "<span data-file='" + fileCallPath + "' data-type='" + (obj.image ? "image" : "file") + "'> [삭제] </span>";
				str += "</div></li>";
			});

			uploadUL.append(str);
		}

		// 파일 삭제 이벤트 처리
		$(".uploadResult").on("click", "span", function () {
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var uploadResultItem = $(this).closest("li");

			$.ajax({
				type: "post",
				data: { fileName: targetFile, type: type },
				url: "noticeDeleteFile",
				success: function (result) {
					alert("파일이 삭제 되었습니다.");
					uploadResultItem.remove(); // 파일 삭제 후 목록에서 제거
				}
			});
		});
	});
</script>











