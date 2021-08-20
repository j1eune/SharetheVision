<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태현황</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<link href="resources/assets/css/datePicker/datePicker.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<style>
	#goTo, #getOff, #changeState, #seleteState{border: 2px solid #660099; background-color: white; color: #660099; font-size: 2.5vmin; font-weight: bold; box-shadow: none;}
	#selectState{border-radius: 20px;}
	#selectState li{font-size: 2.5vmin;}
	#selectState li:hover{cursor: pointer; color:#660099; background-color: #F8F9FA;}	
	
	.listTable>thead>tr>th, .listTable>tbody>tr>td, .listTable>tbody>tr>th{text-align: center}
	
	#selectState>li>input[type="radio"]{
		display: hidden;
		height: 0;
		width: 0;
	}
	
	#leaveTime input[type="radio"]{
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
	
	#leaveTime input[type="radio"]:checked + label{
		background-color: #FFB64D;;
		color: white;
	}
	
	.commuteClick{border: 2px solid gray; color: gray;}
	
 	.ui-widget-header .ui-icon { background-image: url('/images/btns.png'); }
 	
</style>
<jsp:include page="../common/common.jsp" />
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
		                            <div class="row">
		                                <!-- 금주근무현황 -->
		                                <div class="col-md-8">
		                                    <div class="card">
		                                        <div class="card-header">
		                                            <h3>금주근무현황</h3>
		                                            <div class="card-header-right">
		                                                <i class="icofont icofont-spinner-alt-5"></i>
		                                            </div>
		                                        </div>
		                                        <div class="card-block">
													<div>
