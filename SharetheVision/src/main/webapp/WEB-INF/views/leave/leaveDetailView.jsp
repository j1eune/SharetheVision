<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<link href="resources/assets/css/datePicker/datePicker.css" rel="stylesheet" type="text/css">
<style>
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
		                        <!-- Page-header start -->
		                        <div class="page-header card">
		                            <div class="text-center">
		                                <label id="prev"><i class="icofont icofont-rounded-left icofont-2x"></i></label>
		                                &nbsp;
		                                <div class="page-header-title m-b-20">
		                                    <h2 id="currentMonth"></h2>
		                                </div>
		                                &nbsp;
		                                <label id="next"><i class="icofont icofont-rounded-right icofont-2x"></i></label>
		                                <div class="">
		                                    <div class="card-block">
		                                        <div class="row">
		                                            <div class="col-lg my-auto">
		                                                <h5>홍길동 팀장</h5>
		                                            </div>
		                                            <div class="col-lg b-r-default b-l-default">
		                                                <h5 class="m-b-20">발생 연차</h5>
		                                                <h3>15</h3>
		                                            </div>
		                                            <div class="col-lg b-r-default">
		                                                <h5 class="m-b-20">조정 연차</h5>
		                                                <h3>0</h3>
		                                            </div>
		                                            <div class="col-lg b-r-default">
		                                                <h5 class="m-b-20">총 연차</h5>
		                                                <h3>15</h3>
		                                            </div>
		                                            <div class="col-lg b-r-default">
		                                                <h5 class="m-b-20">사용 연차</h5>
		                                                <h3>2</h3>
		                                            </div>
		                                            <div class="col-lg">
		                                                <h5 class="m-b-20">잔여 연차</h5>
		                                                <h3>13</h3>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- Page-header end -->
		                        <!-- Page-body start -->
		                        <div class="page-body">
		                            <div class="card">
		                                <div class="card-header">
		                                    <h3>신청 내역</h3>
		                                    <!-- <span>use class <code>table</code> inside table element</span> -->
		                                    <div class="card-header-right">
		                                        <ul class="list-unstyled card-option">
		                                            <li><i class="icofont icofont-simple-left"></i></li>
		                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                            <li><i class="icofont icofont-ui-edit leave-card"></i></li>
		                                            <!-- <li><i class="icofont icofont-error close-card"></i></li> -->
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="card-block table-border-style">
		                                    <div class="table-responsive">
		                                        <table class="table listTable">
		                                            <thead>
		                                                <tr>
		                                                    <th>신청일</th>
		                                                    <th>휴가구분</th>
		                                                    <th>연차 사용기간</th>
		                                                    <th>사용연차</th>
		                                                    <th>내용</th>
		                                                    <th>결제상태</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                                <tr>
		                                                    <th>2021-07-15</th>
		                                                    <td>연차</td>
		                                                    <td>2021-08-19 ~ 2021-08-19</td>
		                                                    <td>1</td>
		                                                    <td></td>
		                                                    <td>대기</td>
		                                                </tr>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="card">
		                                <div class="card-header">
		                                    <h3>사용 내역</h3>
		                                    <!-- <span>use class <code>table</code> inside table element</span> -->
		                                    <div class="card-header-right">
		                                        <ul class="list-unstyled card-option">
		                                            <li><i class="icofont icofont-simple-left "></i></li>
		                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                            <!-- <li><i class="icofont icofont-error close-card"></i></li> -->
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="card-block table-border-style">
		                                    <div class="table-responsive">
		                                        <table class="table listTable">
		                                            <thead>
		                                                <tr>
		                                                    <th>이름</th>
		                                                    <th>부서명</th>
		                                                    <th>휴가구분</th>
		                                                    <th>사용연차</th>
		                                                    <th>연차 사용기간</th>
		                                                    <th>내용</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                                <tr>
		                                                    <th>홍길동</th>
		                                                    <td>디자인팀</td>
		                                                    <td>2021-05-23 ~ 2021-05-23</td>
		                                                    <td>1</td>
		                                                    <td></td>
		                                                    <td></td>
		                                                </tr>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="card">
		                                <div class="card-header">
		                                    <h3>생성 내역</h3>
		                                    <!-- <span>use class <code>table</code> inside table element</span> -->
		                                    <div class="card-header-right">
		                                        <ul class="list-unstyled card-option">
		                                            <li><i class="icofont icofont-simple-left "></i></li>
		                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
