<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이페이지 - 상세정보 수정</title>
<!--    <link rel="stylesheet" href="css/default.css">-->
<!--    <link rel="stylesheet" href="css/company_InfoDetailUpdate.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companyInfoDetailUpdate.css">
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    <!-- import js -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <!--kakao map -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48ca63ceb0746787c922c8da8f33b705&libraries=services"></script>
    <script src="js/index.js"></script>     
    <meta charset="utf-8"/>
    <style>
        .company
        {
            display: flex;
            width: 100%;
        }
    </style>

</head>
<body>
    <!-- 섹션-->
    <!-- <section style="padding-top: 90px;">     -->
    <main>
        <%@ include file="../header.jsp" %>
        <section>    
        <!-- <section>     -->
                  
            <div class="wrap">

                
                <!-- <div class="left"> -->
                    <!-- <div class="toptitle">
                        <h3 class="toptitle1" >상세 정보 수정</h3> 
                    </div>   -->
                <!-- </div> -->
                    <!-- 컴퍼니 시작-->
                    <form id="comInfoUpdate" method="post" action="modifyDetail">
                    <input type="hidden" name="com_email" value="${login_email}">
                        <div class="company">
                            <div class="uploadResult">
                                <ul class="comInfoImage">
                                </ul>
                            </div>
                            <label for="photo" style='cursor: pointer;'>
                                <div class="imgg">기업 사진 수정하기</div>
                            </label>
                            <input type="file" name="uploadFile" id="photo" accept="image/*,.txt">
                        </div>

                        <div class="main">
                            <div class="sub1">
                                <div class="namaing">
                                    <h5 class="title">기업명</h5>
                                    <div class="write">
                                        <!-- <input  type="text" name="com_name" class="comname" placeholder="${companyInfo.com_name}"> -->
                                        <input  type="text" name="com_name" class="comname" value="${companyInfo.com_name}">
                                        <!-- <div class="message">기업명을 확인해주세요</div> -->
                                    </div>
                                </div>
        
                                <div class="comadd">
                                    <h5 class="title">창립일 </h5>
                                    <div class="comadressyear">
                                        <input  type="date" id="Date" name="com_year" class="comadress" value="${companyInfo.com_year}">
                                        <!-- <input  type="date" name="com_year" class="comadress"> -->
                                    </div>
                                </div>
                            </div>
                        </div><!--main-->


                        <!-- 컬럼 시작-->


                    <div class="column"> 

                        <div class="col1">
                            <div class="columnA">
                                <h5 class="title">회사 소개</h5>
                            </div>
                            <div class="columnAA">
                                <textarea name="com_content" class="detailtext">${companyInfo.com_content}</textarea>
                            </div>
                        </div>

                        <div class="sectionCon techWrap">
                            <div class="sectionTitleWrap modify">
                                <h3 class="sectionTitle tech">기술 스택 · 툴</h3>
                                <div class="sectionNotice">기술 스택· 툴 선택 후 저장 버튼을 눌러주세요</div>
                                <button class="saveTech" type="button">저장</button>
                            </div>                    
                            <div class="sectionConBody tech">
                                <div class="Bodycon tech">
                                    <input type="hidden" class="techValue" id="techValue" name="com_stack"> <!-- com_stack value 저장장소-->
                                    <div class="comadress">
                                        <div class="techCon">
                                            <div class="buttonTitle">기술</div>
                                            <div class="buttonWrap">	                                    
                                                <c:forEach var="dto" items="${stack_name}">
                                                    <input type="button" class="tech" name="com_stack" value="${dto.stack_name}">
                                                </c:forEach>
                                            </div>
                                        </div>    
                                        <div class="techCon">
                                            <div class="buttonTitle">디자인</div>
                                            <div class="buttonWrap">
                                                <c:forEach var="dto" items="${stack_name2}">
                                                    <input type="button" class="tech" name="com_stack" value="${dto.stack_name}">
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="techCon">
                                            <div class="buttonTitle">기획</div>
                                            <div class="buttonWrap">
                                                <c:forEach var="dto" items="${stack_name3}">
                                                    <input type="button" class="tech" name="com_stack" value="${dto.stack_name}">
                                                </c:forEach>
                                            </div>
                                        </div>                        
                                    </div>                        
                                </div>                        
                            </div> <!-- sectionConBody 끝 -->
                        </div> <!-- techWrap 끝 -->

                        <div class="col7">
                            <div class="columnA">
                                <h5 class="title">회사 위치</h5>
                            </div>
                            <!-- <div class="columnBB"> -->
                                <!-- <div class="detail"> -->
                                    <div id="map" clss="map"></div>
                                    <div class="mapLocation">
                                        <input  type="text" name="com_location" id="sample5_address" class="maptext" value="${companyInfo.com_location}">
                                        <input type="button" class="searchButton" onclick="sample5_execDaumPostcode()" value="주소 검색">
                                    </div>
                            <!-- </div> -->
                        </div>

                        <div class="col8">
                            <div class="columnA">
                                    <h5 class="title">
                                        기업정보
                                    </h5>
                                </div>
                                <div class="content">
                                    
                                    <div class="contentDetail">
                                        <div class="comname1">
                                            <h5 class="name">
                                                매출액 (<span class="nowYear"></span>년)
                                            </h5>
                                        </div>
                                        <div class="comname2">
                                            <input type="number" name="com_sale" class="cominfotext" placeholder="단위 : 만원" value="${companyInfo.com_sale}">
                                        </div>
                                    </div>

                                    <div class="contentDetail">
                                        <div class="comname1">
                                            <h5 class="name">
                                                기업유형
                                            </h5>
                                        </div>
                                        <div class="comname2">
                                            <select name="com_type" id="com_type" class="cominfotext">
                                                <c:choose>
                                                    <c:when test="${companyInfo.com_type != null}">
                                                        <option value="${companyInfo.com_type}" selected>${companyInfo.com_type}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="" selected>유형을 선택해주세요</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <option value="합명회사">합명회사</option>
                                                <option value="합자회사">합자회사</option>
                                                <option value="유한책임회사">유한책임회사</option>
                                                <option value="주식회사">주식회사</option>
                                                <option value="유한회사">유한회사</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="contentDetail">
                                        <div class="comname1">
                                            <h5 class="name">
                                                평균연봉
                                            </h5>
                                        </div>
                                        <div class="comname2">
                                            <input type="number" name="com_salary" class="cominfotext" placeholder="단위 : 만원" value="${companyInfo.com_salary}">
                                        </div>
                                    </div>

                                    <div class="contentDetail">
                                        <div class="comname1">
                                            <h5 class="name">
                                                대표자명
                                            </h5>
                                        </div>
                                        <div class="comname2">
                                            <input type="text" name="com_CEO" class="cominfotext" value="${companyInfo.com_CEO}">
                                        </div>
                                    </div>

                                    <div class="contentDetail">
                                        <div class="comname1">
                                            <h5 class="name">
                                                홈페이지
                                            </h5>
                                        </div>
                                        <div class="comname2">
                                            <input type="url" name="com_site" class="cominfotext" value="${companyInfo.com_site}">
                                        </div>
                                    </div>

                                    <div class="contentDetail">
                                        <div class="comname1">
                                            <h5 class="name">
                                                가입 사원수 (인원)
                                            </h5>
                                        </div>
                                        <div class="comname2">
                                            <input type="number" name="com_employee" class="cominfotext" placeholder="단위 : 명" value="${companyInfo.com_employee}">
                                        </div>
                                    </div>
                                </div>
                                
                            </div><!--columnA-->

                            <div class="submit">    
                                <input type="button" value="수정 취소" class="ytn" onclick="location.href='companyInfoManagement'">
                                <!-- <input type="submit" class="btn" value="수정 완료"> -->
                                <!-- <input type="button" class="btn" value="수정 완료" onclick="valuecheck()"> -->
                                <input type="submit" class="btn" value="수정 완료">
                                <!-- <button type="submit" class="btn">수정 완료</button> -->
                            </div>
                                
                        </div><!--col8-->



                    </div><!-- 컬럼 끝-->
                    <!-- </div> left 끝 -->
                </form>
            </div> <!-- wrap 끝-->
        </section> <!--section 끝 -->
		<%@ include file="../footer.jsp" %>
    </main>
    </div>
