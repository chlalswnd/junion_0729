<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지원하기</title>
<link rel="stylesheet" href="css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<!-- <script src="js/index.js"></script>   -->
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


section
{
    display: flex;
    justify-content: center;
    align-items: center;
}


/* section */
/* .sectionInner */
.container
{
    padding: 70px 30px;
    width: 500px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

/* section .noticeProfile */
.sectionInner .noticeProfile
{
    margin-bottom: 20px;
    border-bottom: 1px solid var(--border-color-gray);
}

/* section .noticeProfile .comName */
.sectionInner.noticeProfile .comName
{

    font-size: var(--font-size16);
}
/* section .title */
.sectionInner .title
{

    font-size: var(--font-size20);
    font-weight: bold;
    margin-bottom: 10px;
}

/* section .sectionInner .list .profileList */
.sectionInner .list .profileList
{

    width: 500px;
    height: 40px;
    margin-bottom: 10px;
    padding: 5px 30px 5px 10px;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: var(--font-size16);
}

.sectionInner .list .option
{
    height: 40px;
    font-size: var(--font-size16);
}

/* section .sectionInner .name */
.sectionInner .name
{
    border: none;
}

/* section .sectionInner .user */
.sectionInner .user
{
    font-size: var(--font-size14);
    margin-bottom: 10px;
}

/* section .sectionInner .resumeButton */
.sectionInner .resumeButton
{
    display: flex;
    justify-content: center;
    gap: 20px;
}

/* section .sectionInner .resumeButton .resume */
.sectionInner .resumeButton .resume
{
    padding: 10px 40px;
    background-color: var(--main-color);
    font-size: var(--font-size14);
    border-radius: 6px;
    color: var(--color-white);
    border: none;
    cursor: pointer;
}
.sectionInner .resumeButton .rewirte
{
    padding: 10px 40px;
    background-color: var(--button-gray);
    font-size: var(--font-size14);
    border-radius: 6px;
    color: var(--color-black);
    border: none;
    cursor: pointer;
}

</style>
<body>
    <section>
        <div class="container">
            <div class="sectionInner">
                    <!-- <form method="post" action="/resumeUser"> -->
                        <input type="hidden" name="notice_num" id="notice_num">
                        <!-- <input type="hidden" name="com_email" id="com_email" value=${notice.com_email}> -->
                        <!-- <input type="hidden" name="user_email" id="user_email" value=${user_email}> -->
                        <!-- <input type="hidden" name="user_email" id="user_email" value=${login_email}> -->
                        <!-- <div id="com_email">${notice.com_email}</div> com_email 값이 들어갔는지 확인-->
                    <div class="noticeProfile">
                        <div class="comName">${notice.com_name}</div>
                        <div class="noticeTitle">
                            <h5 class="title">${notice.notice_title}</h5>
                        </div>
                    </div><!--noticeProfile : 공고 정보 출력-->
                    <div class="profile">
                        <div class="profileTitle">
                            <h5 class="title">지원 이력서</h5>
                        </div>
                        <div class="list">
                            <select name="resume_num" class="profileList" id="resume_num">
                            <!-- <select name="resume_num" id="resume_num" class="profileList"> -->
                                <option value="" class="option" selected>이력서를 선택해 주세요</option>
                                <c:forEach var="userProfile" items="${userProfile}">
                                    <option class="option" value="${userProfile.resume_num}">${userProfile.resume_title}
                                    <!-- <input type="hidden" name="${userProfile.resume_num}"> -->
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="user">
                                <!-- 지원자 이메일  :${login_email} : 출력됨 -->
                                <!-- 지원자명  :${user_name} -->
                                지원자명  :${login_name}
                            </div>
                        </div><!--list-->
                    </div><!--profile : 이력서 영역-->
                    <div class="resumeButton">
                        <button type="button" class="rewirte">수정하기</button>
                        <button type="button" class="resume" onclick="resumeOK()">지원하기</button><!--ajax로 값을 보내고, 그에 따른 결과를 출력한 후에 창 종료를 위해 form/submit 대신 button/ajax 사용-->
                    </div>
                <!-- </form> -->
                </div><!--sectionInner-->
            </div><!--container-->
    </section>  
</body>
</html>
<script>
    // 24.07.12 하진
$(document).ready(function() {
    function check() {
        var selectedResume = $(".profileList").val();
    }

    function getQueryStringValue(key) {//현재 페이지 URL에서 쿼리스트링으로 넣은 notice_num 값을 가져오는 함수
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(key);
    }

    function insertQueryValue() {
        const queryValue = getQueryStringValue('notice_num');// 가져오고자 하는 쿼리스트링 이름
        if (queryValue) {// 쿼리스트링 이름이 있으면 함수 실행
            $('#notice_num').val(queryValue);
        }
    }

    insertQueryValue();// 함수 실행
 
});

// 24.08.01 하진
// 수정하기 버튼 클릭시 해당 이력서 수정 페이지로 이동
$(".rewirte").click(function () {
    console.log("수정하기 클릭!!")
    var resume_num = document.getElementById("resume_num").value;
    console.log("이력서 번호는 "+resume_num);
    if(resume_num){
        window.opener.location.href="resumeInfo?resume_num="+resume_num;
        window.close();
    }else{
        window.opener.location.href="resumeList";
        window.close;
    }
})


// 2024-07-13 하진
// 2024-07-25 하진
// 2024-07-28 하진
// 이력서 제출 기능
function resumeOK(){
    var notice_num = document.getElementById("notice_num").value;
    // console.log("submit!! notice_num->"+notice_num);
    var resume_num = document.getElementById("resume_num").value;
    // console.log("submit!! resume_num ->"+resume_num);
    var com_email = "${notice.com_email}";
    // console.log("submit com_email!!"+com_email);

    // var user_email = "${user_email}";//controller에서 user_email이란 이름으로 model에 보낸 값을 받는 변수
    var user_email = "${login_email}";// session 값을 직접 가져오도록 로직 수정
    console.log("submit user_email!!"+user_email);


    //24.08.01(하진) : 이력서 수정 페이지로 이동
    $(".rewirte").click(function(){
        
    });//end of rewirte click function


    if(resume_num){
        $.ajax({
                type : "POST",
                url : "/resumeUser",
                data : {
                    notice_num : notice_num, 
                    resume_num : resume_num, 
                    com_email : com_email, 
                    user_email : user_email
                },
                success : function(result){
                    if(result == false){
                    alert("지원이 완료되었습니다!");
                    window.opener.$("#user_resume").removeClass("active");
                    window.close();
                }
                else{
                    alert("이미 지원한 공고입니다.");
                    window.opener.$("#user_resume").removeClass("active");
                    window.close();
                }
            }    
        });//end of ajax
    }else{
        alert("이력서를 선택해주세요.");
    }
}//end of resumeOK
</script>