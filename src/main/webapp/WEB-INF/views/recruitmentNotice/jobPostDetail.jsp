<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/posting_list.css"> -->
<link rel="stylesheet" href="css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="js/index.js"></script>   
</head>
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
	  --font-size20: 20px;
	  --font-size16: 16px;
	  --font-size14: 14px;
	  --font-size12: 12px;
	}


	/*    섹션    */

	section 
	{
	    padding-top: 90px;
		display: flex;
	    justify-content: center;

	}
	.wrap
	{
	    min-width: 1200px;
	    padding: 70px 0;
	    box-sizing: border-box;
	    display: flex;
	}

	.wrap .left
	{
	    max-width: 720px ;
	    justify-content: left;
	    
	}


	.wrap .left .company
	{
	    display: flex;
	    align-items: flex-start;
	    margin-bottom: 32px;

	}

	.wrap .left .company .imgg
	{   
	    width: 720px;
	    border-radius: 15px;


	    /* margin-left: auto;
	    align-items: top; */
	}

	.wrap .main
	{
	    display: flex;
	    align-items: flex-start;
	    margin-bottom: 58px;
	}

	.wrap .main .icon,
	.right .iconn
	{
		background-color: var(--color-white);
		border: none;
		/* gap: 50px; */
	}

	.wrap .main .icon
	{
	    background-color: var(--color-white);
	}


	/* 서브 1 시작 */


	.wrap .main .sub1
	{
	    max-width: 620px ;
	    margin-right: auto;

	    color: var(--color-grayblack);
	    font-weight: 200;

	}



	.wrap .main .sub1 .name
	{
	    padding-bottom: 10px;
	}

	.wrap .main .sub1 .name,
	.wrap .main .sub1 .locationC
	{
	    font-size: var(--font-size20);
	    font-weight: 200;
	}
	.wrap .main .sub1 .title
	{
	    font-weight: 600;
	}

	.wrap .main .sub1 .locationC
	{
	    font-size: var(--font-size16);
	    margin-bottom: 20px;
	}
	.wrap .main .sub1 .title
	{
	    font-size: var(--font-size24);
	}


	/* 서브 2 시작 */

	.wrap .main .sub2
	{
	    max-width: 90px ;
	}


	.wrap .column
	{
	    display: grid; grid-template-columns: 1fr; gap: 70px; 
	    width: 720px; min-height: 400px;

	}

	.wrap .column .columnA

	{
	    font-size: var(--font-size20);
	    padding-bottom: 10px;
	    border-bottom: 1px solid var(--input-gray);

	}


	.wrap .column .columnAA,
	.col7 .columnBB
	{

	    margin-top: 20px;
	}

	.wrap .column .columnA .title,
	.wrap .column .columnAA .detail
	{
	    font-weight: 100;

	}

	p
	{line-height:200%;
	}

	.textarea
	{
	/* white-space: pre-wrap;*//*줄바꿈을 그대로 출력(ChatGPT) 실패 */
	white-space: pre;/*줄바꿈을 그대로 출력*/
	line-height :1.5;/* 글자 위아래 간격 조절 (1.5배) */
	}

	/* 라이트 시작 */

	.wrap .right
	{
	    
	    margin-left: auto;  
	    min-width: 375px;
	}



	.wrap .right .box2,
	.wrap .right .box3,
	.wrap .right .box4
	{
	    margin-top: 10px;
	    
	}

	.wrap .right .box2 .box,
	.wrap .right .box3 .box,
	.wrap .right .box4 .box
	{
	    margin-top: 10px;
	    
	    
	}


	.wrap .right .side
	{
	    align-items: flex-start;
	}

	.wrap .right  .box2,
	.wrap .right  .box3
	{
	    margin: 10px 12px 10px 0;
	    border: 1px solid var(--input-gray);
	    border-radius: 15px;

	    padding: 12px 20px;
	    width: initial;
	    display: flex;
	}

	.wrap .right .pos .box3
	{

	    justify-content: center;

	    min-width: 375px;
	    

	}




	.wrap .right .box2 .box
	{
	    /* max-height: 100px ; */
	    margin-right: auto;
	    color: var(--color-grayblack);
	    font-weight: 200;
	    max-width: 290px;
	    
	}

	.wrap .right .box3 .m1,
	.wrap .right .box3 .m2
	{
	    font-size: var(--font-size14);

	}


	/* max-width: 340px; */


	.wrap  .right  .t,
	.wrap .right .box2 .t1,
	.wrap .right .box2 .t2,
	.wrap .right .box2 .t3,
	.wrap .right .box3 .p1,
	.wrap .right .box4 .p1
	{
	    font-size: var(--font-size16);
		color: var(--color-black);
	    font-weight: 200;
	}




	.wrap .right .box2 .t1
	{
	    margin-bottom: 10px;
	}
	.wrap .right .box2 .t2
	{
	    margin-bottom: 20px;
	}
	.wrap .right .box2 .t3
	{
	    font-size: var(--font-size14);
	    margin-bottom: 13px;
	}
	.wrap .right .boxbox
	{
	    margin-top: 10px;
	}



	.wrap .right .box3 .m1
	{
	    color: var(--color-grayblack);
	    font-weight: 500;

	}

	.wrap .right .box3 .m2
	{
	    color: var(--color-grayblack);
	    font-weight: 500;
	}
	.wrap .columnAA .tech .mm1
	{
	    color: var(--color-grayblack);
	    font-size: var(--font-size14);
		margin: 10px 12px 10px 0;
		background-color: var(--button-gray);
		border: 1px solid var(--input-gray);
		border-radius: 6px;
		padding: 12px 20px;
		width: initial;
	    font-weight: 200;
	}





	.columnAA .detail .sectionConBody .Bodycon.tech 
	{
	  display: block;
	  max-width: 1200px;
	  
	}

	.columnAA .detail .sectionConBody .Bodycon button.tech
	{
	  margin: 10px 12px 10px 0;
	  border: 1px solid var(--input-gray);
	  border-radius: 6px;
	  padding: 12px 20px;
	  width: initial;
	  cursor: pointer;
	  &:hover 
	  {
	      background: var(--main-color);
	      color: #fff;
	  }
	}



	.columnAA .detail
	{
	    font-size: var(--font-size16);
	    font-weight: 200px;
	}
	.columnA .title
	{
	    font-size: var(--font-size20);
	    font-weight: 300px;
	}


	.wrap .column .col7 .columnBB .kakaomap
	{
	    border-radius: 6px;
	}
	.wrap .column .col7 .columnBB .loc
	{
	    margin: 10px 6px;
	    font-size: var(--font-size16);
	    font-weight: 100;
	}








	/* 라이트 끝 */


	/*기술스택 버튼시작*/
	.columnAA .pos
	{
	    display: flex;
	    justify-content: center;
	}


	.columnAA .pos .box3
	{
	    display: flex;
	    align-items: center;
	    justify-content: center;

	}

	.box3
	{
	    border: 1px solid var(--input-gray);
	    border-radius: 6px;
	    height: 46px;
	    width: 375px;
	    margin: 0 8px;

	}
	.pos .m1
	{
	    font-size: var(--font-size18);
	    font-weight: 200;
	    /* line-height: 2; */
	    
	}
	/*기술스택 버튼끝*/


	/* 라이트 버튼시작*/
	.pos
	{
	    display: flex;
	    justify-content: center;
	}


	.pos .box3
	{
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    cursor: pointer;
	    &:hover 
	    {
	        background: var(--main-color);
	        color: #fff;
			border: none;
	    }
	    &.active 
	    {
	        background: var(--main-color);
	        color: #fff;
			border: none;
	    }
	}

	#user_resume.active
	{
		background: var(--main-color);
		color: #fff;
		border: none;
	}

	.box3
	{
	    border: 1px solid var(--input-gray);
	    border-radius: 6px;
	    height: 46px;
	    width: 375px;
	    margin: 0 8px;

	}
	.pos .m1
	{
	    font-size: var(--font-size18);
	    font-weight: 200;
	    /* line-height: 2; */
	    
	}
	/*버튼끝*/

	.uploadResult img
	{
		width: 720px;
		height: 410px;
    	border-radius: 15px;
	}

