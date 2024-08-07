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
<title>개인-스크랩 공고</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/individualMain.css"> -->
<!--<link rel="stylesheet" href="src/main/resources/static/css/style.css">-->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<style>
	:root 
	{
	  /* 컬러 모음 */
	  --main-color:#FFA500;
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
	.dorpdowmMain
	{
	display: flex;
	}

	.dropdown
	{
	display: flex;
	align-items: center;
	}

	.dropdownSub
	{
	display: flex;
	}

	.dropdownContent 
	{
	position: absolute;
	display: none;
	text-align: center;
	margin-top: 20px;
	width: 160px;
	background-color: var(--color-white);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0,0,0,0.2);
	right: 11px;
	}

	.dropdownContent a 
	{
	color: var(--color-black);
	padding: 12px;
	text-decoration: none;
	display: block;
	font-size: var(--color-black);
	}

  

	/* 메인 */
	main 
	{
	display: flex;
	justify-content: center;
	padding: 50px 0 120px;  
	}

	main .mainContainer
	{
		display: flex;
		flex-direction: column; 
		min-width:1200px;
		gap: 40px 0;
	}


	/* 프로필 : 사진 + 이름 */
	main .mainContainer .memberInfo 
	{
	display: flex;
	align-items: center;
	margin-bottom: 40px;
	}

	main .mainContainer .memberInfo img.memberImg 
	{
	width:64px;
	height: 64px;
	margin-right: 20px;
	}

	main .mainContainer .memberInfo .memberName 
	{
	font-size: var(--font-size32);
	font-weight: 600;
	} 


	/* 타이틀 + 숫자*/
	.mainContainer .subtitle
	{
		display: flex;
		font-size: var(--font-size32);
		color: var(--color-black);
		/* margin-top: 70px; */
		gap : 0 20px;
  
	}

	.mainContainer .subtitle .listNum
	{
	color: var(--main-color);
	}



/*sort tab 전체*/
.mainContainer .searchWrap
{
  display: flex;
  max-width: 1200px;
  margin-bottom: 10px;
  padding-left: 20px;
}

/*sort tab 왼쪽*/
.mainContainer .searchWrap .optionSortLeft
{
  display: flex;
  align-items: center;
  gap : 10px;
}

/*sort tab 왼쪽*/
.mainContainer .searchWrap .optionSortLeft input[type="checkbox"]
{
  width: 20px;
  height: 20px;
  border-radius: 3px;
  border:1px solid var(--border-color-gray);
  cursor: pointer;
}



/*삭제버튼*/
.selectDel {
					padding: 8px 20px;
					border: 1px solid var(--input-gray);
					font-size: var(--font-size14);
					border-radius: 6px;
					background-color: var(--color-white);
					cursor: pointer;
					color: #777;
				}

.selectDel:hover
{
  border: 1px solid var(--main-color);
  background-color: var(--main-color);
  color: var(--color-white);
}



/* sort 탭*/
.mainContainer .searchWrap .optionSortLeft .custom-select
{
  width: 180px;
  /* height: 36px; */
  border:1px solid var(--input-gray);
  font-size: var(--font-size14);
  border-radius: 6px;
  padding-left: 15px;
  color: #777;
  padding: 8px 10px;
  cursor: pointer;
}


/*sort tab 오른쪽 검색하기*/
.mainContainer .searchWrap .optionSorRight
{
  margin-left: auto ;
  display: flex;
  gap : 10px;
}


/* 검색창*/
.mainContainer .searchWrap .optionSorRight input
{
  width: 240px;
  border:1px solid var(--input-gray);
  font-size: var(--font-size14);
  border-radius: 6px;
  color: #777;
  padding: 8px 10px;
  cursor: pointer;
}

/*검색하기 버튼*/
.searchBtn
{
  /* width: 78px; */
  background-color: var(--color-white);
  border: 1px solid var(--input-gray);
  color: #777;
  font-size: var(--font-size14);
  border-radius: 6px;
  padding: 8px 10px;
  cursor: pointer;
}

.searchBtn:hover
{
    border: 1px solid var(--main-color);
    background-color: var(--main-color);
    color: var(--color-white);
	}


/*공고 박스 리스트*/
main .mainContainer .jobPostList
{
  display: flex;
  flex-direction: column;
  gap: 20px 0;
}

