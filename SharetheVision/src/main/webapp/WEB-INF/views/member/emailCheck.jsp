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
	#loginSection{
		background-image:url('resources/assets/images/login.png');
		background-size: cover;
	}
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
                        <form onsubmit="return randomNumCheck();"action="updatePwdForm.me" method="post" class="md-float-material">
<!--                             <div class="text-center"> -->
<!--                                 <img src="resources/assets/images/loginLogo.png" alt="logo.png" style="width:80%;"> -->
<!--                             </div> -->
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12" style="text-align: left">
                                        <h3 class="text-left txt-primary">비밀번호 찾기</h3>
                                        <span class="text-left" style="color: black;">입력된 메일로 인증번호가 발송 되었습니다.</span><span id="displayTimer" style="color: red; padding-left: 10px;"></span>
                                    </div>
                                </div>
                                <hr/>
                                <br>
                                <div class="input-group">
                                	<input type="hidden" id="random" value="${ random }"/>
                                    <input type="text" class="form-control" id="inputRandom" name="certification" placeholder="인증문자를 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="hidden" name="mId" value="${ mId }">
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">인증번호 입력</button>
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

	function $ComTimer(){
	    //prototype extend
	}
	
	$ComTimer.prototype = {
	    comSecond : ""
	    , fnCallback : function(){}
	    , timer : ""
	    , domId : ""
	    , fnTimer : function(){
	        var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
	        this.comSecond--;					// 1초씩 감소

	        this.domId.innerText = m;
	        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
	            clearInterval(this.timer);		// 타이머 해제
	            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
// 	            location.href="findPwdForm.me";
				location.href="javascript:history.go(-1)";
	        }
	    }
	    ,fnStop : function(){
	        clearInterval(this.timer);
	    }
	};
	var AuthTimer = new $ComTimer();
	
	AuthTimer.comSecond = 180;
	AuthTimer.fnCallback = function(){
			alert("다시인증을 시도해주세요.");
			location.href="findPwdForm.me";
	};
	AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
	AuthTimer.domId = document.getElementById("displayTimer");

	count = 1;
	
	function randomNumCheck(){
		var ran1 = document.getElementById("random").value;
		var ran2 = document.getElementById("inputRandom").value;
		
		
		console.log(count);
		
		if(ran1 == ran2){
			return true;
		} else {
			if(count > 6){
				alert("인증번호가 일치하지 않습니다. 재시도 가능 횟수를 초과하여 메일인증 페이지로 돌아갑니다.");
				location.href="findPwdForm.me";
				return false;
			}
			alert("인증번호가 일치하지 않습니다. 재시도 가능 횟수("+count+"/6)");
			count++;
			return false;
		}
	}
	
	
</script>
</html>