<%-- 												  		<canvas id="myChart" width="100%"></canvas> --%>
													</div>
		                                            <div id="morris-bar-chart"></div>
		                                        </div>
		                                    </div>
		                                    <div class="row">
		                                        <!-- 표준 외 근무 요청 -->
		                                        <div class="col-lg-6">
		                                            <div class="card project-task">
		                                                <div class="card-header">
		                                                    <div class="card-header-left">
		                                                        <h5>표준 외 근무 요청</h5>
		                                                    </div>
		                                                    <div class="card-header-right">
		                                                        <ul class="list-unstyled card-option">
		                                                            <li><i class="icofont icofont-simple-left"></i></li>
		                                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                                            <li><i class="icofont icofont-ui-edit overwork-card"></i></li>
		                                                        </ul>
		                                                    </div>
		                                                </div>
		                                                <div class="card-block p-b-10">
		                                                    <div class="table-responsive">
		                                                        <table class="table table-hover">
		                                                            <thead>
		                                                                <tr>
		                                                                    <th>날짜</th>
		                                                                    <th>상태</th>
		                                                                </tr>
		                                                            </thead>
		                                                            <tbody>
		                                                                <tr>
		                                                                    <td><div class="task-contain"><p class="d-inline-block">2021.07.24 19:00 ~ 22:00</p></div></td>
		                                                                    <td><p class="d-inline-block">대기</p></td>
		                                                                </tr>
		                                                                <tr>
		                                                                    <td><div class="task-contain"><p class="d-inline-block">2021.06.19 19:00 ~ 21:00</p></div></td>
		                                                                    <td><p class="d-inline-block">승인</p></td>
		                                                                </tr>
		                                                                <tr>
		                                                                    <td><div class="task-contain"><p class="d-inline-block">2021.04.24 20:00 ~ 21:00</p></div></td>
		                                                                    <td><p class="d-inline-block">승인</p></td>
		                                                                </tr>
		                                                            </tbody>
		                                                        </table>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <!-- 휴가 요청 -->
		                                        <div class="col-lg-6">
		                                            <div class="card project-task">
		                                                <div class="card-header">
		                                                    <div class="card-header-left">
		                                                        <h5>휴가 요청</h5>
		                                                    </div>
		                                                    <div class="card-header-right">
		                                                        <ul class="list-unstyled card-option">
		                                                            <li><i class="icofont icofont-simple-left"></i></li>
		                                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                                            <li><i class="icofont icofont-ui-edit leave-card"></i></li>
		                                                        </ul>
		                                                    </div>
		                                                </div>
		                                                <div class="card-block p-b-10">
		                                                    <div class="table-responsive">
		                                                        <table class="table table-hover">
		                                                            <thead>
		                                                                <tr>
		                                                                    <th>날짜</th>
		                                                                    <th>상태</th>
		                                                                </tr>
		                                                            </thead>
		                                                            <tbody>
		                                                                <tr>
		                                                                    <td><div class="task-contain"><p class="d-inline-block">2021.08.19 ~ 2021.08.20</p></div></td>
		                                                                    <td><p class="d-inline-block">대기</p></td>
		                                                                </tr>
		                                                                <tr>
		                                                                    <td><div class="task-contain"><p class="d-inline-block">2021.05.05 ~ 2021.05.06</p></div>
		                                                                    </td>
		                                                                    <td><p class="d-inline-block">반려</p></td>
		                                                                </tr>
		                                                                <tr>
		                                                                    <td><div class="task-contain"><p class="d-inline-block">2021.03.25 ~ 2021.03.26</p></div></td>
		                                                                    <td><p class="d-inline-block">승인</p></td>
		                                                                </tr>
		                                                            </tbody>
		                                                        </table>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 근태관리 -->
		                                <div class="col-md-4">
		                                    <div class="card">
		                                        <div class="card-header">
		                                            <h3>근태관리</h3>
		                                        </div>
		                                        <div class="card-body">
		                                            <c:set var="javatoday" value="<%=new java.util.Date()%>" />
													<c:set var="todayTime"><fmt:formatDate value="${javatoday}" pattern="yyyy-MM-dd E hh:mm:ss" /></c:set> 
													<c:set var="today"><fmt:formatDate value="${javatoday}" pattern="yyyy-MM-dd E" /></c:set> 
													<c:set var="year"><fmt:formatDate value="${javatoday}" pattern="yyyy" /></c:set> 
													<c:set var="month"><fmt:formatDate value="${javatoday}" pattern="MM" /></c:set> 
													<c:set var="date"><fmt:formatDate value="${javatoday}" pattern="dd" /></c:set> 
													<c:set var="time"><fmt:formatDate value="${javatoday}" pattern="hh:mm:ss" /></c:set> 
													
													<div class="mb-3">
														<h5>${today}</h5>
														<h5>${time}</h5>
													</div>
		                                            <div id="totalTime" style="font-size: 35px;">${totalHour}h ${totalMin}m</div>
		                                            <div class="progress mb-4">
		                                                <div id="progress" class="progress-bar" role="progressbar" style="width: 25%" aria-valuemin="0" aria-valuemax="100"></div>
		                                            </div>
		                                            <table class="table table-borderless">
		                                                <tr>
		                                                    <td><h5>출근시간</h5></td>
		                                                    <td class="text-right"><h5 id="goToTime">${startTime}</h5></td>
		                                                </tr>
		                                                <tr>
		                                                    <td><h5>퇴근시간</h5></td>
		                                                    <td class="text-right"><h5 id="getOffTime">${endTime}</h5></td>
		                                                </tr>
		                                            </table>
		                                            <hr style="border-top: 2px dashed #bbb;">
													<div class="mt-3 row">
													    <div class="col-md-6">
													    	<button type="button" class="btn btn-round btn-block" id="goTo">
													    		출근하기
													    		<i class="icofont icofont-sign-in"></i>
													    	</button>
													    </div>
													    <div class="col-md-6">
													    	<button type="button" class="btn btn-round btn-block" id="getOff">
													    		퇴근하기
													    		<i class="icofont icofont-sign-out"></i>
													    	</button>
													    </div>
													</div>
													<div class="mt-3">
														<div>
															<c:forEach var="i" begin="1" end="4">
															    <c:if test="${state == i}">
															    	<button type="button" id="changeState" class="btn btn-round btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															    		<c:choose>
															    			<c:when test="${state == 1}">
															    				근무 종료
															    			</c:when>
															    			<c:when test="${state == 2}">
															    				근무 중
															    			</c:when>
															    			<c:when test="${state == 3}">
															    				휴가
															    			</c:when>
															    			<c:when test="${state == 4}">
															    				외근
															    			</c:when>
															    			<c:otherwise>
															    				상태변경
															    			</c:otherwise>
															    		</c:choose>
															    	</button>
															    </c:if>
															</c:forEach>
														    <ul id="selectState" class="dropdown-menu col-md-12" aria-labelledby="changeState" style="width: 90%;">
															    <li class="dropdown-item">
																	<input type="radio" value="1">
																	<label>근무종료</label>
															    </li>
															    <li class="dropdown-item">
															    	<input type="radio" value="2">
																	<label>근무 중</label>
															    </li>
															    <li class="dropdown-item">
															    	<input type="radio" value="3">
																	<label>휴가</label>
															    </li>
															    <li class="dropdown-item">
															    	<input type="radio" value="4">
																	<label>외근</label>
															    </li>
															</ul>
														</div>
													</div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- 표준 외 근무 신청 모달 -->
		                        <div class="modal fade" id="overworkModal" tabindex="-1" role="dialog" aria-labelledby="overworkModalLabel" aria-hidden="true">
		                        	<%@include file="overworkModal.jsp" %>
		                        </div>
		                        <!-- 휴가 신청 모달 -->
		                        <div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true">
		                        	<%@include file="../leave/leaveModal.jsp" %>
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
        // 근태관리 현재 시간
        var today = new Date();
        
        var year = today.getFullYear().toString();
        
        var month = today.getMonth() + 1;
        month = month < 10 ? '0' + month.toString() : month.toString();
        
        var date = today.getDate();
        date = date < 10 ? '0' + date.toString() : date.toString();
        
        var hour = today.getHours();
        hour = hour < 10 ? '0' + hour.toString() : hour.toString();
        
        var minutes = today.getMinutes();
        minutes = minutes < 10 ? '0' + minutes.toString() : minutes.toString();
        
        var seconds = today.getSeconds();
        seconds = seconds < 10 ? '0' + seconds.toString() : seconds.toString();
        
        var week = new Array('일', '월', '화', '수', '목', '금', '토');
        var day = week[today.getDay()];
        
        var formatToday = year + "년 " + month + "월 " + date + "일(" + day +") " + hour + ":" + minutes + ":" + seconds;
        
