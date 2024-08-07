<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 상세페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice_board_detail.css">
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
						<form id="boardForm" method="post" action="noticeBoardModifyView">  <!--  폼 시작 -->
							
							<input type='hidden' name='login_email' id='login_email' value='${login_email}'>
							
							<input type="hidden" name="board_no" value="${pageMaker.board_no}">
							<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.amount}">
						
		                    <div class="titlebox">
		                        <h5 class="title">
		                            ${boardDetailView.board_title}
		                        </h5>
		                    </div> 
		                    <div class="namebox">
		                        <h5 class="name">
		                            ${boardDetailView.login_email} ${boardDetailView.board_no}번째글
		                        </h5>
		                    </div> <!-- 네임 끝 -->
		                    <div class="lastline">
		                        <div class="line1">
		                            <div class="datebox">
		                                <h5 class="date">
		                                    ${boardDetailView.create_date}
		                                </h5>
		                            </div>
		                            <div class="selectbox">
		                                <h5 class="select">
		                                    조회수 ${boardDetailView.board_hit}
		                                </h5>
		                            </div>
		                            <div class="heartbox">
		                                <h5 class="heart">
		                                    추천수 ${boardDetailView.board_like_count}
		                                </h5>
		                            </div>
		                        </div>
		                        <div class="line2">
									<div class="rightb1box">
										<h5 class="r2">
											<a href="#" id="likeButton" class="r1">
												추천하기
											</a>
										</h5>
									</div>
									
		                            <div class="rightb2box">
		                                <div>
		                                    <h5 class="r2">
												<span >
													<a href="#" onclick="clip(); return false;" class="r1">
														URL복사
													</a>
												</span>
		                                    </h5>
		                                </div>
		                            </div>
		                        </div>
		                    </div> <!-- 라스트라인 끝 -->
							
							    <div id="uploadSection" class="lastline">
							        <div class="uploadResult"><ul></ul></div>
							    </div>

							    <div class="boardcontent">
							        <div class="contentbox">
							            <h5 class="content">${boardDetailView.board_content}</h5>
							        </div>
							    </div>

								<!-- 버튼과 댓글 작성 폼을 동적으로 추가할 요소 -->
								<div id="buttonbox" class="buttonbox">
								    <!-- 여기에 동적으로 추가되는 버튼들이 위치하게 됩니다. -->

								    <button type="submit" formaction="noticeBoardList" class="button">
								        <h5 class="but2">목록</h5>
								    </button>
								</div>
								
				<!--			    <div id="commentBox" class="combox"></div>-->
							</form>   <!--폼 끝-->
						<div id="comment-list">
							<div class="divcom">
								<c:forEach items="${commentList}" var="comment">
									<div class="divcom1">
										<h5 class="comh1">${comment.login_email}</h5>
										<h5 class="comh2">${comment.commentContent}</h5>
										<div class="comh3">
											<fmt:formatDate value="${comment.commentCreatedTime}" pattern="yyyy-MM-dd HH:mm" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- 댓글 끝-->
						
	                </div> <!--보드 끝-->  <!-- 최소 여기에는 값 넣어야지 css 쓸 수 있음-->


	            </div> <!-- wrap 끝 -->
	        </section> <!--section 끝 -->
			
			<!-- url복사 -->
			<div class="hid">
				<textarea></textarea>
			</div>
		<%@ include file="footer.jsp" %>
</body>

