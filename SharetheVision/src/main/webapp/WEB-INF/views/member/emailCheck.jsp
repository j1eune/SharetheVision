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
                                        <h3 class="text-left txt-primary">???????????? ??????</h3>
                                        <span class="text-left" style="color: black;">????????? ????????? ??????????????? ?????? ???????????????.</span><span id="displayTimer" style="color: red; padding-left: 10px;"></span>
                                    </div>
                                </div>
                                <hr/>
                                <br>
                                <div class="input-group">
                                	<input type="hidden" id="random" value="${ random }"/>
                                    <input type="text" class="form-control" id="inputRandom" name="certification" placeholder="??????????????? ??????????????????">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="hidden" name="mId" value="${ mId }">
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">???????????? ??????</button>
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
	        var m = Math.floor(this.comSecond / 60) + "??? " + (this.comSecond % 60) + "???";	// ?????? ?????? ??????
	        this.comSecond--;					// 1?????? ??????

	        this.domId.innerText = m;
	        if (this.comSecond < 0) {			// ????????? ?????? ????????????..
	            clearInterval(this.timer);		// ????????? ??????
	            alert("??????????????? ?????????????????????. ?????? ?????????????????? ????????????.");
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
			alert("??????????????? ??????????????????.");
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
				alert("??????????????? ???????????? ????????????. ????????? ?????? ????????? ???????????? ???????????? ???????????? ???????????????.");
				location.href="findPwdForm.me";
				return false;
			}
			alert("??????????????? ???????????? ????????????. ????????? ?????? ??????("+count+"/6)");
			count++;
			return false;
		}
	}
	
	
</script>
</html>
