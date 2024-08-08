<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이페이지 - 기업정보관리</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/style.css">-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companyInfoMamagement.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
    <!--kakao map -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48ca63ceb0746787c922c8da8f33b705&libraries=services"></script>
<style>
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
</style>
</head>
<body>
<div class="container">
	<%@ include file="../nav_company.jsp" %>
	
<!--	${companyInfo}-->
    <div class="mainContent">
        <header>
            <div class="userWrapper">
                <img src="images/people.svg"alt="">
                <div class="dorpdowmMain">
                    <div class="dropdown">
                        <div class="dropdownSub" id="dropdownSub">
                            <h4 class="name" name="com_name" style="cursor: pointer;">${login_name}</h4>
                            <div class="dropdownContent" id="dropdownContent">
                                <a href="companyInfoManagement"><div>기업 정보 관리</div></a>
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
            <div class="containe">
                
                
                <div class="toptitle">
                    <h3 class="toptitle1" style="font-size: 32px;" >기업 기본 정보</h3>
                    <h3 class="toptitle2" style="font-size: 32px;" >기업 상세 정보</h3>
                </div>
                
                    <div class="tabCon common">

                        <!-- 섹션시작 -->
                        <section class="tabCon common disN" >            
                            <div class="wrap">
                
                
                                <div class="left">
                
                
                                    <!-- 컴퍼니 시작 -->
                
                                    <div class="company">
                                        <img class="imgg" src="../images/companyInfo.svg" alt="#">
                                    </div>
                                    <div class="main">
                                        <div class="sub1">
                                            <h5 class="name">${companyInfo.com_name}</h5>
                                            <h5 class="locationC" id="localyear">${companyInfo.com_location}ㆍ업력 <span class="getyear"></span></h5>
                                            <!-- <h5 class="locationC" id="localyear">${companyInfo.com_location}<span class="getyear"></span></h5> -->
                                        </div>
                                    </div>
                
                
                                    <!-- 컬럼 시작 -->
                
                
                                    <div class="column"> 
                
                
                                    <div class="col1">
                                        <div class="columnA">
                                            <h5 class="title">회사 소개</h5>
                                        </div>
                                        <div class="boerder"></div>
                                        <div class="columnAA">
                                            <h5 class="detail">
                                                <!-- ${companyInfo.com_content} -->
                                                <div class="introduce"><c:out value="${companyInfo.com_content}" /></div>
                                            </h5>
                                        </div>
                                    </div>

                                    <div class="col1">
                                        <div class="columnA">
                                            <h5 class="title">기술 스택</h5>
                                        </div>
                                        <div class="boerder"></div>
                                        <div class="columnAA">
                                            <div class="detail" id="stack">
                                                <!-- ${companyInfo.com_stack} -->
                                            </div>
                                        </div>
                                    </div><!--col2-->
                
                                    <div class="col7">
                                        <div class="columnA">
                                            <h5 class="title">회사 위치</h5>
                                        </div>
                                        <div class="columnBB">
                                            <!--지도가 들어갈 위치-->
                                            <div id="map" style="width:100%;height:350px;"></div>
                                            <h5 class="comloc" id="comAddress">${companyInfo.com_location}</h5>
                                        </div>
                                    </div>
                
                                    <div class="col8">
                                        <div class="columnA">
                                                <h5 class="title">
                                                    기업정보
                                                </h5>
                                            </div>
                                            <div class="content">
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        연혁
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name" id="yearlenght">
                                                        <span class="getyear"></span>(<span>${year}</span>년 설립)
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        매출액 (<span class="nowYear"></span>년)
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name" id="salay">
                                                        ${companyInfo.com_sale}만원
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        기업유형
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_type} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        평균연봉
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name" id="money">
                                                        ${companyInfo.com_salary}만원
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        대표자명
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_CEO} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        홈페이지
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name">
                                                        ${companyInfo.com_site} 
                                                    </h5>
                                                </div>
                                                <div class="comname1">
                                                    <h5 class="name">
                                                        가입 사원수 (인원)
                                                    </h5>
                                                </div>
                                                <div class="comname2">
                                                    <h5 class="name" id="people">
                                                        ${companyInfo.com_employee}명 
                                                    </h5>
                                                </div>
                                            </div>
                                    </div>
                
                
                
                                </div><!-- 컬럼 끝 -->
								<div class="modify">
								    <input type="button" value="기업정보수정" class="commodify" onclick="location.href='companyInfoDetailUpdate'">
								</div>
                                </div><!-- left 끝 -->
					
                
                            </div><!-- wrap 끝 -->
                        </section><!-- section 끝 -->
                        
                    </div>
                    
                    <div class="tabCon detail">
                        <table class="detail disB" width="1200px" height="300px">
                            <tr>
                                <th>기업이메일</th>
                                <td>${companyInfo.com_email}</td>
                            </tr>
                            <tr>
                                <th>사업자등록번호 </th>
                                <!-- <td class="social_number">${companyInfo.com_serial_number}</td> -->
                                <td class="social_number"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${companyInfo.com_person}</td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td>${companyInfo.com_tel}</td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="button" value="변경하기" class="changepw" onclick="pwchange()"></td>
                            </tr>
                        </table>