</html>
<script>
	$(document).ready(function()
	{	

	    // $('.Bodycon.tech input.tech').click(function(){//기술 스택 선택시 값을 넣는 쿼리
	    //     $(this).toggleClass('active');
	    // });	
		
		// var buttons = $('.Bodycon.tech input.tech');
		// var techValue = $('#techValue');		
		// var submit = $('button.saveTech');
		// // 제출 버튼 클릭 시
		// submit.on('click', function() {
        // // 'on' 클래스가 있는 버튼들의 값을 배열에 저장
        // var buttonValues = [];
        // buttons.filter('.active').each(function() {
        //     buttonValues.push($(this).val());
        // });

        // // AJAX 요청을 통해 서버로 데이터 전송
        // $.ajax({
        //     url: "/companyInfoDetailUpdate", // 실제 서버 엔드포인트 URL
        //     type: "POST",  
        //     async: false,          
        //     data: JSON.stringify({com_stack: buttonValues}),
        //     success: function(response) {
        //         // 선택된 값을 wishJob 입력 필드에 쉼표로 구분된 문자열로 표시
        //         techValue.val(buttonValues.join(', '));
        //     },
        //     error: function(response) {
        //         // 요청 중 오류 발생 시 처리
        //         console.error(response);
        //     }
        // });
        $('.Bodycon.tech input.tech').click(function(){
            console.log("click!!");
	        $(this).toggleClass('active');
	    });	

		var buttons = $('.Bodycon.tech input.tech');
		var techValue = $('#techValue');		
		var submit = $('button.saveTech');
		// 제출 버튼 클릭 시
		submit.on('click', function() {
        // 'on' 클래스가 있는 버튼들의 값을 배열에 저장
			var buttonValues = [];
			buttons.filter('.active').each(function() {
				buttonValues.push($(this).val());
			});

			techValue.val(buttonValues.join(', '));
		});

    // });

  
	});//end of document ready

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨(크기가 클수록 상세 확대창을 보여줌)
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // console.log("이건 뭐죠?"+addr);

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<script>
	// 이미지 업로드
	// $(document).ready(function (e){
		var formObj = $("form[id='comInfoUpdate']");

		$("input[type='submit']").on("click", function(e){
		// $("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");

    //             e.preventDefault();
    // console.log("submit clicked");

    /*
        2024-07-24 하지수 
        유효성 검사
    */
    var requiredFields = [
        {name: "com_name", message: "기업명을 입력해주세요."},
        {name: "com_foundation", message: "창립일을 입력해주세요."},
        {name: "com_content", message: "회사 소개를 입력해주세요."},
        {name: "com_sale", message: "매출액을 입력해주세요."},
        {name: "com_type", message: "회사 유형을 선택해주세요."},
        {name: "com_salary", message: "평균 연봉을 입력해주세요."},
        {name: "com_CEO", message: "대표자명을 입력해주세요."},
        {name: "com_site", message: "회사 홈페이지의 주소를 입력해주세요."},
        {name: "com_employee", message: "사원수를 입력해주세요."},
        {
            name: "com_stack", 
            message: "스택을 선택해주세요.",
            validate: function() {
                // 여기에서 hidden 필드의 값을 확인합니다.
                var hiddenFieldValue = $("#techValue").val().trim();
                return hiddenFieldValue !== "";
            }
        }
    ];

    // var isValid = true;

    for (var i = 0; i < requiredFields.length; i++) {
                var field = requiredFields[i];

                // 일반 필드와 특별한 기술 스택 필드를 구분
                if (field.name === "stack_name") {
                    if (!field.validate()) {
                        alert(field.message);
                        $(".tech").first().focus(); // 'tech' 버튼 중 첫 번째에 포커스를 이동
                        return;
                    }
                } else {
                    // var fieldValue = $("[name='" + field.name + "']").val().trim();
                    var fieldValue = $("[name='" + field.name + "']").val();
                    if (fieldValue === "") {
                        alert(field.message);
                        $("[name='" + field.name + "']").focus();
                        return;
                    }
                }
            } //유효성 검사 끝 --	
    // if (isValid) {
        
    // }
// });

			var str="";

			$(".uploadResult ul li").each(function (i, obj){
				console.log("@# obj=>"+$(obj));
				console.log("@# obj=>"+$(obj).data());
				console.log("@# obj=>"+$(obj).data("filename"));
				// return;

				var jobj = $(obj);
				// JavaScript개체의 속성에 대한 목록을 표시
				console.dir(jobj);
				console.log("================================");
				console.log(jobj.data("filename"));
				console.log(jobj.data("uuid"));
				console.log(jobj.data("path"));
				console.log(jobj.data("type"));

				str += "<input type='hidden' name='companyAttachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='companyAttachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='companyAttachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='companyAttachList["+i+"].image' value='"+jobj.data("type")+"'>";
			});//end of uploadResult ul li

			console.log(str);
			// return;
			formObj.append(str).submit();
		});//end of button submit

		//확장자(exe, sh, alz), 파일크기(5MB 미만) 조건
		//확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
		var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
		var maxSize = 5242880;//5MB

		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		$("input[type='file']").change(function (e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			//files : 파일정보
			var files = inputFile[0].files;

			for(var i=0; i<files.length; i++){
				console.log("@# files=>"+files[i].name);

				//파일크기와 종류중에서 거짓이면 리턴
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}

				//파일 정보를 formData에 추가
				formData.append("uploadFile",files[i]);
			}

			$.ajax({
				 type: "post"
				,data: formData
				//컨트롤러단 호출
				,url: "comUploadAjaxAction"
                //processData : 기본은 key/value 를 Query String 으로 전송하는게 true
                //(파일 업로드는 false)
				,processData: false
                //contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
                //첨부파일은 false : multipart/form-data로 전송됨
				,contentType: false
				,success: function(result){
					alert("사진 업로드 완료");
					console.log(result);
					//파일정보들을 함수로 보냄
					showUploadResult(result);//업로드 결과 처리 함수 
				}
			});//end of ajax

			function showUploadResult(uploadResultArr){
				if(!uploadResultArr || uploadResultArr.length == 0){
					return;
				}

				var uploadUL = $(".uploadResult ul");
				var str="";

				$(uploadResultArr).each(function (i, obj){
					//image type
					if (obj.image) {
						console.log("@# obj.uploadPath=>"+obj.uploadPath);
						console.log("@# obj.uuid=>"+obj.uuid);
						console.log("@# obj.fileName=>"+obj.fileName);

						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						// var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/s_"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>"
						str + "<div>";

						str += "<span style='display:none;'>"+obj.fileName+"</span>";
						str += "<img src='/comDisplay?fileName="+fileCallPath+"'>";//이미지 출력 처리(컨트롤러단)
						str += "</div>";
						str += "<div class='imgDelete'>";
						// str += "<span data-file=\'"+ fileCallPath +"\'data-type='image'><i class='fa-regular fa-trash-can'></i></span>";
						str += "<span style='cursor: pointer;' data-file=\'"+ fileCallPath +"\'data-type='image'>이미지 삭제</span>";
						str += "</div></li>";
					} else {
						// var fileCallPath = obj.uploadPath + obj.uuid + "_" + obj.fileName;
						var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid + "_" + obj.fileName);
						// str += "<li><div>";

						str += "<li data-path='" + obj.uploadPath + "'";
						str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
						str + " ><div>";

						str += "<span>"+obj.fileName+"</span>";
						// str += "<img src='./resources/img/attach.png'>";
						str += "<span data-file=\'"+ fileCallPath +"\'data-type='file'> [삭제] </span>";
						str += "</div></li>";
					}
				});//end of each

				//div class 에 파일 목록 추가
				uploadUL.append(str);
                $('.imgg').css({"display":"none"});
			}

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
					,url: "comInfoDeleteFile"
					,success: function(result){
						alert(result);
						//브라우저에서 해당 썸네일이나 첨부파일이미지 제거
						uploadResultItem.remove();

                        if($(".uploadResult ul li").length === 0){
							$('.imgg').css({"display":"flex"}); // 모든 파일이 삭제되면 보이기
						}
					}
				});//end of ajax
			});//end of click
		});//end of change 
	// });//end of ready // 이미지 업로드 끝


// 24.07.24 하진
// 창립일 선택시 현재 날짜 이후의 날짜를 막는 코드
var now = new Date(); // 지금 날짜를 가져옴
console.log(now);
var today = now.toISOString().substring(0,10);
document.getElementById("Date").setAttribute("max", today);

$("span").text(now.getFullYear());

</script>