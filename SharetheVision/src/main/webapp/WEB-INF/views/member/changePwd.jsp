<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    
    <jsp:include page="/WEB-INF/views/common/common.jsp" />
</head>
<style>
	@font-face {
	    font-family: 'ELAND_Choice_L';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Choice_L.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	#loginSection{
		background-image:url('resources/assets/images/login.png');
		background-size: cover;
	}
	input[type=password] { font-family: "ELAND_Choice_L"; }
</style>
<body class="fix-menu">
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

    <section class="login p-fixed d-flex text-center bg-primary" id="loginSection">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form onsubmit="return submitPwd();" action="updatePwd.me" method="post" class="md-float-material">
<!--                             <div class="text-center"> -->
<!--                                 <img src="resources/assets/images/loginLogo.png" alt="logo.png" style="width:80%;"> -->
<!--                             </div> -->
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">비밀번호 변경</h3>
                                        <br>
                                        <span><i class="ti-lock" style="color: black;"></i></span>
	                                    <span class="text-left" style="color:black;">비밀번호는 <span style="color: red;">숫자</span>와 <span style="color: red;">특수문자</span>를 반드시 포함해야합니다.</span>
                                    </div>
                                </div>
                                <hr/>
                                <div>
                                	<input type="hidden" name="mId" value="${ mId }"/>
                                    <input type="password" class="form-control" id="newPwd" name="pwd" required placeholder="8자 이상 (문자,숫자,특수문자 포함)" onkeyup="newPwdCheck();"/>
                                    <span class="md-line"></span>
                                </div>
                                <div style="color: black; text-align: left; padding-top: 2px;" id="newPwdMessage"></div>
                                <br>
                                <div>
                                    <input type="password" class="form-control" id="checkPwd"required placeholder="비밀번호 확인" onkeyup="checkPwdForm();">
                                    <span class="md-line"></span>
                                </div>
                                <div style="color: black; text-align: left; padding-top: 2px;" id="checkPwdMessage"></div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">비밀번호 변경</button>
                                    </div>
                                </div>
                                <hr/>

                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
</body>
<script>
	userPwd = false;
	checkPwd = false;
	
	function newPwdCheck(){
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
		var newPwd = document.getElementById("newPwd");
		var pwd2 = document.getElementById("checkPwd");
		var message = document.getElementById("newPwdMessage");
		
		var check = regExp.test(newPwd.value);
		
		if(check){
			message.style.color = "blue";
			message.innerHTML = "<sub>사용가능한 비밀번호 입니다.</sub>";
			userPwd = true;
			checkPwd = false;
			
			if(newPwd.value != pwd2.value){
				checkPwdForm();
			}
		} else {
			message.style.color = "red";
			message.innerHTML = "<sub>사용 불가능한 비밀번호 입니다.</sub>";
			userPwd = false;
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
	
	function submitPwd(){
		if(userPwd && checkPwd){
			console.log(userPwd);
			console.log(checkPwd);
			return true;
		} else {
			console.log(userPwd);
			console.log(checkPwd);
			alert("비밀번호를 확인해주세요");
			return false;
		}
	}
	
	
</script>
</html>