</style>



<body>
    <div class="container">
        <%@ include file="../header.jsp" %>


<!-- 섹션-->
        <section>            
            <div class="wrap">


                <div class="left">


                    <!-- 컴퍼니 시작-->

                    <div class="company">
						<div class="uploadResult">
							<ul>

							</ul>
						</div>
                        <!-- <img class="imgg" src="images/company.svg" alt="#"> -->
                    </div>
                    <div class="main">
                        <div class="sub1">
                            <h5 class="name">${company.com_name}</h5>
                            <h5 class="locationC">${company.notice_area1}${company.notice_area2} · ${company.notice_career}</h5>
                            <h5 class="title">${company.notice_title}</h5>
                        </div>
                        <div class="sub2">
                            <button class="icon">
                                <i class="fa-regular fa-bookmark" style = font-size:20px;></i>
                            </button>
                            <button class="icon">
                                <i class="fa-regular fa-heart" style = font-size:20px;></i>
                            </button>
                            <button class="icon">
                                <i class="fa-regular fa-share-from-square" style = font-size:20px;></i>
                            </button>
                        </div>
                    </div>


                


                <div class="column"> <!-- 컬럼 시작-->

                    <div class="col1">
                        <div class="columnA">
                            <h5 class="title">근무 환경</h5>
                        </div>
                        <div class="boerder"></div>
                        <div class="columnAA">
                            <!-- <div class="detail"> -->
                                <p>
                                급   여 : ${company.notice_pay1} ${company.notice_pay2} 만원<br>
                            <!-- </div> -->
                            <!-- <div class="detail"> -->
                                근무 부서 :${company.notice_department}<br>
                            <!-- </div> -->
                            <!-- <div class="detail"> -->
                                직    책 : ${company.notice_position}<br>
                            <!-- </div> -->
                            <!-- <div class="detail"> -->
                                모집 인원 : ${company.notice_recruitNum} 명<br>
                            <!-- </div> -->
                            </p>
                        </div>
                    </div>


                    <div class="col2">
                        <div class="columnA">
                            <h5 class="title">주요 업무</h5>
                        </div>
                        <div class="columnAA">
                            <h5 class="detail">
                                <div class="textarea"><c:out value="${company.notice_jobInfo}" /></div>
                            </h5>
                        </div>
                    </div>

                    <div class="col3">
                        <div class="columnA">
                            <h5 class="title">자격요건</h5>
                        </div>
                        <div class="columnAA">
                            <h5 class="detail">
                                <!-- ${company.notice_condition} -->
                                <div class="textarea"><c:out value="${company.notice_condition}" /></div>
                            </h5>
                        </div>
                    </div>

                    <div class="col4">
                        <div class="columnA">
                            <h5 class="title">우대사항</h5>
                        </div>
                        <div class="columnAA">
                            <h5 class="detail">
                                <!-- ${company.notice_prefer} -->
                                <div class="textarea"><c:out value="${company.notice_prefer}" /></div>
                            </h5>
                        </div>
                    </div>

                    <div class="col5">
                        <div class="columnA">
                            <h5 class="title">혜택 및 복지</h5>
                        </div>
                        <div class="columnAA">
                            <h5 class="detail">
                                <!-- ${company.notice_benefit} -->
								<div class="textarea"><c:out value="${company.notice_benefit}" /></div>
                            </h5>
                        </div>
                    </div>

                    <div class="col6">
                        <div class="columnA">
                            <h5 class="title">기술 스택 • 툴</h5>
                        </div>
                        <div class="columnAA">
                            <h5 class="detail">
                                <div class="sectionConBody tech">
                                    <div class="Bodycon tech">            
                                        <button class="tech" style="gap: 20px;">
                                            <!-- <h5 class="mm1">JAVA</h5> -->
                                        </button>
                                    </div>                        
                                </div> <!-- sectionConBody 끝 -->
                            </h5>
                        </div>
                    </div>

                    <div class="col7">
                        <div class="columnA">
                            <h5 class="title">접수 기간</h5>
                        </div>
                        <div class="columnAA">
                            <h5 class="detail">
                                ${company.notice_startDate} ~ ${company.notice_endDate}
                            </h5>
                        </div>
                    </div>

                    <div class="col7">
                        <div class="columnA">
                            <h5 class="title">지도</h5>
                        </div>
                        <div class="columnBB">
                            <!-- <h5 class="detail">/// -->
                                <!-- <div class="kakaomap" id="map" style="width:730px;height:250px;">
                                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de7cac757fedb4da8958fa692849033d"></script>
                                    <script>
                                        var container = document.getElementById('map');
                                        var options = {
                                            center: new kakao.maps.LatLng(33.450701, 126.570667),
                                            level: 3
                                        };
                                
                                        var map = new kakao.maps.Map(container, options);
                                    </script>
                                </div> -->
                                <!--<h5 class="loc">${com_location}</h5>-->
                                <!-- <h5 class="loc">${com_location}</h5> -->
                                <h5 class="loc">${company.com_location}</h5>
                            <!-- </h5> -->
                        </div>
                    </div>
                </div><!-- 컬럼 끝-->
             </div> <!-- left 끝-->

             
                <div class="right">
                    
                    <div class="box1">
                        <!-- <h5 class="t">채용중인 다른 포지션</h5> -->
                        <h5 class="t">이 기업에서 진행중인 다른 공고</h5>
                    </div>


                    <div class="side">
						<c:forEach var="dto" items="${otherPost}" begin="0" end="1">
							<a href="/jobPostDetail?notice_num=${dto.notice_num}">
								<div class="box2">
									<div class="box">
										<!-- <div class="t1">개발</div>--><!--여기 들어갈 후보 : 근무 조건, 직책, 부서 -->
										<div class="t1">${dto.notice_department} ∙ ${dto.notice_contactType}</div><!--여기 들어갈 후보 : 부서, 근무 조건으로 -->
										<h5 class="t2"> ${dto.notice_title}</h5>
										<h5 class="t3">${dto.notice_area1} ${dto.notice_area2} ∙ <span class="career">경력</span><span class="noticeCareer">${dto.notice_career}</span> ∙ ${dto.notice_endDate}</h5>
									</div>
									<div class="boxbox">
										<button class="iconn">
											<i class="fa-regular fa-bookmark" style = font-size:20px;></i>
										</button>
									</div>
								</div>
							</a>
						</c:forEach>

                        <div class="pos" >
                            <button class="box3" >
                                    <!-- <h5 class="m1">${postNum}개의 포지션</h5> -->
                                    <h5 class="m1" id="otherNotice">${postNum}개의 공고</h5>
                            </button>
                        </div>
                        <div class="pos">
                            <button class="box3" id="user_resume" onclick="resume()">
                            <!-- <button class="box3 resume"> -->
                                    <h5 class="m1">지원하기</h5>
                            </button>
                        </div>

                    </div> <!-- side 끝-->
                    



                </div> <!--right 끝-->
        


            </div> <!-- wrap 끝-->
        </section> <!--section 끝 -->


        <%@ include file="../footer.jsp" %>
    </div>
