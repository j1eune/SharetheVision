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
<link href="resources/assets/css/datePicker/datePicker2.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript" src="resources/assets/js/qrcode.js"></script>
<style>
	.listTable>thead>tr>th, .listTable>tbody>tr>td, .listTable>tbody>tr>td>div {
		text-align: center;
	}
	
	#leaveTime input[type="radio"] {
		visibility: hidden;
		height: 0;
		width: 0;
	}
	
	#leaveTime label {
		/* display: table-cell; */
		vertical-align: middle;
		text-align: center;
		cursor: pointer;
		background-color: white;
		color: #FFB64D;;
		border: 1px solid #FFB64D;;
		padding: 5px 10px;
		border-radius: 3px;
	}
	
	#leaveTime input[type="radio"]:checked+label {
		background-color: #FFB64D;;
		color: white;
	}
	
	#commuteDiv button{
		color: #660099;
		border: 1.6px solid #660099;
		background-color: #fff;
		background-color: transparent;
		font-size: 15px;
		border-radius: 20px;
	}
	
	#commuteDiv button:hover{
		color: white;
		background-color: #660099;
	}
	
	#commuteDiv span{
		font-family: 'SpoqaHanSansNeo-Bold';
	}
	
	#commuteTable td{
		font-size: 1.2rem;
		font-family: 'SpoqaHanSansNeo-Medium';
	}
	
	#commuteTable {
		  border-collapse: separate;
		  border-spacing: 0 5px;
	}
	
	#stateDiv{
		margin-top: 20px;
/* 		margin-bottom: 30px; */
	}
	
	#stateDiv button{
		color: #660099;
		border: 1.3px solid #660099;
		background-color: #fff;
		background-color: transparent;
		font-size: 11px;
 		padding: 5px 7px 5px 7px; 
	}
	
	#stateDiv button:hover{
		color: white;
		background-color: #660099;
	}
	
	#stateDiv span{
		font-family: 'SpoqaHanSansNeo-Regular';
	} 
	
	#myChart{
	    margin: 0 auto;
	}
	
	#overworkHour, #workHour{
		font-size: 18px;
		font-weight: bold;
	}

</style>
<jsp:include page="../common/common.jsp" />
<jsp:include page="../common/font.jsp" />
</head>
<body>
<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring">
                <div class="frame"></div>
            </div>
        </div>
    </div>