<!--						 table끝 -->
                        
                    <div class="modify">
                        <input type="button" value="기업정보수정" class="commodify" onclick="location.href='companyInfoUpdate'">
                    </div>
                    </div>

            </div><!-- containe끝 -->
        </main>
    
    </div><!-- main-content -->
</div>    
<%@ include file="../footer.jsp" %>
    
</body>
</html>
<script>
    $(document).ready(function () {

        // 기업의 스택값을 받아 버튼으로 출력
        var comStack = "${companyInfo.com_stack}";

        if(comStack){
            // comStack.forEach(function(stack) {
        console.log(comStack);
                const stacks = comStack.split(",");//배열로 만듦
                let str = "";
                for( let i=0; i < stacks.length; i++) 
                // for( let i=0; i < comStack.length; i++) 
                {
                    // alert("test");
                    str += "<input type='button' class='tech' value='"+stacks[i].trim()+"'>";       
                    // str += "<button class='tech' value='"+stacks[i].trim()+"'>";       
                }
                console.log("str@@##"+str);
                $("#stack").html(str);
        
        }
    
    //현재 년도를 구함.
    var years = new Date();
    var nowYear = years.getFullYear();
    console.log(nowYear);
    $('.nowYear').text(nowYear);


 // 24.08.06 하진 : 사업자 번호 출력 형식 수정 
  let serialNumber = "${companyInfo.com_serial_number}";
  let getFormat = serialNumber.substring(0,3) + "-" + serialNumber.substring(3,5)+"-"+serialNumber.substring(5);
  console.log(getFormat);
  let socialNumberElement = document.querySelector('.social_number');
  socialNumberElement.textContent = getFormat;


    // 24.08.03 ~ 08.04 : 하진 - 지도 API 적용
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표(상세정보 수정시와 다른 좌표를 써야 함)
            level: 4 // 지도의 확대 레벨(높을수록 확대가 많이 됨)
            };  

    //지도를 미리 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new kakao.maps.services.Geocoder();
   
    var getlocation = "${companyInfo.com_location}";//화면에 출력된 값을 변수로 받아 사용
    
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(getlocation, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
    });    

    });//end of ready
     // 24-07-09 하진
     function pwchange() {// 비밀번호 설정 외부 팝업 띄우는 코드
            // window.name = "부모창 이름"; 
        
            var popupURL = "/companyPW";
            var popupProperties = "width=500, height=300, resizable = no, scrollbars = no";
            window.open(popupURL, "companyPW.jsp", popupProperties);    
        }

        // 24.07.27 하진 : 연혁 계산 및 값이 없을 경우, 문자가 보이지 않도록 하는 로직
        var locationC = $(".main .sub1 .locationC").val();
        var getyear = "${companyInfo.experience_years}";
        console.log(getyear);
        console.log(locationC);

        // if (!locationC && getyear == 0) {
        if (locationC == null) {
            $("#localyear").css({"display": "none"});
        }else{
            let elements = document.querySelectorAll('.getyear');
            if (getyear == 0) {
                // let elements = document.querySelectorAll('.getyear');
                elements.forEach(element => {
                    element.textContent = '1년 미만';
                    // element.textContent = 'ㆍ업력 1년 미만';
                });
                // $(".getyear").val("1년 미만");
            }else{
                // let elements = document.querySelectorAll('.getyear');
                elements.forEach(element => {
                    element.textContent = getyear+"년";
                    // element.textContent = "ㆍ업력 "+getyear+"년";
                });
            }
    }
    
    var yearlenghtElem = $("#yearlenght");
    var salayElem = $("#salay");
    var moneyElem = $("#money");
    var peopleElem = $("#people");

    // 각 요소의 값을 가져옴
    var yearlenght = yearlenghtElem.val();
    console.log(yearlenght);
    var salay = salayElem.val();
    console.log(salay);
    var money = moneyElem.val();
    console.log(money);
    var people = peopleElem.val();
    console.log(people)

    // 모든 값이 비어 있는 경우 요소 숨김
    // if (!yearlenght && !salay && !money && !people) {
    if (yearlenght == null && salay  == null && money  == null && people == null) {
        yearlenghtElem.css("display", "none");
        salayElem.css("display", "none");
        moneyElem.css("display", "none");
        peopleElem.css("display", "none");
    }

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