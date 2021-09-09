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
<link href="resources/assets/css/datePicker/datePicker.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<style>
	#overworkDiv th,td{text-align: center}
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
	                                <div class="card project-task" id="overworkDiv">
	                                    <div class="card-header">
	                                        <div class="card-header-left p-l-30 p-t-20">
	                                            <h5>표준 외 근무 요청</h5>
	                                        </div>
	                                        <div class="card-header-right p-t-20 p-r-30">
	                                            <ul class="list-unstyled card-option">
	                                                <li><i class="icofont icofont-simple-left"></i></li>
	                                                <li id="mainView"><i class="icofont icofont-reply"></i></li>
	                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
	                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
	                                                <li><i class="icofont icofont-ui-edit overwork-card"></i></li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                    <div class="card-block p-b-10 p-l-30 p-r-30">
	                                        <div class="table-responsive">
	                                            <table class="table">
	                                                <thead>
	                                                    <tr>
	                                                        <th>구분</th>
	                                                        <th>날짜</th>
	                                                        <th>시간</th>
	                                                        <th>총 시간</th>
	                                                        <th>사유</th>
	                                                        <th>상태</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody>
	                                                	<c:forEach var="ow" items="${ list }">
	                                                		<tr>
	                                                 		<td>${ow.overworkDate}</td>
	                                                 		<td>
	                                                 			<c:if test="${ow.type == 1}">
	                                                 				연장
	                                                 			</c:if>
	                                                 			<c:if test="${ow.type == 2}">
	                                                 				야간
	                                                 			</c:if>
	                                                 			<c:if test="${ow.type == 3}">
	                                                 				휴일
	                                                 			</c:if>
	                                                 		</td>
	                                                 		<td>${ow.overworkStart} ~ ${ow.overworkEnd}</td>
	                                                 		<td>${ow.overworktime}</td>
	                                                 		<td>${ow.overworkContent}</td>
	                                                 		<td>
	                                                 			<c:choose>	
																	<c:when test="${ow.approval == 'Y'}">
																		<div style="background-color:rgba(13, 110, 253, 0.1); color:#0D6EFD; border-radius: 10px; width:40px; display: inline-block">승인</div>
																	</c:when>
																	<c:when test="${ow.approval == 'N'}">
																		<div style="background-color:rgba(226, 54, 54, 0.1); color:#E23636; border-radius: 10px; width:40px; display: inline-block">반려</div>
																	</c:when>
																	<c:when test="${ow.approval == 'W'}">
																		<div style="background-color:rgba(0, 177, 89, 0.1); color:#00b159; border-radius: 10px; width:40px; display: inline-block">대기</div>
																	</c:when>
		                                            			</c:choose>
	                                                 		</td>
	                                                		</tr>
	                                                	</c:forEach>
	                                                </tbody>
	                                            </table>
	                                        </div>
	                                    </div>
	                                </div>
		        				</div>
		    				</div>
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
	$('#mainView').on('click', function(){
		history.back();
	});
	
	$('.reload-card').on('click', function(){
		location.reload();
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
	
</script>
	
<!-- test Chart -->
<!-- <script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script> -->
</body>
</html>