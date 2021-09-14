<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SV Company</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<script type="text/javascript" src="resources/assets/js/qrcode.js"></script>
<script type="text/javascript" src="resources/assets/js/jsQR.js"></script>
<style>
	#main h1{font-family : 'TmonMonsori'}
	
 	#main {
  		width: 90%; 
  		text-align: center;
 		margin-left: auto;
 		margin-right: auto;
 	}
 	
 	#outputMessage, #outputData{
 		font-family: 'SpoqaHanSansNeo-Medium'
 	}
 	
 	#title{
 		margin-top: 40px;
 		margin-bottom: 30px;
 	}
	
/* 	#main>div { */
/* 		float: left; */
/* 		width: 1%; */
/* 		height: 98%; */
/* 	} */
	
/* 	#main>div:first-child { */
/* 		width: 49%; */
/* 	} */
	
/* 	#main>div:last-child { */
/* 		background-color: #D3D3D3; */
/* 		width: 49%; */
/* 	} */
	
 	#output {
 		background-color: #D3D3D3; 
 		padding: 10px;
 		margin-top: 30px;
 		font-size: 16px;
 	} 
	
 	#frame { 
 		border: 2px solid #D3D3D3; 
 		background-color: #FFFFFF; 
 		margin-left: 10px; 
 		margin-right: 10px; 
 		padding: 8px;
 	} 
	
/* 	#outputLayer { */
/* 		text-align: left; */
/* 	} */
	
 	#canvas { 
 		width: 100%; 
 	} 
</style>
<jsp:include page="../common/common.jsp" />
<jsp:include page="../common/font.jsp" />
</head>
<body>
	<div id="main">
		<div id="title">
			<h1>QR 코드 리더</h1>
			<div id="output">
				<div id="outputMessage">
					<i class="icofont icofont-info-circle"></i>
					QR코드를 카메라에 노출시켜 주세요
				</div>
				<div id="outputLayer" hidden>
					<span id="outputData"></span>
				</div>
			</div>
		</div>
	
		<div>&nbsp;</div>
	
		<div>
			<div id="frame">
				<div id="loadingMessage">
					🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오
				</div>
				<canvas id="canvas"></canvas>
			</div>
		</div>
	</div>

<script>

	document.addEventListener("DOMContentLoaded", function() {
		var video = document.createElement("video");
		var canvasElement = document.getElementById("canvas");
		var canvas = canvasElement.getContext("2d");
		var loadingMessage = document.getElementById("loadingMessage");
		var outputContainer = document.getElementById("output");
		var outputMessage = document.getElementById("outputMessage");
		var outputData = document.getElementById("outputData");

		function drawLine(begin, end, color) {
			canvas.beginPath();
			canvas.moveTo(begin.x, begin.y);
			canvas.lineTo(end.x, end.y);
			canvas.lineWidth = 4;
			canvas.strokeStyle = color;
			canvas.stroke();
		}

		// 카메라 사용시
		navigator.mediaDevices.getUserMedia({
			video : {facingMode : "environment"}
		}).then(function(stream) {
			video.srcObject = stream;
			video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달
			video.play();
			requestAnimationFrame(tick);
		});

		function tick() {
			loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."
			if (video.readyState === video.HAVE_ENOUGH_DATA) {
				loadingMessage.hidden = true;
				canvasElement.hidden = false;
				outputContainer.hidden = false;

				// 읽어들이는 비디오 화면의 크기
				canvasElement.height = video.videoHeight;
				canvasElement.width = video.videoWidth;
				canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
				var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);

				var code = jsQR(imageData.data, imageData.width,imageData.height, {
							inversionAttempts : "dontInvert",
				});

				// QR코드 인식에 성공한 경우
				if (code) {
					// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
					drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");
					drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");
					drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");
					drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000");

					outputMessage.hidden = true;
					outputData.parentElement.hidden = false;

					// QR코드 메시지 출력
					outputData.innerHTML = code.data;

					if(confirm('출근하시겠습니까?') == true){ //확인

						var mCode = '<c:out value="${loginUser.mCode}"/>';
						
						location.href="commuteEnter.co?mCode="+mCode;
						
						return;
                    } else {
                    	return false;
                    }
				}

				// QR코드 인식에 실패한 경우 
				else {
					outputMessage.hidden = false;
					outputData.parentElement.hidden = true;
				}
			}
			requestAnimationFrame(tick);
		}

	});
</script>
</body>
</html>