//         document.getElementById('today').innerHTML = formatToday;
        
        // 현재까지 근무시간
        // percent = 현재까지 근무시간(분) / 3120 * 100  (예를 든 현재 시간은 41시간 42분. 41*60+42/52*60 * 100)
        var totalHour = ${totalHour}
        var totalMin = ${totalMin}
        var percent = ((totalHour*60 + totalMin)/ 3120 * 100).toFixed(2);
        
        $('#progress').css('width', percent +"%");
        
        // 출근하기
        $('#goTo').on('click', function(){
        	var check = confirm('출근하시겠습니까?');
        	
        	if(check){
        		navigator.geolocation.getCurrentPosition(function(pos){
        		    var latitude = pos.coords.latitude;
        		    var longitude = pos.coords.longitude;
//         		    alert("현재 위치는 : " + latitude + ", "+ longitude);

        		    // 우리 집 위도 : 37.494555 / 우리 집 경도 : 126.958055
					// 회사 위도 : 37.499146193359344  /  회사 경도 : 127.03289826885084
//         		    if((latitude > '37.4945' && latitude < '37.4946') && (longitude > '126.9580' && longitude < '126.9581')){
//         		    if((latitude > '37.49' && latitude < '37.50') && (longitude > '126.94' && longitude < '126.95')){
        		    if(true){
						
        		    	location.href="commuteEnter.co";
			            
        		    } else {
        		    	alert('출근 지역에서 벗어났습니다.');
        		    }
        		});

        	}
        });
        
        // 퇴근하기
        $('#getOff').on('click', function(){
        	var check = confirm('퇴근하시겠습니까?');
        	
        	if(check){

        		location.href="commuteOut.co";
        	}
        });
        
     	// 상태 변경
        $('#selectState').find('li').on('click', function(){
        	var state = $(this).children('input').val();
        	
        	location.href="changeState.co?state="+state;
        });
        
        // 연장근무 신청
        $('.overwork-card').on('click', function(){
            $('#overworkModal').modal('show');
        });
        
        // 휴가 신청
        $('.leave-card').on('click', function(){
        	console.log('휴가 신청');
            $('#leaveModal').modal('show');
        });
        
        // 날짜 선택
        $('.datepicker').datepicker();

        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });

        // 반차 선택시 오전 오후
        $('#half').css('display', 'none');

        $('#leaveType').on('click', function(){
            var half = $("#leaveType option:selected").val();
            if(half == '2'){
                $('#half').show();
            } else {
                $('#half').hide();
            }
        });
    });
