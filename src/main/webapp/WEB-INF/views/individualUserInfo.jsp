<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인-회원정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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

 

/* 메인 */
main 
	{
	display: flex;
	justify-content: center;
	padding: 50px 0 120px;  
	}

	.infoWrap
	{
		display: flex;
		flex-direction: column; 
		min-width:1200px;
		gap: 40px 0;
	}



/*회원정보수정 타이틀*/

.infoTitle
{
  font-size: var(--font-size32);
  color: var(--color-black);
}

/*회원사진 + 테이블*/
.infoConWrap
{
  display : flex;
  gap: 50px;
  /* margin-top: 80px; */
}

/*회원사진*/
.infoCon img
{
  width: 100px;
}


/*회원정보 테이블*/


.userInfoTable
{
  border: 1px solid var(--input-gray);
  border-radius: 10px;
  box-sizing: border-box;
  border-collapse: collapse;
  font-size: var(--font-size16);
}
.userInfoTable th
{
  width: 300px;
  background-color: var(--button-gray);
}

.userInfoTable td
{
  width: 750px;
}
.userInfoTable th, td
{
  border-bottom: 1px solid var(--input-gray);
  padding: 0 20px;
  text-align: start;
  height: 60px;
}

/*희망직무, 기술스택 버튼들 */
.userInfoTable .disF .position 
{
  display: flex;
  align-items: center;
  gap: 20px;
  width: inherit;
}

.userInfoTable .disF .stack 
{
  display: flex;
  align-items: center;
  gap: 20px;
  width: inherit;
}

.userInfoTable td .Btn
{
  background-color: #f7f7f7;
	border: 1px solid var(--input-gray);
	color: #777;
	font-size: var(--font-size14);
	border-radius: 6px;
	align-items:center;
	justify-content:center; 
	padding: 8px 10px;
}


/*수정버튼*/
.modifyBtn
{
  display: flex;
  justify-content: center;
}
.buttonModify
{
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
                    <form method="post" id="userInfoForm" action="modifyPage">
                        <div class="infoWrap">
                            <h2 class="infoTitle">회원 정보 수정</h2>
                            <div class="infoConWrap">
                                <div class="infoCon left">
                                    <img src="images/people.svg" alt="#" class="resumeImage">
                                </div>
                                <div class="infoCon right">
                                    <table class="userInfoTable">	
                                        <tr>
                                            <th>이름</th>
                                            <td>${userInfo.user_name}</td>
                                        </tr>
                                        <tr>
                                          <th>이메일</th>
                                          <td>${userInfo.user_email}</td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>${userInfo.user_birthdate}</td>
                                        </tr>
                                        <tr>
                                            <th>성별</th>
                                            <td>${userInfo.user_gender}</td>  
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td>${userInfo.user_tel}</td>
                                        </tr>
                                        <tr>
                                          <th>희망직무</th>
                                          <td class="disF">
                                              <div class="position" id="position">
                                                  <c:forEach items="${jobInfo}" var="dto">
                                                    <input type="button" class="Btn" value="${dto.job_name}">
                                                  </c:forEach>
                                              </div>
                                          </td>
                                        </tr>
                                        <tr>
                                            <th>기술스택</th>
                                            <td class="disF">
                                                <div class="stack" id="stack">
                                                  <c:forEach items="${stackInfo}" var="dto">
                                                    <input type="button" class="Btn" value="${dto.stack_name}">
                                                  </c:forEach>  
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                          <th>희망근무지역</th>
                                          <td>${userInfo.user_location} ${userInfo.user_location2}</td>
                                      </tr>
                                    </table>
                                </div><!-- infoCon right 끝 -->
                            </div> <!-- infoConWrap 끝-->
                            <div class="modifyBtn">
                                <button class="buttonModify">수정</button>
                                <!-- <button class="buttonModify" onclick="location.href='/modifyPage'">수정</button> -->
                            </div>
                        </div> <!--infoWrap끝 : 개인정보  -->
                    </form>
                </div> <!-- mainContainer 끝 : 전체 1200 영역-->
            </main>
        </div><!-- mainContent-->
    </div>    
	<%@ include file="footer.jsp" %>
</body>
</html>
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