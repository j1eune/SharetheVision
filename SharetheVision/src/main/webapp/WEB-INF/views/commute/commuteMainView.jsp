<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	#goTo, #getOff, #changeState, #selectState{border: 2px solid #660099; background-color: white; color:#660099; font-size: 20px; box-shadow: none;}
	#selectState{border-radius: 20px;}
	#selectState li{font-size: 20px;}
	#selectState li:hover{cursor:pointer; color: #660099; background-color: #F8F9FA;}

	.listTable>thead>tr>th, .listTable>tbody>tr>td, .listTable>tbody>tr>th{text-align: center}
	
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
		                                            <h5 id="today" class="mb-3"></h5>
		                                            <div id="totalWorkingHours"></div>
		                                            <div class="progress mb-4">
		                                                <div id="progress" class="progress-bar" role="progressbar" style="width: 25%" aria-valuemin="0" aria-valuemax="100"></div>
		                                            </div>
		                                            <table class="table table-borderless">
		                                                <tr>
		                                                    <td><h5>출근시간</h5></td>
		                                                    <td class="text-right"><h5>08:58:41</h5></td>
		                                                </tr>
		                                                <tr>
		                                                    <td><h5>퇴근시간</h5></td>
		                                                    <td class="text-right"><h5>18:09:02</h5></td>
		                                                </tr>
		                                            </table>
		                                            <hr style="border-top: 2px dashed #bbb;">
		                                            <div class="row">
		                                                <table class="table table-borderless">
		                                                    <tr>
		                                                        <td><button type="button" class="btn btn-round btn-block" id="goTo">출근하기</button></td>
		                                                        <td><button type="button" class="btn btn-round btn-block" id="getOff">퇴근하기</button></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <td colspan="2">
		                                                            <div class="dropdown">
		                                                                <button type="button" id="changeState" class="btn btn-round btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">상태변경</button>
		                                                                <ul id="selectState" class="dropdown-menu" aria-labelledby="changeState" style="width: 100%">
		                                                                    <li class="dropdown-item"><span>업무</span></li>
		                                                                    <li class="dropdown-item"><span>업무종료</span></li>
		                                                                    <li class="dropdown-item"><span>휴가</span></li>
		                                                                    <li class="dropdown-item"><span>외근</span></li>
		                                                                </ul>
		                                                            </div>
		                                                        </td>
		                                                    </tr>
		                                                </table>
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
        
        document.getElementById('today').innerHTML = formatToday;
        
        // 현재까지 근무시간
        // percent = 현재까지 근무시간(분) / 3120 * 100  (예를 든 현재 시간은 41시간 42분)
        var percent = (2502 / 3120 * 100).toFixed(2);
        
        $('#totalWorkingHours').html('41h 42m').css('font-size', '5vmin');
        $('#progress').css('width', percent +"%");
        
        $('#goTo').on('click', function(){
            $(this).css({'border':'2px solid gray', 'color':'gray'});
            $('#getOff').css({'border':'2px solid #660099', 'color':'#660099'});
        });
        
        $('#getOff').on('click', function(){
            $(this).css({'border':'2px solid gray', 'color':'gray'});
            $('#goTo').css({'border':'2px solid #660099', 'color':'#660099'});
        });

        // 휴가 신청
        $('.leave-card').on('click', function(){
            $('#leaveModal').modal('show');
        });
        
        // 연장근무 신청
        $('.overwork-card').on('click', function(){
            $('#overworkModal').modal('show');
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
	
<!-- test Chart -->
<script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script>
</body>
</html>