/*하나의 공고 박스*/
.mainContainer .jobPostList .postBox
{
  display: flex;
  border: 1px solid var(--input-gray);
  border-radius: 10px;
  box-sizing: border-box;
  padding: 20px;
  width: 1200px;
  height: 140px;
}

/*공고 박스 왼쪽*/
.mainContainer .jobPostList .postBox .boxLeft
{
  width: 166px;
  display: flex;
  align-items:center;
  gap: 0 20px;
  }
.mainContainer .jobPostList .postBox .boxLeft input
{
  width: 20px;
  height: 20px;
  border:1px solid var(--border-color-gray);
  cursor: pointer;
}


.com_name , .jobPostTitle, p.submitResume
{
  font-size: var(--font-size14);
  color: #777;
  cursor: pointer;
}

/*공고 박스 중간*/
.mainContainer .jobPostList .postBox .boxMiddle
{
  width: 794px;
  display: flex;
  flex-direction: column;
  /* align-items:center; */
  justify-content:center;
  gap: 10px 0;
  /* margin-left: 40px; */
}

.postBox .boxMiddle .jobPostTitle
{
  font-size: var(--font-size16);
  color: #555;
  cursor: pointer;
}

.postBox .boxMiddle .jobPostInfo
{
  display: flex;
  gap: 10px;
  font-size: var(--font-size14);
  color: var(--color-gray);
  
}

.postBox .boxMiddle .resumeInfo 
{
  display: flex;
  gap: 10px;
  align-items: baseline;
}
.postBox .boxMiddle .resumeInfo a
{
  color: var(--color-gray);
  text-decoration: underline;
  font-size: var(--font-size14);
}
.postBox .boxMiddle .resumeInfo .statusCon
{
  display: flex;
  gap: 7px;
  align-items: baseline;
  cursor: pointer;
}

.postBox .boxMiddle .resumeInfo i
{
  font-size: 14px;
}

.postBox .boxMiddle .resumeInfo  
{
  display: flex;
  gap: 10px;
}
.postBox .boxMiddle .resumeInfo .resumeIcon
{
  height: 16px;
}
.postBox .boxMiddle .resumeInfo p
{
  font-size: var(--font-size14);
  /* text-decoration: underline; */
}

.boxMiddle .resumeInfo .submitDate 
{
  display: flex;
  gap: 10px;
  font-size: var(--font-size14);
  color: var(--color-gray);
}


/*공고 박스 오른쪽*/
.mainContainer .jobPostList .postBox .boxRight
{
  width: 220px;
  display: flex;
  font-size: var(--font-size14);
  gap: 10px;
  color: var(--color-gray);
}

/*지원상태 탭*/
.postBox .boxRight .submitCon,
.postBox .boxRight .postCon

{
  width: 90px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items:center;
  margin-top: 32px;
}





button.submitTab,
button.postStatus
{
  border:1px solid var(--input-gray);
  font-size: var(--font-size14);
  border-radius: 6px;
  padding-left: 15px;
  color: #777;
  background-color: #f7f7f7;
  padding: 8px 10px;
  width: 80px;
}




/*휴지통아이콘*/
.postBox .boxRight .delIcon
{
  width: 20px;
  display: flex;
  align-items:center;
  justify-content:center;
  cursor: pointer;
} */
.postBox .boxRight .delIcon i
{
  font-size: 16px;
  color: var(--color-black);
}

/* 페이징커스텀 */
.div_page 
	{
		margin-top: 40px;	
	}

	.div_page ul 
	{
		display: flex;
		align-items: center;
		justify-content: center;	
		gap: 0 20px;
	}

	.paginate_button 
	{
		text-decoration: none;
		padding: 8px 14px;
		border-radius: 6px;
	}
	.paginate_button a 
	{
		color: #111;
	}






	