</body>
</html>
<script>

  $(document).ready(function(){

            /*
            2024-07-09 서연주 

            2024-07-13 임하진 : 연주님 코드 가져와서 수정함.
			배열로 가져온 정보 : 콤마(,)기준으로 나눠서 하나씩 버튼에 넣기

			2024-07-24 임하진 : 스택 출력 문제로 span으로 태그 변경
            */
    //  const noticeStack = "<c:out value='${company.notice_stack}'/>";
    //  const noticeStack = "<c:out value='${company.notice_stack}'/>";
     var noticeStack = "${company.notice_stack}";
	 console.log(noticeStack.length);
	 if(noticeStack.length > 0){
	 		console.log(noticeStack);
            const stacks = noticeStack.split(','); // 콤마로 나눠서 배열로 저장
            console.log(stacks);
            let output = "";
            for (let i = 0; i < stacks.length; i++) {
                // output += "<span class='mm1'>" + stacks[i].trim() + "</span>"; 통일성을 위해 button으로 변경
                output += "<button class='mm1'>" + stacks[i].trim() + "</button>";
            }
            console.log("@# output=>" + output);
            $('.col6 .tech').html(output);
		}			
			
	});

// 24.07.29 하진
// : 기업 회원의 경우 버튼 비활성화
// : 개인이나 비회원의 경우, 버튼 활성화 및 외부팝업 발생
var user_type = "${login_usertype}";
console.log("user_type = "+user_type);
// if (user_type == null || user_type == 1) {
if (!user_type || user_type == 1) {
        // 24-07-09 임하진 : 외부 팝업
        function resume() {
            // $(".pos .box3").add(".active");
            // var com_name = "${company.com_name}";
            // var notice_title = "${company.notice_title}";
          // URLSearchParams 객체
          
          //   const currentUrl =window.location.href;
            // // const urlParams = new url.searchParams(window.location.href);

			$("#user_resume").toggleClass("active");// 내부 팝업이었으면 addClass로 설정하고 팝업 종료시 removieClass로 처리하면 되는데...아깝다.
            const urlParams = new URLSearchParams(location.search);
            // const urlParams = new URLSearchParams(currentUrl);
            var notice_num = urlParams.get('notice_num');
            console.log(notice_num);
            // var popupProperties = "width=600, height=400, resizable = no, scrollbars = no";
            var popupProperties = "width=500, height=270, resizable = no, scrollbars = no";
            window.open("/profileInfo?notice_num="+notice_num,"profileInfo.jsp", popupProperties);
            // document.location.href="/profileInfo?"+notice_num;
            
    }
}else{
	$("#user_resume").css("display","none");
}