</div>
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
	<div class="pcoded-container navbar-wrapper">    
		
		<!--  topMenu  -->
	    <jsp:include page="../common/topMenu.jsp" />           
	    <!--  sideMenu    -->        
	    <jsp:include page="../common/sideMenu.jsp" />
	
 		<!-- main start -->
		<div class="pcoded-main-container">
		    <div class="pcoded-wrapper">
		        <div class="pcoded-content">
		            <div class="pcoded-inner-content">
		                <div class="main-body">
		                    <div class="page-wrapper">
		                        <div class="page-body">
		                        	<div class="card" style="padding-bottom: 0px;">
		                        		<div class="card-body">
			                        		<div class="row">
			                        			<div class="col-md-4">
													<div class="mb-4">
														<span id="time" style="font-size: 20px;"></span>
													</div>
													<div class="mt-4">
														<div>
															<span style="font-size: 16px;">?????? ????????? ??????</span>
															<h2 id="workingTime"></h2>
														</div>
													</div>
													<div class="mt-4" id="commuteDiv">
												    	<button type="button" class="btn" id="startBtn">
												    		<i class="icofont icofont-sign-in"></i>
												    		<span>GPS??????</span>
												    	</button>
												    	<button type="button" class="btn" id="qrStartBtn">
												    		<i class="icofont icofont-sign-in"></i>
												    		<span>QR??????</span>
												    	</button>
												    	<button type="button" class="btn" id="endBtn">
												    		<i class="icofont icofont-sign-out"></i>
												    		<span>??????</span>
												    	</button>
													</div>
													<div class="modal fade" id="QRModal" tabindex="-1" role="dialog" aria-labelledby="QRModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-sm" role="document">
															<div class="modal-content">
																<div class="modal-header">
																    <h4 class="modal-title mx-auto" id="QRModalLabel">QR</h4>
																    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																    <span aria-hidden="true">&times;</span>
																    </button>
																</div>
																<div class="modal-body mx-auto">
																	<div id="qrcode"></div>
																</div>
															</div>
														</div>
													</div>
			                        			</div>
			                        			<div class="col-md-4 b-l-default text-center">
													<div class="mt-4 mb-4">
														<table id="commuteTable" class="mx-auto">
															<tr>
																<td style="text-align: left">????????????</td>
																<td style="text-align: right">
																	<c:if test="${!empty startTime}">${startTime}</c:if>
																	<c:if test="${empty startTime}">?????????</c:if>
																</td>
															</tr>
															<tr>
																<td style="text-align: left">????????????</td>
																<td style="text-align: right">
																	<c:if test="${!empty endTime}">${endTime}</c:if>
																	<c:if test="${empty endTime}">?????????</c:if>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<div class="" id="stateDiv">
																		<button class="btn btn-outline btn-sm stateBtn" id="working">
																			<i class="icofont icofont-user-alt-3"></i>
																			<span>?????????</span>
																		</button>
																		<button class="btn btn-outline btn-sm stateBtn" id="workEnd">
																			<i class="icofont icofont-user-alt-3"></i>
																			<span>????????????</span>
																		</button>
																		<button class="btn btn-outline btn-sm stateBtn" id="outside">
																			<i class="icofont icofont-user-alt-3"></i>
																			<span>??????</span>
																		</button>
																		<button class="btn btn-outline btn-sm stateBtn" id="leave">
																			<i class="icofont icofont-user-alt-3"></i>
																			<span>??????</span>
																		</button>
																	</div>
																</td>
															</tr>
														</table>
													</div>
			                        			</div>
			                        			<div class="col-md-4 b-l-default">
			                        				<div class="p-3">
				                        				<div class="mt-3">
															<span style="font-size: 16px;">?????? ??????  09:00 ~ 18:00</span>
															<div class="progress">
				                                                <div id="progress" class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
				                                            </div>
				                        				</div>
				                        				<div class="mt-3">
															<span style="font-size: 16px;">?????? ??????</span>
															<div class="progress active">
				                                                <div id="overProgress" class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
				                                            </div>
				                        				</div>
			                        				</div>
												</div>
		                        			</div>
		                        		</div>
		                        	</div>
		                                <!-- ?????????????????? -->
		                                <div>
		                                    <div class="card">
		                                        <div class="card-header text-center">
		                                            <h3 style="font-family: TmonMonsori">?????? ??? ????????????</h3>
		                                        </div>
		                                        <div class="row">
		                                        	<div class="col-md-8">
				                                        <div class="card-block">
				                                            <div id="morris-bar-chart"></div>
			                                        	</div>
			                                        </div>
			                                        <div class="col-md-4 b-l-default">
			                                        	<div class="card-block">
					                                    	<div style="position: relative">
																<canvas id="myChart" width="250" height="250"></canvas>
																<div style="border-top: 2px dotted gray; width: 50px; position: absolute; top: 55px; right: 65px;"></div> 
																<div style="position: absolute; top: 47px; right:10px;">
																	<h6>????????????</h6>
																	<h6>&nbsp;<span id="overworkHour"></span>&nbsp;/12h</h6>
																</div>
																<div style="border-top: 2px dotted gray; width: 65px; position: absolute; top: 95px; left: 45px;"></div> 
																<div style="position: absolute; top: 90px; left: -10px;">
																	<h6>????????????</h6>
																	<h6><span id="workHour"></span>&nbsp;/40h</h6>
																</div>
					                                    	</div>
			                                        	</div>
			                                        </div>
		                                        </div>
		                                    	<div class="b-t-default m-3"></div>
		                                    	<div class="card-body text-center">
													<div style="display: inline-block;">
			                                    		<div style="background-color: #62D1F3; width: 10px; height: 10px; border-radius: 50%; display: inline-block;"></div>
			                                    		<span>??????????????????</span>
			                                    		&nbsp;&nbsp;&nbsp;
			                                    		<div style="background-color: #FFC952; width: 10px; height: 10px; border-radius: 50%; display: inline-block;"></div>
			                                    		<span>??????????????????</span>
			                                    		&nbsp;&nbsp;&nbsp;
			                                    		<div style="background-color: #FF7473; width: 10px; height: 10px; border-radius: 50%; display: inline-block;"></div>
			                                    		<span>??? ????????????</span>
													</div>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<div style="display: inline-block; vertical-align: middle;">
														<div style="background-color: #62D1F3; border-radius: 20px; padding-right: 5px; padding-left: 5px; display: inline-block;">
															<span style="color: white;">????????????</span>
														</div>
														<span id="workHourSpan"></span><b>??????</b>&nbsp;<span id="workMinSpan"></span><b>???</b>
														&nbsp;&nbsp;
														<div style="background-color: #FFC952; border-radius: 20px; padding-right: 5px; padding-left: 5px; display: inline-block;">
															<span style="color: white;">????????????</span>
														</div>
														<span id="overworkHourSpan"></span><b>??????</b>&nbsp;<span id="overworkMinSpan"></span><b>???</b>
														&nbsp;&nbsp;
														<div style="background-color: #FF7473; border-radius: 20px; padding-right: 5px; padding-left: 5px; display: inline-block;">
															<span style="color: white;">??? ????????????</span>
														</div>
														<span id="totalHourSpan"></span><b>??????</b>&nbsp;<span id="totalMinSpan"></span><b>???</b>
													</div>
		                                    	</div>
		                                    </div>
			                                <div class="row">
		                                        <!-- ?????? ??? ?????? ?????? -->
		                                        <div class="col-lg-4">
		                                            <div class="card project-task">
		                                                <div class="card-header">
		                                                    <div class="card-header-left">
		                                                        <h5>?????? ??? ?????? ??????</h5>
		                                                    </div>
		                                                    <div class="card-header-right">
		                                                        <ul class="list-unstyled card-option">
		                                                            <li><i class="icofont icofont-simple-left"></i></li>
	<!-- 		                                                            <li><i class="icofont icofont-maximize full-card"></i></li> -->
		                                                            <li id="overworkFull"><i class="icofont icofont-maximize"></i></li>
		                                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                                            <li id="overworkReload"><i class="icofont icofont-refresh"></i></li>
		                                                            <li><i class="icofont icofont-ui-edit overwork-card"></i></li>
		                                                        </ul>
		                                                    </div>
		                                                </div>
		                                                <div class="card-block p-b-10">
		                                                    <div class="table-responsive">
		                                                        <table class="table listTable" id="overworkTable">
		                                                            <thead>
		                                                                <tr>
		                                                                    <th>??????</th>
		                                                                    <th>??????</th>
		                                                                    <th>??????</th>
		                                                                </tr>
		                                                            </thead>
		                                                            <tbody>
		                                                            </tbody>
		                                                        </table>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- ?????? ?????? -->
		                                        <div class="col-lg-4">
		                                            <div class="card project-task">
		                                                <div class="card-header">
		                                                    <div class="card-header-left">
		                                                        <h5>?????? ??????</h5>
		                                                    </div>
		                                                    <div class="card-header-right">
		                                                        <ul class="list-unstyled card-option">
		                                                            <li><i class="icofont icofont-simple-left"></i></li>
		                                                            <li id="leaveFull"><i class="icofont icofont-maximize"></i></li>
		                                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                                            <li id="leaveReload"><i class="icofont icofont-refresh"></i></li>
		                                                            <li><i class="icofont icofont-ui-edit leave-card"></i></li>
		                                                        </ul>
		                                                    </div>
		                                                </div>
		                                                <div class="card-block p-b-10">
		                                                    <div class="table-responsive">
		                                                        <table class="table listTable" id="leaveTable">
		                                                            <thead>
		                                                                <tr>
		                                                                	<th>??????</th>
		                                                                    <th>??????</th>
		                                                                    <th>??????</th>
		                                                                </tr>
		                                                            </thead>
		                                                            <tbody>
		                                                            </tbody>
		                                                        </table>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- ?????? ?????? ?????? -->
		                                        <div class="col-lg-4">
		                                            <div class="card project-task">
		                                                <div class="card-header">
		                                                    <div class="card-header-left">
		                                                        <h5>?????? ?????? ??????</h5>
		                                                    </div>
		                                                    <div class="card-header-right">
		                                                        <ul class="list-unstyled card-option">
		                                                            <li><i class="icofont icofont-simple-left"></i></li>
		                                                            <li id="coRequestFull"><i class="icofont icofont-maximize"></i></li>
		                                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                                            <li id="coRequestReload"><i class="icofont icofont-refresh"></i></li>
		                                                            <li><i class="icofont icofont-ui-edit commute-card"></i></li>
		                                                        </ul>
		                                                    </div>
		                                                </div>
		                                                <div class="card-block p-b-10">
		                                                    <div class="table-responsive">
		                                                        <table class="table listTable" id="coRequestTable">
		                                                            <thead>
		                                                                <tr>
		                                                                	<th>??????</th>
		                                                                    <th>??????</th>
		                                                                    <th>??????</th>
		                                                                </tr>
		                                                            </thead>
		                                                            <tbody>
		                                                            </tbody>
		                                                        </table>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
										</div>
		                        </div>
		                        <!-- ?????? ??? ?????? ?????? ?????? -->
		                        <div class="modal fade" id="overworkModal" tabindex="-1" role="dialog" aria-labelledby="overworkModalLabel" aria-hidden="true">
		                        	<%@include file="overworkModal.jsp" %>
		                        </div>
		                        <!-- ?????? ?????? ?????? -->
		                        <div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true">
		                        	<%@include file="../leave/leaveModal.jsp" %>
		                    	</div>
		                        <!-- ?????? ?????? ?????? ?????? -->
		                        <div class="modal fade" id="commuteModal" tabindex="-1" role="dialog" aria-labelledby="commuteModalLabel" aria-hidden="true">
		                        	<%@include file="commuteModal.jsp" %>
		                    	</div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>