</style>
</head>
<body>
	<div class="container">
		<%@ include file="nav_individual.jsp" %>
	     <div class="mainContent">        
	        <header>
            <div class="userWrapper">
                <img src="images/people.svg"alt="">
                <div class="dorpdowmMain">
                    <div class="dropdown">
                        <div class="dropdownSub" id="dropdownSub">
                            <h4 class="name" name="user_name" style="cursor: pointer;">${login_name}</h4>
                            <div class="dropdownContent" id="dropdownContent">
                                <a href="userInfo"><div>개인 정보 관리</div></a>
                                <a href="logout"><div>로그아웃</div></a>
                            </div> <!-- dropdownContent 끝-->
                            <span class="icon">
                                <i id="iconDown" class="fa-solid fa-caret-down" style="display: block; cursor: pointer;"></i>
                                <i id="iconUp" class="fa-solid fa-caret-up" style="display: none; cursor: pointer;"></i>
                            </span>
                        </div> <!--dropdownSub 끝-->
                    </div> <!--dropdown 끝-->
                </div><!--dropdownMain 끝-->
            </div>
          </header>    
            <main>
                <div class="mainContainer">
                    <div class="subtitle">
                      <h4 class="title">스크랩 공고</h4>
                      <h4 class="listNum">${pageMaker.total}</h4>
                    </div>
                    <div class="listTable">
                        <form method="get" id="searchForm">
                          <div class="searchWrap">
                              <div class="optionSortLeft">
                                  <input type="checkbox" id="check_all" value="회사명">
                                  <button class="selectDel">삭제</button>
                                  <!-- <select id="orderByUpdate" class="custom-select" onchange="orderByUpdate(this.value);"> -->
                                  <!-- <select id="orderByUpdate" class="custom-select" onchange="switchTab(this.value,event);"> -->
                                  <select id="orderBy" name="orderBy" class="custom-select" onchange="switchTab(this.value);">
                                  <!-- <select id="orderByUpdate" class="custom-select"> -->
                                      <option disabled selected>공고등록순</option>
                                      <option value="desc" <c:if test="${pageMaker.cri.orderBy == 'desc'}">selected='selected'</c:if>>최신순</option>
                                      <option value="asc" <c:if test="${pageMaker.cri.orderBy == 'asc'}">selected='selected'</c:if>>오래된순</option>
                                      <!-- <option value="${pageMaker.cri.orderBy}" <c:if test="${pageMaker.cri.orderBy == 'asc'}">selected='selected'</c:if>>오래된순</option> -->
                                  </select>
                                  <!-- <select id="orderBySubmit" class="custom-select" onchange="switchTab2(this.value,event);"> -->
                                    <select id="orderBy" name="orderBy" class="custom-select" onchange="switchTab(this.value);">
                                      <option disabled selected>지원여부</option>
                                      <option value="submit" <c:if test="${pageMaker.cri.orderBy == 'submit'}">selected='selected'</c:if>>지원완료</option>
                                      <option value="noSubmit" <c:if test="${pageMaker.cri.orderBy == 'noSubmit'}">selected='selected'</c:if>>미지원</option>
                                    </select>
                                    <!-- <select id="orderByStatus" class="custom-select" onchange="switchTab3(this.value,event);"> -->
                                      <select id="orderBy" name="orderBy" class="custom-select" onchange="switchTab(this.value);">
                                      <option disabled selected>채용상태</option>
                                      <option value="inProgress" <c:if test="${pageMaker.cri.orderBy == 'inProgress'}">selected='selected'</c:if>>채용중</option>
                                      <option value="finished" <c:if test="${pageMaker.cri.orderBy == 'finished'}">selected='selected'</c:if>>채용마감</option>
                                  </select>
                                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                              </div><!-- optionSortLeft 끝 -->
                              <div class="optionSorRight">
                                    <input type="text" id="keyword" name="keyword" placeholder="기업명, 채용공고제목" value="${pageMaker.cri.keyword}">
                                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                    <button class="searchBtn" type="submit">검색하기</button>
                              </div> <!-- optionSortBtn right 끝 -->                  
                          </div><!-- searchWrap 끝 -->  
                        </form><!-- searchForm  끝 --> 
                        <div class="jobPostList">
                          <c:forEach items="${noticeList}" var="dto">		
                            <div class="postBox">
                                <div class="boxLeft">
                                    <input type="checkbox" name="postListRow" id="${dto.notice_num}" class="normal"><!-- id값에 공고번호 넣어줘야함-->
                                    <!-- <label for="com_name">브레인즈컴퍼니</label> -->
                                    <!-- <a class="com_name" href="/comDetail?com_email=${dto.com_email}">${dto.com_name}</a> -->
                                    <h4 class="com_name">${dto.com_name}</h4>
                                </div><!-- boxLeft 끝-->
                                <div class="boxMiddle">
                                    <!-- <h3 class="jobPostTitle">[Web Product 팀] 프론트 엔드 엔지니어 (3년 이상)</h3> -->
                                    <!-- <a class="jobPostTitle" href="jobPostDetail?notice_num=${dto.notice_num}">${dto.notice_title}</a> -->
                                    <h4 class="jobPostTitle">${dto.notice_title}</h4>
                                    <!-- notice_num 가져갈 수 있도록 hidden   -->
                                    <input type="hidden" class="noticeNum" value="${dto.notice_num}">
                                    <div class="jobPostInfo">
                                        <!-- <p class="notice_area">서울 성동구</p> -->
                                        <p class="notice_area">${dto.notice_area1} ${dto.notice_area2}</p>
                                        <!-- <p class="notice_job">경력 3-5년</p> -->
                                        <p class="notice_job">${dto.notice_career}</p>
                                    </div><!-- jobPostInfo 끝-->
                                    <div class="resumeInfo">
                                        <!-- 지원완료:지원한이력서력서보기(지원일자), 미지원:기본이력서로지원하기 분기처리 --> 
                                        <div class="statusCon">
                                          <c:choose>
                                            <c:when test="${dto.resume_num != null}">
                                              <span class="resumeIcon">
                                                  <i class="fa-regular fa-file-lines"></i>
                                              </span>
                                              <a href="resumeInfo?resume_num=${dto.resume_num}">지원한 이력서 보기</a>
                                            </c:when>
                                            <c:otherwise>
                                              <p class="submitResume">지원하기</p><!-- 지원하기 팝업뜨도록 설계--> 
                                              <!-- notice_num 가져갈 수 있도록 hidden -->
                                              <input type="hidden"id="noticeNum" value="${dto.notice_num}">  
                                            </c:otherwise>
                                          </c:choose>
                                        </div>
                                        <div class="submitDate">
                                          <c:if test="${dto.resume_num != null}">
                                            <p class="text_date">지원일자</p>
                                            <p class="joincompany_date">${dto.joincompany_date}</p>
                                          </c:if>
                                        </div>
                                      </div><!-- resumeInfo 끝-->
                                    </div><!-- boxMiddle  끝-->
                                    <div class="boxRight">
                                      <div class="submitCon">
                                        <c:choose>
                                          <c:when test="${dto.resume_num != null}">
                                            <button class="submitTab" value="submit_status">지원완료</button><!-- 지원완료 분기 --> 
                                            <p>${dto.joincompany_date}</p>
                                          </c:when>
                                          <c:otherwise>
                                            <button class="submitTab" value="submit_status">미지원</button><!-- 미지원 분기 --> 
                                          </c:otherwise>
                                        </c:choose>
                                      </div> <!-- submitCon 끝 -->
                                      <div class="postCon">
                                        <jsp:useBean id="now" class="java.util.Date" />
                                        <!-- 현재 날짜를 yyyy-MM-dd 형식으로 포맷팅 -->
                                        <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
                                        
                                        <!-- notice_endDate, today를 yyyy-MM-dd 형식으로 파싱 -->
                                        <fmt:parseDate var="endDateParsed" value="${dto.notice_endDate}" pattern="yyyy-MM-dd" />
                                        <fmt:parseDate var="todayParsed" value="${today}" pattern="yyyy-MM-dd" />
                                        <c:choose>
                                          <c:when test="${endDateParsed >= todayParsed}">
                                            <button class="postStatus" value="post_status">채용중</button><!-- 채용마감/채용중 분기 -->
                                            <p>~${dto.notice_endDate}</p>
                                          </c:when>
                                          <c:otherwise>
                                            <button class="postStatus" value="post_status">채용마감</button><!-- 채용마감/채용중 분기 -->
                                          </c:otherwise>
                                        </c:choose> 
                                      </div> <!-- postCon 끝 -->   
                                      <span class="delIcon">
                                          <i class="fa-regular fa-trash-can"></i>
                                      </span>
                                   </div><!-- boxRight 끝 -->   
                             </div><!-- postBox 하나의 공고 박스 끝 --> 
                          </c:forEach> 
                        </div><!-- jobPostList 끝 -->    
                    <!-- </div>listTable 끝  -->
                    <div class="div_page">
                      <!-- <h5> 1  2  3  4  5  6  7  8 </h5> -->
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
                          <!-- <li>${num}</li> -->
                          <!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}>${num}</li> -->
                          <!-- <li ${pageMaker.cri.pageNum == num ? "style='color:#f00; font-weight: 600';'" : ""}> -->
                          <li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='border:2px solid #FFA500; font-weight: 900';'" : ""}>
                            <a href="/individualNoticeScrap?pageNum=${num}">
                              ${num}
                            </a>
                          </li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                          <!-- <li>next</li> -->
                          <li class="paginate_button"><input type="hidden" name="">
                            <a href="${pageMaker.endpage + 1}">
                              Next
                            </a>
                          </li>
                        </c:if>
                      </ul>
                              </div><!-- div_page 끝 -->   
                    <!-- 데이터를 가지고 컨트롤러단으로 가기때문에 -->
                      <!-- <form action="listWithPaging" method="get" id="actionForm"> -->
                      <!-- <form action="list" method="get" id="actionForm"> -->
                    <form method="get" id="actionForm">
                      <!-- 페이지 번호를 "pageNum" 이라는 이름으로 가져감 이건 굳이 보일필요는없기때문에 hidden type-->
                      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                      <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                      <!-- 페이지 검색시 페이지번호 클릭할 때 필요한 파라미터 -->
                      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                    </form> 
                </div> <!-- mainContainer -->
            </main>
        </div><!-- mainContent-->
    </div><!-- container 끝 -->
	<%@ include file="footer.jsp" %>