// 24.07.28 side 부분 구현 -> 다른 채용 공고가 없을 경우의 로직
	var postNum = "${postNum}";
	if (postNum == 0) {
		$("#otherNotice").text("다른 공고 보러 가기");
		$(".t").css({"display":"none"});
		$("#otherNotice").parent().on("click",function() {
			$(this).addClass("active");
			location.href="cardPageList";
		});
	}

	// 24.07.29 하진
	// 사이드 채용공고의 값이 신입이나 경력무관이면 .career class의 경력 문구 숨기기
	var career =  document.querySelectorAll(".noticeCareer");
	console.log("career.length = "+career.length);
		for (let i = 0; i < career.length ; i++) {
			var element = career[i];
			var careerValue = element.textContent.trim();  // 요소의 텍스트 내용을 가져옴
			console.log(careerValue);
			// if (career[i] == "경력무관" || career[i] == "신입") {
			if (careerValue == "경력무관" || careerValue == "신입") {
				$(".career").css("display","none");
			}
		}

</script>
<script>
	//24.07.30 지수
	//파일 가져오기
	$(document).ready(function () {
		
		var noticeNum = "${noticeNumber}";
		console.log("notice_num=>","${noticeNumber}");
		var uploadResultContainer = $(this).find('.uploadResult ul');

		if (noticeNum) {
			$.ajax({
				url: '/registGetFileList',
				type: 'GET',
				data: { notice_num: noticeNum },
				dataType: 'json',
				success: function(data) {
					showUploadResult(data, uploadResultContainer);
				},
				error: function(xhr, status, error) {
					console.error('Error fetching file list for notice_num ' + noticeNum + ':', error);
				}
			});
		} 
   });
   
   function showUploadResult(uploadResultArr, uploadResultContainer){
	   if (!uploadResultArr || uploadResultArr.length == 0) {
		   return;
	   }
   
	   var str = "";
   
	   $(uploadResultArr).each(function (i, obj) {
		   var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
   
		   str += "<li data-path='" + obj.uploadPath + "'";
		   str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
		   str += "<div>";
		   str += "<span style='display:none;'>" + obj.fileName + "</span>";
		   str += "<img src='/registDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
		   str += "</div></li>";
	   });
   
	   uploadResultContainer.empty().append(str);
   }
   
   </script>