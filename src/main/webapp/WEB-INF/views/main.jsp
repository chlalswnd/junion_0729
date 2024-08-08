<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    
	<!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    
	<!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
	
	<!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
	
	<!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>	
 
</head>
<body>
    <%@ include file="header.jsp" %>	
	<%@ include file="quickMenu.jsp" %>
    <main>
        <div class="banner">
			<div class="swiper mySwiper">
			    <div class="swiper-wrapper">
					<div class="mainBanner swiper-slide one">
						<div class="contentWrap">      
					        <h2 class="junion">
								JUNION<br>
					            <span style="--i:0;" data-text="개발자 커리어의 시작">개발자 커리어의 시작</span>
					            <span style="--i:2;" data-text="같이 달리자">같이 달리자</span>
					            <span style="--i:1;" data-text="면접부터 실무에서 필요한 스킬까지">면접부터 실무에서 필요한 스킬까지</span>
					        </h2>
						</div>				        
				    </div>
					<div class="mainBanner swiper-slide">
						<div class="contentWrap">
							<div class="content">
			                    <h5 class="comTitle">JUNION</h5>
			                    <h5 class="mainTitle" style="margin-bottom:0;">주니온에서 지원하는</h5>
			                    <h5 class="mainTitle">신입개발자 취업성공패키지</h5>
			                    <div class="descText">면접에서부터 실무에서 필요한 스킬력까지 책임집니다.</div>
			                    <div class="descText">주니온에서 부터 한걸음 자바/스프링 백앤드 개발교육!</div>
			                </div>
							<div class="cubeWrap one">
								<div class="cube">
							        <div class="top">
							            <i class="fa-brands fa-java"></i>
							        </div>
							        <div class="box">
							            <span style="--i:0;"></span>
							            <span style="--i:1;"></span>
							            <span style="--i:2;"></span>
							            <span style="--i:3;"></span>
							        </div>
							    </div>
							</div>
							<div class="cubeWrap two">
								<div class="cube">
							        <div class="top">
							            <i class="fa-brands fa-css3-alt"></i>
							        </div>
							        <div class="box">
							            <span style="--i:0;"></span>
							            <span style="--i:1;"></span>
							            <span style="--i:2;"></span>
							            <span style="--i:3;"></span>
							        </div>
							    </div>
							</div> 
						</div> <!-- contentWrap 끝-->         					               
		            </div> <!-- mainBanner 끝-->									
			    </div>	<!-- swiper-wrapper -->
				<div class="page">
					<button id="playButton">
						<i class="fa-solid fa-pause"></i>
					</button>
					<div class="swiper-pagination"></div>
				</div> <!-- page-->								
			</div> <!-- mySwiper -->								
        </div><!--banner 끝-->
		
            <div class="innerCon">
                <section>					
                    <div class="sectionA" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
                        <div class="sectionName">
                            <div class="subtitle">신입 개발자 채용</div>
                                <a href="cardPageList" class="more">더보기
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                        </div><!--sectionName-->

                        <div class="cardPost">
                            <c:forEach items="${mainNotice}" var="dto">
                                <a class="con" href="jobPostDetail?notice_num=${dto.notice_num}" data-notice-num="${dto.notice_num}">
                                    <div class="image">
                                        <div class="uploadResult">
                                            <ul>

                                            </ul>
                                        </div>
                                        <!-- <input type="hidden" name="notice_num" value="${dto.notice_num}"> -->
                                    </div>
                                    <div class="postSub">
                                        <div class="category">
                                            ${dto.com_name}
                                        </div>
                                        <div class="name">
                                            ${dto.notice_title}
                                        </div>
                                    </div>
                                </a><!-- con 끝 -->
                            </c:forEach>
                        </div><!-- cardPost 끝 -->
                        
                    </div><!--sectionA 끝-->
                    <div class="sectionB" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
                        <div class="sectionName">
                            <div class="subtitle">기업 공고</div>
                            <a href="cardPageList" class="more">더보기
                                <i class="fa-solid fa-angle-right"></i>
                            </a>
                        </div><!--sectionName-->
                        <div class="themaCon">
                            <div class="postThema">
                                <div class="sectionName">
                                    <h5 class="subtitle"><span style="color: #FFA500;">신입</span> TOP 5</h5>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <c:forEach items="${mainNewCareer}" var="dto" varStatus="status">                                            
                                            <li class="data a ${status.first ? 'first-item' : ''}">
												<a href="jobPostDetail?notice_num=${dto.notice_num}">
	                                                <h5 class="number"><span>${status.index+1}</span></h5>
	                                                <div class="name">
	                                                    <div class="conTitle">${dto.com_name}</div>
	                                                    <div class="conSub">${dto.notice_title}</div>
	                                                </div>
	                                                <div class="dDay"><span>D-${dto.noticeDday == 0 ? 'DAY' : dto.noticeDday}</span></div>
												</a>
											</li>                                            
                                        </c:forEach> 
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                            <div class="postThema">
                                <div class="sectionName">
                                    <div class="subtitle"><span style="color: #FFA500;">경력</span> 인기 TOP 5</div>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <c:forEach items="${mainCareerhit}" var="dto" varStatus="status">
                                            <li class="data a ${status.first ? 'first-item' : ''}">
												<a href="jobPostDetail?notice_num=${dto.notice_num}">
	                                                <h5 class="number"><span>${status.index+1}</span></h5>
	                                                <div class="name">
	                                                    <div class="conTitle">${dto.com_name}</div>
	                                                    <div class="conSub">${dto.notice_title}</div>
	                                                </div>
	                                                <div class="dDay"><span>D-${dto.noticeDday == 0 ? 'DAY' : dto.noticeDday}</span></div>
												</a>
											</li>                                            
                                        </c:forEach> 
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                            <div class="postThema">
                                <div class="sectionName">
                                    <div class="subtitle"><span style="color: #FFA500;">오늘</span> 뜬 인기 TOP 5</div>
                                    <a href="#" class="moreView">더보기
                                        <i class="fa-solid fa-angle-right"></i>
                                    </a>
                                </div><!--sectionName-->
                                <div class="themaSection">
                                    <ul class="one">
                                        <c:forEach items="${mainTodayhit}" var="dto" varStatus="status">                                            
                                            <li class="data a ${status.first ? 'first-item' : ''}">
												<a href="jobPostDetail?notice_num=${dto.notice_num}">
	                                                <h5 class="number"><span>${status.index+1}</span></h5>
	                                                <div class="name">
	                                                    <div class="conTitle">${dto.com_name}</div>
	                                                    <div class="conSub">${dto.notice_title}</div>
	                                                </div>
	                                                <div class="dDay"><span>D-${dto.noticeDday == 0 ? 'DAY' : dto.noticeDday}</span></div>
												</a>
                                            </li>
                                            
                                        </c:forEach> 
                                    </ul>
                                </div><!--themaSection 리스트 영역-->
                            </div><!--thema 영역-->
                        </div><!--themaCon-->
                    </div><!--sectionB 끝-->
                </section>
            </div><!--innerCon 끝-->
            
            <div class="subBanner" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
                <a href="#" class="content">
                    <div class="bannerTitle">주니온에서 지원하는 신입개발자 취업성공패키지</div>
                    <div class="bannerSubTitle">면접에서 부터 실무에서 필요한 스킬력까지 책임집니다.</div>
                </a><!--content 끝-->
            </div><!--subBanner 끝-->
            
            <div class="innerCon" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
                <div class="sectionC">
                    <div class="sectionName">
                        <div class="subtitle">추천 기업</div>
                        <a href="comList" class="more">더보기
                            <i class="fa-solid fa-angle-right"></i>
                        </a>
                    </div><!--sectionName 끝-->
                    <div class="postSection">
                        <c:forEach items="${mainRecommendCom}" var="dto">
                            <div class="a" data-com-email="${dto.com_email}">
                                <div class="conImage">
                                    <div class="uploadResult">
                                        <ul>

                                        </ul>
                                    </div>
                                </div>
                                <div class="conProfile" onclick="location.href='comDetail?com_email=${dto.com_email}'" style="cursor:pointer;">
                                    <div class="conTitle">${dto.com_name}</div>
                                    <div class="conSec">${dto.com_content}</div>
                                </div>
                                <button type="button" class="more" onclick="location.href='comDetail?com_email=${dto.com_email}'" style="cursor:pointer;">바로가기</button>
                            </div>
                        </c:forEach>
                    </div><!--postSection 끝-->
                </div><!--sectionC 끝-->
            </div><!--innerCon 끝-->
        </main>
		<%@ include file="footer.jsp" %>        
    </div>
	<!-- AOS 스크립트 시작 -->
	<script> 
	    AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
	</script>
	
	<!-- Swiper JS -->
	  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	  <!-- Initialize Swiper -->
	  <script>
		var swiper = new Swiper(".mySwiper", {
	      spaceBetween: 0,
	      centeredSlides: true,
	      autoplay: {
	        delay: 9500,
	        disableOnInteraction: false,
	      },
	      pagination: {
	        el: ".swiper-pagination",
	        clickable: true,
	      },
	      navigation: {
	        nextEl: ".swiper-button-next",
	        prevEl: ".swiper-button-prev",
	      },
	    });
		
		// Play/Pause 버튼 기능
		document.getElementById("playButton").addEventListener("click", function () {
			var icon = playButton.querySelector("i");
			playButton.addEventListener("click", function () {
			  var icon = playButton.querySelector("i");
			  
			  if (icon.classList.contains("fa-play")) {
			    icon.classList.remove("fa-play");
			    icon.classList.add("fa-pause");
			    swiper.autoplay.start(); // 슬라이더 재생
			  } else {
			    icon.classList.remove("fa-pause");
			    icon.classList.add("fa-play");
			    swiper.autoplay.stop(); // 슬라이더 정지
			  }
			});
		});		
		
	  </script>	
	
