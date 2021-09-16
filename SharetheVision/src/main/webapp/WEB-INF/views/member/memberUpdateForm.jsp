<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <jsp:include page="/WEB-INF/views/common/common.jsp"/>
    
	    
</head>
<style>
	@font-face {
	    font-family: 'ELAND_Choice_L';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Choice_L.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	#updateFormTable{
		width:70%;
		margin-left: 15%;
	}
	
	#profileImg{
		width:100%;
		height:100%;
		object-fit: fill;
	}
	
	#profileBox{
		width: 200px;
		height: 200px;
		overflow:hidden;
		border-radius: 65%;
		margin:0 auto;
		cursor: pointer
	}
	
	#hiddenButton{
		display:none;
	}
	input[type=password] { font-family: "ELAND_Choice_L"; }
	#random{
		display:none;
	}
</style>
<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

        <!-- sideMenu -->
        <jsp:include page="/WEB-INF/views/common/sideMenu.jsp"/>
        <!-- topMenu -->
		<jsp:include page="/WEB-INF/views/common/topMenu.jsp"/>
		<div class="pcoded-main-container">
	        	<div class="pcoded-wrapper">        
	                    <div class="pcoded-content">
	                        <div class="pcoded-inner-content">
	
	                            <div class="main-body">
	                                <div class="page-wrapper">
	                                    <!-- Page-header start -->
	                                    <div class="page-header card">
	                                        <div class="row align-items-end">
	                                            <div class="col-lg-8">
	                                                <div class="page-header-title">
	                                                    <i class="icofont icofont-user bg-c-pink"></i>
	                                                    <div class="d-inline">
	                                                        <h4>회원정보 수정</h4>
	                                                        <span>회원정보와 비밀번호 및 프로필 사진을 수정하실 수 있습니다.</span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="col-lg-4">
	                                                <div class="page-header-breadcrumb">
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <!-- Page-header end -->
										<form onsubmit="return updateM();" enctype="Multipart/form-data" action="updateProfile.me" method="post">
		                                    <div class="page-body">
		                                        <div class="row">
		                                            <!-- SITE VISIT CHART start -->
		                                            <div class="col-md-12 col-lg-12">
		                                                <div class="card">
		                                                    <div class="card-header">
																<!-- 회원정보 수정 폼 -->
																<!-- 비밀번호, 전화번호, 주소, 프로필 사진, 이메일 -->
																<table id="updateFormTable">
																	<tr style="text-align:center;">
																		<td rowspan="8">
																			<c:if test="${attachment.atChange eq '' || attachment.atChange == null}">
																				<div id="profileBox">
																					<img src="resources/assets/images/defaultProfile.png" id="profileImg"/>
																				</div>
																			</c:if>
																			<c:if test="${attachment.atChange != null }">
																				<div id="profileBox">
																					<img src="resources/muploadFile/${attachment.atChange }" id="profileImg"/>
																				</div>
																			</c:if>
																			<div>
																				<input type="hidden" name="memberProfile" value="${attachment.atChange }" />
																				<input type="file" id="hiddenButton" name="profile" onchange="loadProfile(this);"/>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<label><b>전화번호</b></label>
																			<input type="tel" id="phone" onchange="checkPhone();" class="form-control mt-1 adressInput" required name="phone" value="${loginUser.phone }"/>
																		</td>
																	</tr>
																	<tr><td>&nbsp;</td></tr>
																	<tr>
																		<c:forTokens var="addr" items="${loginUser.address }" delims="." varStatus="status">
																			<c:if test="${status.index eq 0}">
																				<c:set var="post" value="${addr }"></c:set>
																			</c:if>
																			<c:if test="${status.index eq 1}">
																				<c:set var="address1" value="${addr }"></c:set>
																			</c:if>
																			<c:if test="${status.index eq 2}">
																				<c:set var="address2" value="${addr }"></c:set>
																			</c:if>
																		</c:forTokens>
																		<td>
																			<label><b>주소</b></label>
																			<input type="text" id="sample6_postcode" value="${post }" name="address1" readonly class="form-control mt-1 adressInput" placeholder="우편번호 찾기" onclick="sample6_execDaumPostcode()" required>
																			<input type="text" id="sample6_address" value="${address1 }" name="address2" class="form-control mt-1" placeholder="주소" required>
																			<input type="text" id="sample6_detailAddress" value="${address2 }" name="address3" class="form-control mt-1" placeholder="상세주소" required>
																			<input type="hidden" id="sample6_extraAddress" class="form-control"placeholder="참고항목">
																		</td>
																	</tr>
																	<tr><td>&nbsp;</td></tr>
																	<tr>
																		<td>
																			<label><b>이메일</b></label>
																			<input type="hidden" id="hiddenEmail"  value="${loginUser.email }"/>
																			<input type="email" id="email" onblur="changeEmail();" class="form-control mt-1 adressInput" required name="email" value="${loginUser.email }"/>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<input type="hidden" id="randomCheck"/>
																			<input type="text" id="random" onchange="randomNumCheck();" class="form-control" placeholder="인증번호 입력"/>
																			<div id="emailCheckDiv"></div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<label><b>비밀번호 입력</b></label>
																			<input type="password" class="form-control mt-1 adressInput" name="pwd" id="userPwd" onkeyup="userPwdCheck();" required placeholder="기존 비밀번호"/>
																			<div style="color: black; text-align: left; padding-top: 2px;" id="userPwdMessage"></div>
																			
																			<input type="password" class="form-control mt-1 adressInput" name="newPwd" onkeyup="newPwdCheck();"id="newPwd" placeholder="8자 이상 (문자,숫자,특수문자 포함)"/>
																			<div style="color: black; text-align: left; padding-top: 2px;" id="newPwdMessage"></div>
																			
																			<input type="password" class="form-control mt-1 adressInput" id="checkPwd" onkeyup="checkPwdForm();" placeholder="비밀번호 확인"/>
																		<div style="color: black; text-align: left; padding-top: 2px;" id="checkPwdMessage"></div>
																		</td>
																	</tr>
																</table>
																
		                                                    </div>
		                                                    <br>
		                                                    <div class="card-block" style="text-align:center;">
		                                                        <div id="morris-site-visit">
		                                                        	<button type="submit" class="btn btn-danger">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
		                                                        	<button type="button" class="btn btn-inverse btn-outline-inverse" onclick="location.href='home.me'">취소</button>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <!-- SITE VISIT CHART Ends -->
		                                        </div>
		                                    </div>
		                                </form>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편주소 넣기
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	$("#profileBox").click(function(){
		$("#hiddenButton").click();
	});
	
	function loadProfile(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){
				$("#profileImg").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	userPwd = false;
	userNewPwd = false;
	checkPwd = false;
	checkEmail = true;

	// 새로운 비밀번호
	function newPwdCheck(){
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
		var newPwd = document.getElementById("newPwd");
		var pwd2 = document.getElementById("checkPwd");
		var message = document.getElementById("newPwdMessage");
		
		var check = regExp.test(newPwd.value);
		
		if(check){
			message.style.color = "blue";
			message.innerHTML = "<sub>사용가능한 비밀번호 입니다.</sub>";
			userNewPwd = true;
			checkPwd = false;
			
			if(newPwd.value != pwd2.value){
				checkPwdForm();
			}
		} else {
			message.style.color = "red";
			message.innerHTML = "<sub>사용 불가능한 비밀번호 입니다.</sub>";
			userNewPwd = false;
			checkPwd = false;
			
			if(newPwd.value != pwd2.value){
				checkPwdForm();
			}
		}
	}
	
	// 비밀번호 확인
	function checkPwdForm(){
		var pwd1 = document.getElementById("newPwd");
		var pwd2 = document.getElementById("checkPwd");
		var result = document.getElementById("checkPwdMessage");
		
		if(pwd1.value == pwd2.value){
			result.style.color = "blue";
			result.innerHTML = "<sub>비밀번호가 일치합니다.</sub><br>";
			checkPwd = true;
		} else {
			result.style.color = "red";
			result.innerHTML = "<sub>비밀번호가 일치하지 않습니다.</sub><br>";
			checkPwd = false;
		}
		
	}
	
	// 기존 비밀번호 확인
	function userPwdCheck(){
		var pwd = document.getElementById("userPwd").value;
		$.ajax({
			url: "userPwdCheck.me",
			data: {pwd:pwd},
			success:function(data){
				if(data.trim() == 'true'){
					console.log("기존 비밀번호 일치");
					userPwd = true;
				} else {
					console.log("기존 비밀번호 불일치");
					userPwd = false;
				}
			},
			error:function(data){
				console.log("기존 비밀번호 실패");
				userPwd = false;
			}
		});
	}
	
	
	function updateM(){
		var pwd1 = document.getElementById("newPwd");
		var pwd = document.getElementById("userPwd");
		
		if(checkEmail){
			if(pwd1.value.trim() == ""){
				if(userPwd && inputPhone){
					console.log("비밀번호 변경 x 기존 비밀번호 o");
					return true;
				} else {
					console.log("비밀번호 변경 x 기존 비밀번호 x");
					alert("입력하신 정보를 확인해주세요.");
					return false;
				}
			} else {
				if(userPwd && userNewPwd && checkPwd && inputPhone){
					console.log("비밀번호 변경 o 기존 비밀번호 o");
					return true;
				} else {
					console.log("비밀번호 변경 o 기존 비밀번호 x");
					alert("입력하신 정보를 확인해주세요.");
					return false;
				}
			}
		} else {
			alert("이메일 인증해주세요");
			return false;
		}
		
	}
	
	// 이메일 변경시
	function changeEmail(){
		var email = document.getElementById("email").value;
		var hiddenEmail = document.getElementById("hiddenEmail").value;

		if(email.trim() != hiddenEmail.trim()){
			if(confirm("이메일을 변경하시겠습니까?")){
				$.ajax({
					url:"checkEmail.me",
					data:{email:email},
					success:function(data){
						console.log("이메일 인증 성공");
						console.log(data);
						$("#randomCheck").val(data);
						$("#random").show();
						checkEmail = false;
					},
					error:function(data){
						console.log("이메일 인증 실패");
					}
				});		
			} else {
				$("#email").val(hiddenEmail);
				$("#random").hide();
			}
		}
	};
	
	// 인증번호 확인
	function randomNumCheck(){
		console.log("randomNumCheck 들어옴");
		var checkNum = document.getElementById("randomCheck").value;
		var inputNum = document.getElementById("random").value;
		var checkDiv = document.getElementById("emailCheckDiv");

		if(checkNum.trim() == inputNum.trim()){
			checkDiv.innerHTML = '<sub>이메일 인증에 성공하였습니다.</sub>';
			checkDiv.style.color = 'blue';
			checkEmail = true;
		} else {
			checkDiv.innerHTML = '<sub>인증번호가 일치하지 않습니다.</sub>';
			checkDiv.style.color = 'red';
			checkEmail = false;
		}
		
	}
	
	inputPhone = true;
	
	//전화번호 정규식
	function checkPhone(){
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		var phone = document.getElementById("phone").value;
		
		var check = regExp.test(phone);
		if(!check){
			inputPhone = false;
			alert("전화번호 양식을 확인해주세요.");
		} else {
			inputPhone = true;
		}
		
	}
	
</script>	
</body>


</html>