</script>

<script>
	$(function(){
		$.ajax({
			url: 'commuteChart.co',
			success: function(map){
				console.log('성공');
				
				var arrWorkTime = new Array();
				var arrOverWork = new Array();
				var total = 0;
				
				for(var i = 0; i < map.colist.length; i++){
					for(var j = 0; j < 7; j++){
						if(resultGetDay(map.colist[i].enrollDate) == j){
							arrWorkTime[j] = map.colist[i].worktime;
						}
						if(arrWorkTime[j] == undefined){
							arrWorkTime[j] = 0;	
						}
					}
				}
				
				for(var i = 0; i < map.owlist.length; i++){
					for(var j = 0; j < 7; j++){
						if(resultGetDay(map.owlist[i].overworkDate) == j){
							arrOverWork[j] = map.owlist[i].overworktime;
						}
						if(arrOverWork[j] == undefined){
							arrOverWork[j] = 0;	
						}
					}
				}
				
				Morris.Bar({
					element: 'morris-bar-chart',
				    data: [{
				        y: '일',
				        a: arrWorkTime[0],
				        b: arrOverWork[0],
				        c: arrWorkTime[0]+arrOverWork[0]
				    }, {
				        y: '월',
				        a: arrWorkTime[1],
				        b: arrOverWork[1],
				        c: arrWorkTime[1]+arrOverWork[1]
				    }, {
				        y: '화',
				        a: arrWorkTime[2],
				        b: arrOverWork[2],
				        c: arrWorkTime[2]+arrOverWork[2]
				    }, {
				        y: '수',
				        a: arrWorkTime[3],
				        b: arrOverWork[3],
				        c: arrWorkTime[3]+arrOverWork[3]
				    }, {
				        y: '목',
				        a: arrWorkTime[4],
				        b: arrOverWork[4],
				        c: arrWorkTime[4]+arrOverWork[4]
				    }, {
				        y: '금',
				        a: arrWorkTime[5],
				        b: arrOverWork[5],
				        c: arrWorkTime[5]+arrOverWork[5]
				    }, {
				        y: '토',
				        a: arrWorkTime[6],
				        b: arrOverWork[6],
				        c: arrWorkTime[6]+arrOverWork[6]
				    }],
				    xkey: 'y',
				    ykeys: ['a', 'b', 'c'],
				    labels: ['표준 근무시간', '표준 외 근무시간', '총 근무시간'],
				    barColors: ['#62d1f3', '#FFB64D', '#FC6180'],
				    hideHover: 'auto',
// 				    gridLineColor: '#eef0f2',
				    gridLineColor: 'white',
				    resize: true
				});
			},
			error: function(data){
				console.log('에러');
			}
		});
	});
	
	function resultGetDay(date){
		var enroll = new Date(date)
		return enroll.getDay();
	}
</script>
	
<!-- test Chart -->
<!-- <script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script> -->
</body>
</html>