<script>
    // 댓글 작성 함수
    const commentWrite = () => {
        const email = document.getElementById("login_email").value;
        const content = document.getElementById("commentContent").value.trim();
        const no = "${boardDetailView.board_no}";

        // 내용이 비어 있거나 공백만 있을 때
        if (!content) {
            alert("내용이 없습니다.");
            return; // 함수 종료
        }

        $.ajax({
            type: "POST",
            data: {
                login_email: email,
                commentContent: content,
                board_no: no
            },
            url: "/noticeBoardComment/noticeBoardSave",
            success: function() {
                console.log("작성 성공");
                location.reload(); // 페이지 새로고침
            },
            error: function() {
                console.log("실패");
            }
        });
    };

    $(document).ready(function () {  
        console.log("@# document ready");

        // 즉시 실행 함수
        (function() {
            var board_no = "<c:out value='${boardDetailView.board_no}'/>";
            console.log("@# board_no=>" + board_no);

            $.getJSON("/noticeGetFileList", { board_no: board_no }, function (arr) {
                console.log("@# arr=>" + arr);

                var str = "";
                var hasFiles = false; // 파일이 있는지 여부를 체크하는 변수

                $(arr).each(function (i, attach) {
                    var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
                    str += "<li data-path='" + attach.uploadPath + "'";
                    str += " data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.image + "'";
                    str += " ><div>";
                    str += "<span>" + attach.fileName + "</span>";
                    str += "</div></li>";
                    hasFiles = true; // 파일이 있음을 표시
                });

                if (hasFiles) {
                    $(".uploadResult ul").html(str);
                } else {
                    $("#uploadSection").hide(); 
                }
            });

            $(".uploadResult").on("click", "li", function (e) {
                var liObj = $(this);
                var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
                if (liObj.data("type")) {
                    self.location = "/download?fileName=" + path;
                } else {
                    self.location = "/download?fileName=" + path;
                }
            });

            function showImage(fileCallPath) {
                $(".bigPicture").css("display", "flex").show();
                $(".bigPic")
                    .html("<img src='/display?fileName=" + fileCallPath + "'>")
                    .animate({ width: "100%", height: "100%" }, 1000);
            }

            $(".bigPicture").on("click", function (e) {
                $(".bigPic")
                    .animate({ width: "0%", height: "0%" }, 1000);
                setTimeout(function () {
                    $(".bigPicture").hide();
                }, 1000);
            });
        })();

        // 댓글 작성 관련
		const loginUserType = "${login_usertype}";
		const login_email = "${login_email}";
		const authorEmail = "${boardDetailView.login_email}";
		
		
		// 관리자인 경우 또는 작성자와 로그인한 사용자의 이메일이 같은 경우
		if (loginUserType === "3" || login_email === authorEmail) {
		    // 수정 버튼 추가
		    if ($('#buttonbox').find('button:contains("수정")').length === 0) {
		        $('#buttonbox').prepend(`
		            <button type="button" class="button" onclick="validateAndSubmit('noticeBoardModifyView')">
		                <h5 class="but1">수정</h5>
		            </button>
		        `);
		    }
		    // 삭제 버튼 추가
		    if ($('#buttonbox').find('button:contains("삭제")').length === 0) {
		        $('#buttonbox').prepend(`
		            <button type="button" class="button" onclick="validateAndSubmit('noticeBoardDelete')">
		                <h5 class="but2">삭제</h5>
		            </button>
		        `);
		    }
		}
		
		const commentCount = ${commentList.size()};

		    
		    if (loginUserType === "3" || login_email === authorEmail) {
		        const commentBoxHtml = `
				<div id="commentBox" class="combox">
				    <input type="text" id="commentContent" class="commentbox" placeholder="내용을 입력해주세요">
				    <div class="buttonbox2">
				        <button type="button" onclick="commentWrite()" class="button">
				            <h5 class="but2">등록</h5>
				        </button>
				    </div>
				</div>
		        `;

		        $('#buttonbox').after(commentBoxHtml);
		    }else if (commentCount > 0){
				const commentBoxHtml = `
		            <div id="commentBox" class="comboxbox">
		            </div>
		        `;

		        $('#buttonbox').after(commentBoxHtml);
			}
		

        // 좋아요 버튼 클릭 시
        $('#likeButton').on('click', function (e) {
            e.preventDefault(); // 기본 동작 방지

            const board_no = "${boardDetailView.board_no}";
            const login_email = "${login_email}"; // 현재 로그인한 사용자의 이메일

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/noticeBoardLike",
                data: {
                    board_no: board_no,
                    login_email: login_email
                },
                success: function(response) {
                    alert(response);
                    let likeCountElement = $('.heartbox h5.heart');
                    let currentLikeCount = parseInt(likeCountElement.text().replace('추천수 ', ''));
                    likeCountElement.text('추천수 ' + (currentLikeCount + 1));
                },
                error: function(xhr, status, error) {
                    if (xhr.status === 409) {
                        alert(xhr.responseText);
                    } else {
                        alert('추천수 처리에 실패했습니다.');
                    }
                }
            });
        });
    });

    function validateAndSubmit(action) {
        const login_email = document.getElementById("login_email").value;
        const authorEmail = "${boardDetailView.login_email}";
        const loginUserType = "${login_usertype}";
        const form = document.getElementById("boardForm");

        if (login_email !== authorEmail && loginUserType !== '3') {
            alert("작성자만 수정 및 삭제할 수 있습니다.");
            return;
        }

        if (action === 'noticeBoardDelete') {
            if (confirm("정말로 삭제하시겠습니까?")) {
                form.action = action;
                form.submit();
            }
        } else {
            form.action = action;
            form.submit();
        }
    }

    function clip() {
        var url = window.document.location.href;
        var textarea = document.createElement("textarea");
        document.body.appendChild(textarea);
        textarea.value = url;
        textarea.select();
        document.execCommand("copy");
        document.body.removeChild(textarea);
        alert("URL이 복사되었습니다.");
    }
</script>
	
</html>