<!-- 		                                            <li><i class="icofont icofont-error close-card"></i></li> -->
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="card-block table-border-style">
		                                    <div class="table-responsive">
		                                        <table class="table listTable">
		                                            <thead>
		                                                <tr>
		                                                    <th>등록일</th>
		                                                    <th>사용기간</th>
		                                                    <th>발생일수</th>
		                                                    <th>내용</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                                <tr>
		                                                    <th>2021-03-01</th>
		                                                    <td>2021-03-01 ~ 2022-03-31</td>
		                                                    <td>15</td>
		                                                </tr>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- 휴가 신청 모달 -->
		                        <div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true">
		                        	<%@include file="leaveModal.jsp" %>
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
	    
	$('.write-card').on('click', function(){
	    console.log('클릭');
	    $('#exampleModal').modal('show');
	});
	
	$(function(){
		// 아이콘 변경
        $('.clickWeek').on('click', function(){
            var changeIcon = $(this).find('i');
            changeIcon.removeClass('icofont-rounded-down').addClass('icofont-rounded-up');
            
            var removeIcon = $('.show').prev().find('i');
            removeIcon.removeClass('icofont-rounded-up').addClass('icofont-rounded-down');
        });

        // 일별 출근현황 숨기기
        var daily = $('.clickDaily').next('tr');
        daily.css('display', 'none');

        // 달력
        var currentTitle = document.getElementById('currentMonth');

        var today = new Date();
        var first = new Date(today.getFullYear(), today.getMonth(), 1);
        var dayList = ['일','월','화','수','목','금','토'];
        var monthList = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];
        var leapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
        var notLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
        var pageFirst = first;
        var pageYear;
        if(first.getFullYear() % 4 === 0){
            pageYear = leapYear;
        }else{
            pageYear = notLeapYear;
        }

        // 이번 주 show
        if(first.getDay() == 0){
            var todayWeek = Math.floor(today.getDate() / 7) + 1;
        } else {
            var todayWeek = Math.ceil((today.getDate() + first.getDay()) / 7) + 1;
        }

        var thisWeek = $('#'+todayWeek+'WeekTable').parents('.collapse');
        thisWeek.addClass('show');
        thisWeek.prev().find('i').removeClass('icofont-rounded-down').addClass('icofont-rounded-up');

        function showCalendar(){
            currentTitle.innerHTML = first.getFullYear() + "." + monthList[first.getMonth()];
            
            var monthCnt = 100;
            var cnt = 1;

            // 주 반복
            for(var i = 1; i < 7; i++){
                var $weekTable = $('#'+i+'WeekTable').find('tbody');
                
                // 일 반복
                for(var j = 0; j < 7; j++){
                    var $dailyTr = document.createElement('tr');
                    $dailyTr.setAttribute('class', 'clickDaily');
                    
                    if((i == 1 && j >= first.getDay()) || (i != 1 && cnt <= pageYear[first.getMonth()])){
                        // 날짜 + 요일
                        var $td1 = document.createElement('td');
                        var $td2 = document.createElement('td');
                        var $td3 = document.createElement('td');
                        var $td4 = document.createElement('td');
                        var $td5 = document.createElement('td');
                        var $td6 = document.createElement('td');

                        $td1.textContent = (cnt < 10 ? "0" + cnt : cnt) + " " + dayList[j];
                    
                        $td1.setAttribute('id', cnt);
                        $td2.setAttribute('id', cnt + "start");
                        $td3.setAttribute('id', cnt + "end");
                        $td4.setAttribute('id', cnt + "total");
                        $td5.setAttribute('id', cnt + "detail");
                        $td6.setAttribute('id', cnt + "request");
                        
                        $dailyTr.append($td1);
                        $dailyTr.append($td2);
                        $dailyTr.append($td3);
                        $dailyTr.append($td4);
                        $dailyTr.append($td5);
                        $dailyTr.append($td6);
                        
                        // 일일 시간
                        var $timeTr = $('<tr id="'+cnt+'daily" class="timeTr">').css('display', 'none')
                        var $th = $('<th colspan="6">');
                        var $rDiv = $('<div class="row">');
                        for(var k = 0; k < 24; k++){
                            var $div = $('<div class="col d-inline-block">').html(k < 10 ? "0" + k : k);
                            $rDiv.append($div);
                        }
                        $th.append($rDiv);
                        $timeTr.append($th);

                        $weekTable.append($dailyTr);
                        $weekTable.append($timeTr);

                        cnt++;
                    }
                }
                monthCnt++;
            }
        };
    
        showCalendar();

        // 일일 출퇴근 상세 현황
        $('.clickDaily').on('click', function(){
            var currentRow = $(this);
            var detail = currentRow.next('tr');
            if(detail.is(":visible")){
                detail.hide();
            } else {
                detail.show();
                detail.css({'border':'2px solid #f2f2f2', 'cursor':'default', 'background-color':'white'});
            }
        });
        
        // 이전 버튼
        $('#prev').on('click', function(){
            var $dailyTrs = document.querySelectorAll('.clickDaily');
            var $timeTrs = document.querySelectorAll('.timeTr');

            $dailyTrs.forEach(function(e){
                e.remove();
            });
            $timeTrs.forEach(function(e){
                e.remove();
            });

            if(pageFirst.getMonth() === 1){
                pageFirst = new Date(first.getFullYear()-1, 12, 1);
                first = pageFirst;
                if(first.getFullYear() % 4 === 0){
                    pageYear = leapYear;
                }else{
                    pageYear = notLeapYear;
                }
            }else{
                pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
                first = pageFirst;
            }
            today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
        
            showCalendar();
        });
    
        // 다음 버튼
        $('#next').on('click', function(){
            var $dailyTrs = document.querySelectorAll('.clickDaily');
            var $timeTrs = document.querySelectorAll('.timeTr');

            $dailyTrs.forEach(function(e){
                e.remove();
            });
            $timeTrs.forEach(function(e){
                e.remove();
            });

            if(pageFirst.getMonth() === 12){
                pageFirst = new Date(first.getFullYear()+1, 1, 1);
                first = pageFirst;
                if(first.getFullYear() % 4 === 0){
                    pageYear = leapYear;
                }else{
                    pageYear = notLeapYear;
                }
            }else{
                pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
                first = pageFirst;
            }
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());

            showCalendar();
        });
        
        // 휴가 신청
        $('.leave-card').on('click', function(){
            $('#leaveModal').modal('show');
        });
        
        // 휴가 기간 선택
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