</body>
</html>
<script>
	$(document).ready(function(){
	    

		
    /*
    2024-07-02 서연주 
    기업명,공고제목으로 검색하기
    */
    $("button.searchBtn").on("click",function(e){
        e.preventDefault();
        var keyword = document.getElementById('keyword');
        console.log(keyword);
        var searchForm = $("#searchForm");
        // var keyword1 =searchForm.find(keyword).val();
        if( keyword.value.length == 0){
            alert("키워드를 입력하세요.");
        }else{
            searchForm.attr("action","#").submit();//serachForm 정보를 들고 컨트롤러단으로 감
        }
    });


    /*
    2024-07-02 서연주 
    체크박스 선택
    */
    //체크박스 전체선택
    $(".optionSortLeft input").on("click", function () {
      var checked = $(this).is(":checked");
      console.log("check_all");
      console.log(checked);
      
      if(checked){
          $(".jobPostList").find('input').prop("checked", true);
      } else {
          $(".jobPostList").find('input').prop("checked", false);
      }
    });// 체크박스 전체 선택 끝

    // 체크박스 개별 선택
    $(".normal").on("click", function() {
      var checked = $(this).is(":checked");
      console.log("click normal");
      console.log(checked);

      if (!checked) {
          $(".optionSortLeft input").prop("checked", false);
      }else {
          var is_checked = true;
          
          $(".normal").each(function(){
            is_checked = is_checked && $(this).is(":checked");
          });
          
          $(".optionSortLeft input").prop("checked", is_checked);
      }
    });// 체크박스 개별 선택 끝

   

    /*
		2024-07-27 서연주 
		체크박스 누르고 삭제하기(휴지통버튼이나, 삭제하기 버튼 누르면)
		*/
		$(".selectDel").on("click", deleteValue);//삭제버튼 누르면 function 호출
		$("span.delIcon").on("click", deleteValue);//삭제버튼 누르면 function 호출

		function deleteValue() { //function 정의
			var cnt = $("input[name='postListRow']:checked").length;
			var arr = new Array();
			$("input[name='postListRow']:checked").each(function() {
				arr.push($(this).attr('id'));
			});
			//alert(arr);//com_email이 배열로 잘 담기는지 확인
			if(cnt == 0){
				alert("선택된 항목이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if (chk) {
					$.ajax
					({
						url:"noticeScrapDelete",
						type:'POST',
						traditional : true, //배열로 보내는 방법
						// dataType: 'json',
						data:{"arrStr" : arr},
						success: function(data) {
							if (data != 1) {
								alert("삭제성공");
								location.href = "individualNoticeScrap";
							} else {
								alert("삭제에 실패했습니다.");
							}
						},
						error: function() {
							alert("삭제를 완료하지 못했습니다. 다시 시도해주세요."); // 오류 시 알림
						}
					});// ajax 끝
				}
			}
		}// function deleteValue 끝


    

    /*
    2024-07-31 서연주 
    기업이름 누르면 기업정보 상세페이지로 새창(기업이메일 값 가지고 새 탭으로 이동)
    */
    $('.com_name').click(function(e){
      console.log("기업명 클릭 click");
      // window.open('/comDetail?com_email=${dto.com_email}','com_detail','top=100, left=200, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=yes, channelmode=yes');
      window.open('/comDetail?com_email=${dto.com_email}');//새 탭으로 이동으로 변경
    });

    /*
    2024-07-31 서연주 
    공고명 누르면 공고 상세페이지로 새창(공고번호 값 가지고 새 탭으로 이동)
    */
    $('.jobPostTitle').click(function(e){
      console.log("공고명 클릭 click");
      // hidden input의 값(공고번호)를 가져옴
      // var noticeNumStr = $(this).siblings('.noticeNum').find('input[type="hidden"]').val(); // hidden input의 값(공고번호)를 가져옴
      var noticeNumStr = $(this).siblings('.noticeNum').val(); // hidden input의 값(공고번호)를 가져옴
      // alert(noticeNumStr);
      
      // noticeNumStr 값을 정수로 파싱합니다.
      var noticeNum = parseInt(noticeNumStr, 10);
      var url = '/jobPostDetail?notice_num=' + noticeNum; // url도 변수로 받음
      
      //새창으로 열기
      // window.open(url, 'notice_detail', 'top=100, left=200, width=1200, height=800, status=no, menubar=no, toolbar=no, resizable=yes');
      //새 탭으로 열기
      window.open(url);
      
    });
    
    /*
    2024-07-31 서연주 
    지원하기 누르면 지원하기 페이지 새창(공고번호 가지고 새 창으로 /profileInfo매핑)
    */
   
    $('p.submitResume').click(function(e){
      console.log("지원하기 클릭 click");
      // hidden input의 값(공고번호)를 가져옴
      // var noticeNumStr = $(this).siblings('.noticeNum').val(); // hidden input의 값(공고번호)를 가져옴
      var noticeNumStr = $(this).siblings('input[type="hidden"]').val(); // hidden input의 값(공고번호)를 가져옴
      // alert(noticeNumStr);

      // noticeNumStr 값을 정수로 파싱합니다.
      var noticeNum = parseInt(noticeNumStr, 10);
      var url = '/profileInfo?notice_num=' + noticeNum; // url도 변수로 받음
      //새창으로 열기
      window.open(url,'profileInfo','top=150, left=600, width=560, height=440, resizable = no, scrollbars = no');
      // window.open('/profileInfo?notice_num=${dto.notice_num}','profileInfo','top=100, left=200,width=500, height=270, resizable = no, scrollbars = no');
    });
    



    /*
    2024-07-29 서연주 
    필터링 선택하면 목록다시 조회(이벤트 리스너)
    */
    $('select#orderBy').on('change', function(event) {
      // alert("정렬버튼 누름")
        switchTab(this.value);
    });
    
    function switchTab(value) {
      // 선택된 값을 가진 새로운 폼을 동적으로 생성
      var form = $('<form>', {
          method: 'get',
          action: $('#searchForm').attr('action')
      });
  
      // 선택된 옵션값을 폼 데이터로 추가
      form.append($('<input>', {
          type: 'hidden',
          name: 'orderBy',
          value: value
      }));
  
      // 기존의 숨겨진 필드들을 폼에 추가
      form.append($('<input>', {
          type: 'hidden',
          name: 'pageNum',
          value: $('input[name="pageNum"]').val()
      }));
  
      form.append($('<input>', {
          type: 'hidden',
          name: 'amount',
          value: $('input[name="amount"]').val()
      }));
  
      // 폼을 바디에 추가하고 제출
      form.appendTo('body').submit();
  }


	});




 



</script>
<script>
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