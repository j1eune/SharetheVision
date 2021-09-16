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
	                                            <h5>근태 변경 요청</h5>
	                                        </div>
	                                        <div class="card-header-right p-t-20 p-r-30">
	                                            <ul class="list-unstyled card-option">
	                                                <li><i class="icofont icofont-simple-left"></i></li>
	                                                <li id="mainView"><i class="icofont icofont-reply"></i></li>
	                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
	                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
	                                                <li><i class="icofont icofont-ui-edit commute-card"></i></li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                    <div class="card-block p-b-10 p-l-30 p-r-30">
	                                        <div class="table-responsive">
	                                            <table class="table" id="coRequestDetailTable">
	                                                <thead>
	                                                    <tr>
	                                                        <th>구분</th>
	                                                        <th>날짜</th>
	                                                        <th>출근시간</th>
	                                                        <th>퇴근시간</th>
	                                                        <th>사유</th>
	                                                        <th>상태</th>
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
	
	$(function(){
		$.ajax({
			url:'selectApproval.ap',
			data:{type : "근태변경"},
			success: function(data){
				var $tbody = $('#coRequestDetailTable').find('tbody');
				$tbody.html('');
				
				for(var i = 0; i < data.length; i++) {
					$tr = $('<tr>');
					
					var arr = data[i].comment.split("\r\n");
					console.log(arr);
					
					$type = $('<td>').text(afterSubstring(arr[0]));
					$date = $('<td>').text(afterSubstring(arr[1]));
					$start = $('<td>').text(afterSubstring(arr[2]));
					$end = $('<td>').text(afterSubstring(arr[3]));
					$content = $('<td>').text(afterSubstring(arr[4]));
					
					$approval = $('<td>');
					var approvalStr = data[i].apvStatus;
					if(approvalStr == 'D'){
						$approvalDiv = $('<div>').text('반려').css({'background-color':'rgba(226, 54, 54, 0.1)', 'color':'#E23636', 'border-radius':'10px', 'width':'40px', 'margin':'auto'});
					} else if(approvalStr == 'C'){
						$approvalDiv = $('<div>').text('승인').css({'background-color':'rgba(13, 110, 253, 0.1)', 'color':'#0D6EFD', 'border-radius':'10px', 'width':'40px', 'margin':'auto'});
					} else if(approvalStr == 'A'){
						$approvalDiv = $('<div>').text('대기').css({'background-color':'rgba(0, 177, 89, 0.1)', 'color':'#00b159', 'border-radius':'10px', 'width':'40px', 'margin':'auto'});
					}
					
					$approval.append($approvalDiv);
					$tr.append($type);
					$tr.append($date);
					$tr.append($start);
					$tr.append($end);
					$tr.append($content);
					$tr.append($approval);
					$tbody.append($tr);
				}
			},
			error: function(data){
				console.log('에러');
			}
		});
		
		function afterSubstring(str){
			var index = str.indexOf(":");
			var resultStr = str.substring(index+2);
			
			return resultStr;
		}
	});
	
</script>
	
<!-- test Chart -->
<!-- <script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script> -->
</body>
</html>