<script>
	var $window = $(window);
	var nav = $('.fixed-button');
	    $window.scroll(function(){
	        if ($window.scrollTop() >= 200) {
	        nav.addClass('active');
	    }
	    else {
	        nav.removeClass('active');
	    }
	});
</script>

<script>
	
	$(function(){
		$('#QRModal').modal('hide');
	});
	
	setInterval("time()", 1000);
	function time() {
		var now = new Date();

		var year = now.getFullYear(); // ??????
		var month = now.getMonth() + 1; // ???
		var date = now.getDate(); // ??????
		var dayNum = now.getDay(); // ??????
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();

		var dayList = [ '???', '???', '???', '???', '???', '???', '???' ];
		var day = dayList[dayNum];

		month = (month < 10) ? "0" + month : month;
		date = (date < 10) ? "0" + date : date;
		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;
		
		var currentTime = document.getElementById("time");
		currentTime.innerHTML = year + "-" + month + "-" + date + " " + day + " " + hours + ":" + minutes + ":" + seconds;
		currentTime.style.fontFamily = "SpoqaHanSansNeo-Regular";
	}

	setInterval("commuteTime()", 1000);
	function commuteTime() {
			$.ajax({
				url : 'commuteTime.co',
				success : function(data) {
// 					console.log('??????????????? ??????');
// 					console.log(data);

// 					today process bar
// 					?????? ????????? ??????
					if(data != null){
						var today = new Date();
						var start = data.commuteStart;
						var startDate = new Date(start);
						var overworkDate = new Date(start.substring(0, 11) + '18:00:00');
						var diffSec = 0;
						var worktimePer = 0;

						var hour = 0;
						var min = 0;
						var sec = 0;

						diffSec = (today.getTime() - startDate.getTime()) / 1000;
						diff = diffSec / (8 * 60 * 60) * 100;
						hour = Math.floor(diffSec / 3600);
						min = Math.floor(diffSec % 3600 / 60);
						sec = Math.floor(diffSec % 3600 % 60);

						hour = (hour < 10 && hour > 0) ? "0" + hour : hour;
						if(hour == 0) hour = "00";
						min = (min < 10) ? "0" + min : min;
						sec = (sec < 10) ? "0" + sec : sec;

						$('#workingTime').text(hour + ":" + min + ":" + sec).css({'font-family':'SpoqaHanSansNeo-Bold'});

						if (today.getHours() < 18) {
							diffSec = (today.getTime() - startDate.getTime()) / 1000;
							diff = diffSec / (8 * 60 * 60) * 100;
							worktimePer = Math.round(diff * 100) / 100;

							$('#progress').css({
								'width' : worktimePer + '%',
								'background-color' : '#62D1F3'
							});
							$('#progress').text(Math.round(diff) + "%");
						} else {
							diffSec = (today.getTime() - overworkDate.getTime()) / 1000;
							diff = diffSec / (6 * 60 * 60) * 100;
							worktimePer = Math.round(diff * 100) / 100;

							$('#overProgress').css({
								'width' : worktimePer + '%',
								'background-color' : '#FFC952'
							});
							$('#overProgress').text(Math.round(diff) + "%");
						}
						
						// ?????? ??? worktime
						if(data.worktime > 0){
							var check = data.worktime.toString().indexOf('.');
							var hour = data.worktime.toString().substring(0, check);
							var min = data.worktime.toString().substring(check+1);
							
							hour = hour < 10 ? "0"+hour : hour;

							$('#workingTime').text(hour+":"+min+":00");												
						}
					} else {
						$('#workingTime').text("00:00:00");						
					}
				},
				error : function(data) {
					console.log('??????');
				}
			});
	}

	// GPS????????????
	$('#startBtn').on('click', function() {
		var check = confirm('?????????????????????????');

		if (check) {
			navigator.geolocation.getCurrentPosition(function(pos) {
				var latitude = pos.coords.latitude;
				var longitude = pos.coords.longitude;
				// 				alert("?????? ????????? : " + latitude + ", "+ longitude);

				// 				?????? ??? ?????? : 37.494555 / ?????? ??? ?????? : 126.958055
				// 				?????? ?????? : 37.499146193359344  /  ?????? ?????? : 127.03289826885084
// 								if((latitude > '37.49' && latitude < '37.50') && (longitude > '126.94' && longitude < '126.95')){
				if (true) {
					location.href = "commuteEnter.co";
				} else {
					alert('?????? ???????????? ??????????????????.');
				}
			});
		}
	});
	
	// QR????????????
	$('#qrStartBtn').click(function() {
		var check = confirm('QR?????? ???????????????????\n?????? ?????????????????? ????????? ???????????????.');
		if(check){
			$('#QRModal').modal('show');
			var mCode = '<c:out value="${loginUser.mCode}"/>';
			
			var qrcode = new QRCode(document.getElementById("qrcode"), {
			    text: mCode,
			    width: 128,
			    height: 128,
			    colorDark : "#000000",
			    colorLight : "#ffffff",
			    correctLevel : QRCode.CorrectLevel.H
			});
			
		    $("#qrcode > img").css({"margin":"auto"});
		} else {
			$('#QRModal').modal('hide');			
			popupOpen('qrStart.co');
		}
	});
	
	function popupOpen(url){
		var popupX = (window.screen.width / 2) - (510 / 2);
		var popupY= (window.screen.height /2) - (700 / 2);
		
	  	var name="qrstart";
	    var specs = 'width=510, height=700, menubar=no,status=no,toolbar=no,left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY;
	    var newWindow = window.open(url,name,specs);
	    newWindow.focus();
	}

	// ????????????
	$('#endBtn').on('click', function() {
		var check = confirm('?????????????????????????');

		if (check) {
			location.href = "commuteOut.co";
		}
	});

	$('.stateBtn').on('click', function() {

		var text = $(this).find('span').text();
		var state;
		if (text == '????????????') {
			state = 1;
		} else if (text == '?????????') {
			state = 2;
		} else if (text == '??????') {
			state = 3;
		} else if (text == '??????') {
			state = 4;
		}

		location.href = "changeState.co?state=" + state;
	});

	// ?????? ??????
	$('.datepicker').datepicker({
		beforeShow: function(input, inst) {
			var calendar = inst.dpDiv;
			console.log(calendar);
			setTimeout(function(){
				calendar.position({
					my: 'right top',
					at: 'right bottom',
					collision: 'none',
					of: input
				});
			}, 1);
		}
	});

	$.datepicker.setDefaults({
		
		showOn: 'button',		
		dateFormat : 'yy-mm-dd',
		prevText : '?????? ???',
		nextText : '?????? ???',
		monthNames : [ '1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???' ],
		monthNamesShort : [ '1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???' ],
		dayNames : [ '???', '???', '???', '???', '???', '???', '???' ],
		dayNamesShort : [ '???', '???', '???', '???', '???', '???', '???' ],
		dayNamesMin : [ '???', '???', '???', '???', '???', '???', '???' ],
		showMonthAfterYear : true,
		yearSuffix : '???'
	});

	// ?????? ????????? ?????? ??????
	$('#half').css('display', 'none');

	$('#leaveType').on('click', function() {
		var half = $("#leaveType option:selected").val();
		if (half == '2') {
			$('#half').show();
		} else {
			$('#half').hide();
		}
	});

	// ???????????? ??????
	$('.overwork-card').on('click', function() {
		$('#overworkModal').modal('show');
	});

	// ?????? ??????
	$('.leave-card').on('click', function() {
		$('#leaveModal').modal('show');
	});
	
	// ?????? ?????? ??????
	$('.commute-card').on('click', function(){
		$('#commuteModal').modal('show');
	});
	
	// overworkFull
	$('#overworkFull').on('click', function() {
		location.href = "overworkDetailView.co";
	});
	
	// leaveFull
	$('#leaveFull').on('click', function(){
		location.href = "leaveDetail.le";
	});
	
	// commuteFull
	$('#coRequestFull').on('click', function(){
		location.href = "coRequestDetailView.co";
	});
	
	// reload
	$('#overworkReload').on('click', function() {
		getOverworkList();
	});
	
	$('#overworkReload').on('click', function() {
		getLeaveList();
	});
	
	$('#coRequestReload').on('click', function(){
		getCommuteList();
	});

	$(function() {
		var state = <c:out value="${state}" />
		if (state == 1) {
			$('#workEnd').css('background-color', '#660099');
			$('#workEnd').find('i').css('color', 'white');
			$('#workEnd').find('span').css('color', 'white');
		} else if (state == 2) {
			$('#working').css('background-color', '#660099');
			$('#working').find('i').css('color', 'white');
			$('#working').find('span').css('color', 'white');
		} else if (state == 3) {
			$('#outside').css('background-color', '#660099');
			$('#outside').find('i').css('color', 'white');
			$('#outside').find('span').css('color', 'white');
		} else if (state == 4) {
			$('#leave').css('background-color', '#660099');
			$('#leave').find('i').css('color', 'white');
			$('#leave').find('span').css('color', 'white');
		}
	});

	// ?????? ??????
	$(function() {
		$.ajax({
			url : 'commuteChart.co',
			success : function(map) {
				console.log('?????? ??????');
				console.log(map);

				var arrWorkTime = new Array();
				var arrOverWork = new Array();
				var total = 0;

				if (map.colist.length != 0) {
					for (var i = 0; i < map.colist.length; i++) {
						for (var j = 0; j < 7; j++) {
							if (new Date(map.colist[i].enrollDate).getDay() == j) {
								arrWorkTime[j] = map.colist[i].worktime;
							}
							if (arrWorkTime[j] == undefined) {
								arrWorkTime[j] = 0;
							}
						}
					}
				} else {
					for (var j = 0; j < 7; j++) {
						arrWorkTime[j] = 0;
					}
				}
				var workTotal = 0;
				for (var i = 0; i < 7; i++) {
					workTotal += arrWorkTime[i];
				}
				$('#workHour').html(Math.round(workTotal)).css('color', '#62D1F3');
				$('#workHourSpan').html(Math.round(workTotal)).css({'font-size' : '22px', 'color' : '#62D1F3', 'font-weight' : 'bold'});
				$('#workMinSpan').html((workTotal * 100).toFixed(0).substring(2, 4)).css({'font-size' : '22px', 'color' : '#62D1F3', 'font-weight' : 'bold'});

				if (map.owlist.length != 0) {
					for (var i = 0; i < map.owlist.length; i++) {
						for (var j = 0; j < 7; j++) {
							if (new Date(map.owlist[i].overworkDate).getDay() == j) {
								arrOverWork[j] = map.owlist[i].overworktime;
							}
							if (arrOverWork[j] == undefined) {
								arrOverWork[j] = 0;
							}
						}
					}
				} else {
					for (var j = 0; j < 7; j++) {
						arrOverWork[j] = 0;
					}
				}
				var overworkTotal = 0;
				for (var i = 0; i < 7; i++) {
					overworkTotal += arrOverWork[i];
				}
				$('#overworkHour').html(overworkTotal).css('color', '#FFC952');
				$('#overworkHourSpan').html(Math.round(overworkTotal)).css({'font-size' : '22px', 'color' : '#FFC952', 'font-weight' : 'bold'});
				$('#overworkMinSpan').html((overworkTotal * 100).toFixed(0).substring(2, 4)).css({'font-size' : '22px', 'color' : '#FFC952', 'font-weight' : 'bold'});

				var total = 0;
				for (var i = 0; i < 7; i++) {
					total += arrWorkTime[i] + arrOverWork[i];
				}
				$('#totalHourSpan').html(Math.round(total)).css({'font-size' : '22px', 'color' : '#FF7473', 'font-weight' : 'bold'});
				$('#totalMinSpan').html((total * 100).toFixed(0).substring(2, 4)).css({'font-size' : '22px', 'color' : '#FF7473', 'font-weight' : 'bold'});

				Morris.Bar({
					element : 'morris-bar-chart',
					data : [ {
						y : '???',
						a : arrWorkTime[0],
						b : arrOverWork[0],
						c : arrWorkTime[0] + arrOverWork[0]
					}, {
						y : '???',
						a : arrWorkTime[1],
						b : arrOverWork[1],
						c : arrWorkTime[1] + arrOverWork[1]
					}, {
						y : '???',
						a : arrWorkTime[2],
						b : arrOverWork[2],
						c : arrWorkTime[2] + arrOverWork[2]
					}, {
						y : '???',
						a : arrWorkTime[3],
						b : arrOverWork[3],
						c : arrWorkTime[3] + arrOverWork[3]
					}, {
						y : '???',
						a : arrWorkTime[4],
						b : arrOverWork[4],
						c : arrWorkTime[4] + arrOverWork[4]
					}, {
						y : '???',
						a : arrWorkTime[5],
						b : arrOverWork[5],
						c : arrWorkTime[5] + arrOverWork[5]
					}, {
						y : '???',
						a : arrWorkTime[6],
						b : arrOverWork[6],
						c : arrWorkTime[6] + arrOverWork[6]
					} ],
					xkey : 'y',
					ykeys : [ 'a', 'b', 'c' ],
					labels : [ '?????? ????????????', '?????? ??? ????????????', '??? ????????????' ],
					barColors : [ '#62D1F3', '#FFC952', '#FF7473' ],
					hideHover : 'auto',
// 					gridLineColor: '#eef0f2',
					gridLineColor : 'white',
					resize : true
				});

				var config = {
					type : 'doughnut',
					data : {
						labels : [ '????????????', '?????? ????????????' ],
						datasets : [
							/* Outer doughnut data starts*/
							{
								data : [ overworkTotal,
										(12 - overworkTotal) ],
								backgroundColor : [ "#FFC952",
										"#F5F5F5" ],
								label : '?????? ??? ?????? ??????'
							},
							/* Outer doughnut data ends*/
							/* Inner doughnut data starts*/
								{
									data : [
											(Math
													.round(workTotal * 100) / 100),
											(40 - (Math
													.round(workTotal * 100) / 100)) ],
									backgroundColor : [ "#62D1F3",
											"#F0F0F0" ],
									label : '?????? ?????? ??????'
								}
						/* Inner doughnut data ends*/
						],

					},
					options : {
						responsive : false,
						legend : {
// 							position: 'top',
							display : false,
						},
						title : {
							display : true,
// 							text: 'Chart.js Doughnut Chart'
						},
						animation : {
							animateScale : true,
							animateRotate : true
						},
						tooltips : {
							callbacks : {
								label : function(item, data) {
									console.log(data.labels, item);
									return data.datasets[item.datasetIndex].label
											+ ": "
											+ data.labels[item.index]
											+ ": "
											+ data.datasets[item.datasetIndex].data[item.index];
								}
							}
						}
					},
					centerText : {
						display : true,
						text : "280"
					}
				};
				var ctx = document.getElementById("myChart")
						.getContext("2d");
				window.myDoughnut = new Chart(ctx, config);

			},
			error : function(data) {
				console.log('??????');
			}
		});
	});
</script>
	
<!-- test Chart -->
<!-- <script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script> -->
</body>
</html>