</body>
</html>

<script>

 $(document).ready(function () {
	
	$('.conSec').each(function()
     {
         var length = 60; //표시할 글자 수 정하기
    
         $(this).each(function()
         {

             if($(this).text().length >= length)
             {
                 $(this).text($(this).text().substr(0, length) + '...');	//지정한 글자수 이후 표시할 텍스트 '...'
             }
         });

     });
		
    // con클래스 반복하면서 데이터 가져옴
    $('.con').each(function () {
        // con클래스 data-notice-num 속성에서 값을 가져옴
        var noticeNum = $(this).data('notice-num');
        
        // 현재 con클래스 .uploadResult 요소를 선택
        var uploadResultContainer = $(this).find('.uploadResult ul');

        if (noticeNum) {
            $.ajax({
                url: '/mainRegistFileList',
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
    $('.a').each(function () {
        var comEmail = $(this).data('com-email');
        
        var uploadResultContainer = $(this).find('.uploadResult ul');

        if (comEmail) {
            $.ajax({
                url: '/mainComFileList',
                type: 'GET',
                data: { com_email: comEmail },
                dataType: 'json',
                success: function(data) {
                    showUploadResult(data, uploadResultContainer);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching file list for com_email ' + comEmail + ':', error);
                }
            });
        }
    });
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
        str += "<img src='/mainDisplay?fileName=" + fileCallPath + "' alt='" + obj.fileName + "'>"; 
        str += "</div></li>";
    });

    uploadResultContainer.empty().append(str);
}

</script>