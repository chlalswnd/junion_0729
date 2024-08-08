<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-관심기업</title>
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

	/* 네비게이션 옆 컨텐츠 영역 */
	.mainContent 
	{
	width: calc( 100% - 260px);
	min-height: 100vh;
	}

	/* 헤더 */
	.mainContent header 
	{
	width: 100%;
	height: 90px;
	border-bottom: 1px solid var(--input-gray);
	padding: 0 40px;
	display: flex;
	align-items: center;
	box-sizing: border-box;
	}

	/* 헤더 아이디 영역 */
	.mainContent header .userWrapper
	{
	display: flex;
	white-space: nowrap;
	margin-left: auto;
	align-items: center;
	}

	.mainContent header .userWrapper img
	{
	margin-right: 12px;
	width: 36px;
	height: 36px;
	border-radius: 50%;   
	}

	.mainContent header .userWrapper h4.name 
	{
	font-size: var(--font-size14);
	margin-right: 12px;
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
	.mainContainer .listTable .searchWrap
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
	gap : 10px;
	align-items: center;
	}

	/*sort tab 왼쪽*/
	.mainContainer .searchWrap .optionSortLeft input
	{
	width: 20px;
	height: 20px;
	cursor: pointer;
	border:1px solid var(--border-color-gray);
	border-radius: 3px;
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


	/*sort tab 오른쪽 검색하기*/
	.mainContainer .searchWrap .optionSorRight
	{
	margin-left: auto ;
	}
	.mainContainer .searchWrap .optionSorRight .search_Form
	{
	display: flex;
	gap : 10px;
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






	/*기업 리스트*/
	main .mainContainer .comList
	{
	display: flex;
	flex-direction: column;
	gap: 20px 0;
	}

	/*하나의 기업 박스*/
	.mainContainer .comList .postBox
	{
	display: flex;
	border: 1px solid var(--input-gray);
	border-radius: 10px;
	box-sizing: border-box;
	padding: 20px;
	width: 1200px;
	height: 140px;
	justify-content: flex-start;
	}

	/*박스 왼쪽(체크박스)*/
	.mainContainer .comList .postBox .boxLeft
	{
	display: flex;
	align-items:center;
	}

	.mainContainer .comList .postBox .boxLeft input
	{
	width: 20px;
	height: 20px;
	cursor: pointer;
	}


	/*박스 중간- 기업정보*/
	.mainContainer .comList .postBox .boxMiddle
	{
	width: 916px;
	display: flex;
	flex-direction: column;
	/* align-items:center; */
	justify-content:center;
	gap: 10px 0;
	margin: 0 40px;
	}

	.postBox .boxMiddle .com_name
	{
	font-size: var(--font-size16);
	color: #222;
	cursor: pointer;
	}


	.postBox .boxMiddle .comInfo
	{
	/* display: flex; */
	font-size: var(--font-size14);
	
	}

	.postBox .boxMiddle .jobPostNum 
	{
	/* display: flex; */
	font-size: var(--font-size12);
	color: var(--color-gray);
	}


	/*공고 박스 오른쪽*/
	.mainContainer .comList .postBox .boxRight
	{
	margin-left: auto;
	/* width: 175px; */
	display: flex;
	/* justify-content:center; */
	align-items:center;
	gap: 20px;
	}

	
	/*자세히보기 버튼*/
	.boxRight button
	{
	/* width: inherit; */
	background-color: #f7f7f7;
	border: 1px solid var(--input-gray);
	color: #777;
	font-size: var(--font-size14);
	border-radius: 6px;
	align-items:center;
	justify-content:center; 
	cursor: pointer;
	min-width: 135px;
	padding: 8px 20px;
	}








	/*휴지통아이콘*/ 
	.postBox .boxRight .delIcon
	{
	font-size:var(--font-size16) ;
	}

	.postBox .boxRight .delIcon i
	{
	width: inherit;
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
                    <!-- <div class="mainTitle"> -->
                        <!-- <h3 class="mainTitle">관심기업</h3> -->
                    <!-- </div>mainTitle 끝 -->
                    <div class="subtitle">
                        <h4 class="title">관심기업</h4>
                        <!-- <h4 class="listNum">${comList.size()}</h4> -->
                        <h4 class="listNum">${pageMaker.total}</h4>
                    </div>
                    <div class="listTable">
                        <div class="searchWrap">
                            <div class="optionSortLeft">
                                <input type="checkbox" id="check_all" value="회사명">
                                <button class="selectDel">삭제</button>
                            </div><!-- optionSortLeft 끝 -->
                            <div class="optionSorRight">
								<form method="get" id="searchForm">
                                    <div class="search_Form">
                                        <input type="text" id="keyword" name="keyword" placeholder="기업명, 기업소개"  value="${pageMaker.cri.keyword}" >
                                        <!-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> -->
                                        <!-- <input type="hidden" name="amount" value="${pageMaker.cri.amount}">페이징 처리를 위한 amount -->
										<button class="searchBtn" type="submit">검색하기</button>
                                    </div>
                            	</form><!-- searchForm / optionSortBtn right 끝 --> 
                            </div> <!-- optionSorRight 끝 -->                   
                        </div><!-- searchWrap 끝 -->  
                        <div class="comList">
							<c:forEach items="${comList}" var="dto">	
								<div class="postBox">
									<div class="boxLeft">
										<label for="com_name"></label>
										<input type="checkbox" name="comListRow" id="${dto.com_email}" class="normal">
										<input type="hidden" name="comListRow" id="com_name" value="${dto.com_email}">
									</div><!-- boxLeft 끝-->
									<div class="boxMiddle">
										<a class="move_link" href="/comDetail?com_email=${dto.com_email}">
											<h4 class="com_name">${dto.com_name}</h4>
										</a>
										<div class="comInfo">
											<p class="comContent">${dto.com_content}</p>
										</div><!-- comInfo 끝-->
										<div class="jobPostNum">
											<p class="title">현재 ${dto.notice_count}건 채용중</p>
										</div><!-- resumeInfo 끝-->
									</div><!-- boxMiddle  끝-->
									<div class="boxRight">
										<span class="detailTab"> 
											<button  class="detailBtn" onclick="location.href='/comDetail?com_email=${dto.com_email}'">자세히보기</button>
											<!-- <button class="detailBtn">자세히보기</button> -->
										</span>
										<span class="delIcon">
											<i class="fa-regular fa-trash-can"></i>
										</span>
									</div><!-- boxRight 끝 -->   
								</div><!-- postBox 하나의 기업박스 끝 --> 
							</c:forEach>  
                        </div><!-- comList 끝 -->    
                    </div><!-- listTable 끝 --> 
                    <div class="div_page">
                        <!-- <h5> 1  2  3  4  5  6  7  8 </h5> -->
                        <!-- <h5>${pageMaker}</h5> -->
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
									<a href="/interComlist?pageNum=${num}">
									<!-- <a> -->
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
	$(document).ready(function() {
		/*
	        2024-06-25 이재원 : 글자수 제한 + 넘는건 ...처리
			2024-06-25 서연주 : class 선택자만 수정해서 사용
	    */
	    $('.comInfo > .comContent').each(function()
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
		
		/*
		2024-07-02 서연주 
		기업명,기업소개 검색하기
		*/
		$("button.searchBtn").on("click",function(e){
			e.preventDefault();
			var keyword = document.getElementById('keyword');
			console.log(keyword);
			var searchForm = $("#searchForm");
			// alert(searchForm);
			// var keyword1 =searchForm.find(keyword).val();
			if( keyword.value.length == 0){
				alert("키워드를 입력하세요.");
			}else{
				searchForm.attr("action","interComlist").submit();//serachForm 정보를 들고 컨트롤러단으로 감
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
				$(".comList").find('input').prop("checked", true);
			} else {
				$(".comList").find('input').prop("checked", false);
			}
		});

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
		});

	

		/*
		2024-07-27 서연주 
		체크박스 누르고 삭제하기(휴지통버튼이나, 삭제하기 버튼 누르면)
		*/
		$(".selectDel").on("click", deleteValue);//삭제버튼 누르면 function 호출
		$("span.delIcon").on("click", deleteValue);//삭제버튼 누르면 function 호출

		function deleteValue() { //function 정의
			var cnt = $("input[name='comListRow']:checked").length;
			var arr = new Array();
			$("input[name='comListRow']:checked").each(function() {
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
						url:"comScrapDelete",
						type:'POST',
						traditional : true, //배열로 보내는 방법
						// dataType: 'json',
						data:{"arrStr" : arr},
						success: function(data) {
							if (data != 1) {
								alert("삭제성공");
								location.href = "interComlist";
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
		2024-07-02 서연주 
		자세히보기 누르면 기업정보 상세페이지로 새창(기업아이디를 가지고 이동해야함)
		*/
		// $('button.detailBtn').click(function(e){
		//     console.log("자세히보기 click");
		//     window.open('http://www.naver.com','com_detail','top=100, left=200, width=1200, height=600, status=no, menubar=no, toolbar=no, resizable=yes');
		// });




	});//document ready 끝

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
