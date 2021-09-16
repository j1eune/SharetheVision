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
<body class="fix-menu" onload="enter();">
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
<!--                             <div class="text-center"> -->
<!--                                 <img src="resources/assets/images/loginLogo.png" alt="logo.png" style="width:80%;"> -->
<!--                             </div> -->
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
<!--                                         <h3 class="text-left txt-primary">Sign In</h3> -->
										<img src="resources/assets/images/loginLogo.png" style="width: 70%">
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                    <input type="text" name="mId" id="mId" class="form-control" placeholder="Id">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" name="pwd" id="userPwd" style="color: black;" class="form-control" placeholder="Password">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-sm-7 col-xs-12">
                                        <div class="checkbox-fade fade-in-primary">
                                        </div>
                                    </div>
                                    <div class="col-sm-5 col-xs-12 forgot-phone text-right">
                                    	<c:url var="findPwdForm" value="findPwdForm.me">
                                    	</c:url>
                                        <a href="${findPwdForm }" class="text-right f-w-600 text-inverse"> 비밀번호 찾기</a>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" onclick="login();" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">로그인</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Share the Vison을 이용해주셔서 감사합니다.</p>
                                        <p class="text-inverse text-left"><b>SV Company</b></p>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
                                </div>

                            </div>
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

	function login(){
		var mId = $("#mId").val();
		var pwd = $("#userPwd").val();
		
		if(mId == '' || pwd == ''){
			alert("아이디 혹은 비밀번호를 입력해주세요");
		} else {
			$.ajax({
				type: "POST",
				url: "login.me",
				data:{mId: mId, pwd: pwd},
				success: function(data){
					if(data.trim() == "true"){
						location.href="main";
					} else {
						alert("아이디 혹은 비밀번호를 확인해주세요");
					}
				},
				error: function(data){
					
				}
			});
		}
		
	};
	
	function enter(){
		$("#loginSection").bind("keypress", function(e){
			if(e.keyCode == 13){
				login();
			}
		})
	}
	
</script>

</html>
