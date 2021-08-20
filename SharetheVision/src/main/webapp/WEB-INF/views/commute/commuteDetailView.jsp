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
<style>
	#prev, #next{cursor:pointer}
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
		                                   <div class="card-block text-center">
		                                       <div class="row">
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 누적</h5>
		                                               <h3>38h 28m 24s</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 초과</h5>
		                                               <h3>0h 0m 0s</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 잔여</h5>
		                                               <h3>13h 31m 36s</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 달 누적</h5>
		                                               <h3>154h 32m 37s</h3>
		                                           </div>
		                                           <div class="col-lg">
		                                               <h5 class="m-b-20">이번 달 연장</h5>
		                                               <h3>0h 0m 0s</h3>
		                                           </div>
		                                       </div>
		                                   </div>
		                               </div>
		                           </div>
		                       </div>
		                       <!-- Page-header end -->
		
		                       <!-- Page-body start -->
		                       <div class="page-body">
		                           <!-- Multiple Open Accordion start -->
		                           <div class="card">
		                               <div class="card-header">
		                                   <h5 class="card-header-text">주차별 출퇴근현황</h5>
		                               </div>
		                               <div class="card-block accordion-block">
		                                   <div id="accordion" role="tablist" aria-multiselectable="true">
		                                       <div class="accordion-panel">
		                                           <div class="accordion-heading clickWeek" role="tab" id="headingOne">
		                                               <h3 class="card-title accordion-title">
		                                                   <a class="accordion-msg" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		                                                       <i class="icofont icofont-rounded-down"></i>
		                                                       &nbsp; 1주차
		                                                   </a>
		                                               </h3>
		                                           </div>
		                                           <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
		                                               <div class="accordion-content accordion-desc">
		                                                   <div class="table-border-style">
		                                                       <div class="table-responsive">
		                                                           <table class="table table-hover" id="1WeekTable">
		                                                               <thead>
		                                                                   <tr>
		                                                                       <th>일자</th>
		                                                                       <th>업무시작</th>
		                                                                       <th>업무종료</th>
		                                                                       <th>총 근무시간</th>
		                                                                       <th>근무시간 상세</th>
		                                                                       <th>승인요청내역</th>
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
		                                       <div class="accordion-panel">
		                                           <div class="accordion-heading clickWeek" role="tab" id="headingTwo">
		                                               <h3 class="card-title accordion-title">
		                                                   <a class="accordion-msg" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		                                                       <i class="icofont icofont-rounded-down"></i>
		                                                       &nbsp; 2주차
		                                                   </a>
		                                               </h3>
		                                           </div>
		                                           <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
		                                               <div class="accordion-content accordion-desc">
		                                                   <div class="table-border-style">
		                                                       <div class="table-responsive">
		                                                           <table class="table table-hover" id="2WeekTable">
		                                                               <thead>
		                                                                   <tr>
		                                                                       <th>일자</th>
		                                                                       <th>업무시작</th>
		                                                                       <th>업무종료</th>
		                                                                       <th>총 근무시간</th>
		                                                                       <th>근무시간 상세</th>
		                                                                       <th>승인요청내역</th>
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
		                                       <div class="accordion-panel">
		                                           <div class="accordion-heading clickWeek" role="tab" id="headingThree">
		                                               <h3 class="card-title accordion-title">
		                                                   <a class="accordion-msg" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		                                                       <i class="icofont icofont-rounded-down"></i>
		                                                       &nbsp; 3주차
		                                                   </a>
		                                               </h3>
		                                           </div>
		                                           <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                                               <div class="accordion-content accordion-desc">
		                                                   <div class="table-responsive">
		                                                       <table class="table table-hover" id="3WeekTable">
		                                                           <thead>
		                                                               <tr>
		                                                                   <th>일자</th>
		                                                                   <th>업무시작</th>
		                                                                   <th>업무종료</th>
		                                                                   <th>총 근무시간</th>
		                                                                   <th>근무시간 상세</th>
		                                                                   <th>승인요청내역</th>
		                                                               </tr>
		                                                           </thead>
		                                                           <tbody>
		                                                           </tbody>
		                                                       </table>
		                                                   </div>
		                                               </div>
		                                           </div>
		                                       </div>
		                                       <div class="accordion-panel">
		                                           <div class="accordion-heading clickWeek" role="tab" id="headingFour">
		                                               <h3 class="card-title accordion-title">
		                                                   <a class="accordion-msg" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		                                                       <i class="icofont icofont-rounded-down"></i>
		                                                       &nbsp; 4주차
		                                                   </a>
		                                               </h3>
		                                           </div>
		                                           <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
		                                               <div class="accordion-content accordion-desc">
		                                                   <div class="table-responsive">
		                                                       <table class="table table-hover" id="4WeekTable">
		                                                           <thead>
		                                                               <tr>
		                                                                   <th>일자</th>
		                                                                   <th>업무시작</th>
		                                                                   <th>업무종료</th>
		                                                                   <th>총 근무시간</th>
		                                                                   <th>근무시간 상세</th>
		                                                                   <th>승인요청내역</th>
		                                                               </tr>
		                                                           </thead>
		                                                           <tbody>
		                                                               
		                                                           </tbody>
		                                                       </table>
		                                                   </div>
		                                               </div>
		                                           </div>
		                                       </div>
		                                       <div class="accordion-panel">
		                                           <div class="accordion-heading clickWeek" role="tab" id="headingFive">
		                                               <h3 class="card-title accordion-title">
		                                                   <a class="accordion-msg" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
		                                                       <i class="icofont icofont-rounded-down"></i>
		                                                       &nbsp; 5주차
		                                                   </a>
		                                               </h3>
		                                           </div>
		                                           <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
		                                               <div class="accordion-content accordion-desc">
		                                                   <div class="table-responsive">
		                                                       <table class="table table-hover" id="5WeekTable">
		                                                           <thead>
		                                                               <tr>
		                                                                   <th>일자</th>
		                                                                   <th>업무시작</th>
		                                                                   <th>업무종료</th>
		                                                                   <th>총 근무시간</th>
		                                                                   <th>근무시간 상세</th>
		                                                                   <th>승인요청내역</th>
		                                                               </tr>
		                                                           </thead>
		                                                           <tbody>
		                                                               <!-- <tr class="clickDaily">
		                                                                   <td>01 일</td>
		                                                                   <td>09:58:39</td>
		                                                                   <td>16:23:49</td>
		                                                                   <td>05h25m34s</td>
		                                                                   <td>기본 05h25m34s / 연장 0h0m0s / 야간 0h0m0s</td>
		                                                                   <td></td>
		                                                               </tr>
		                                                               <tr>
		                                                                   <th colspan="6">
		                                                                       <div class="row">
		                                                                           <div class="col d-inline-block">00</div>
		                                                                           <div class="col d-inline-block">01</div>
		                                                                           <div class="col d-inline-block">02</div>
		                                                                           <div class="col d-inline-block">03</div>
		                                                                           <div class="col d-inline-block">04</div>
		                                                                           <div class="col d-inline-block">05</div>
		                                                                           <div class="col d-inline-block">06</div>
		                                                                           <div class="col d-inline-block">07</div>
		                                                                           <div class="col d-inline-block">08</div>
		                                                                           <div class="col d-inline-block">09<br><span class="b-l-default small">&nbsp;출근</span></div>
		                                                                           <div class="col d-inline-block">10</div>
		                                                                           <div class="col d-inline-block">11</div>
		                                                                           <div class="col d-inline-block">12</div>
		                                                                           <div class="col d-inline-block">13</div>
		                                                                           <div class="col d-inline-block">14</div>
		                                                                           <div class="col d-inline-block">15<br><span class="b-l-default small">&nbsp;외근</span></div>
		                                                                           <div class="col d-inline-block">16</div>
		                                                                           <div class="col d-inline-block">17</div>
		                                                                           <div class="col d-inline-block">18</div>
		                                                                           <div class="col d-inline-block">19<br><span class="b-l-default small">&nbsp;퇴근</span></div>
		                                                                           <div class="col d-inline-block">20</div>
		                                                                           <div class="col d-inline-block">21</div>
		                                                                           <div class="col d-inline-block">22</div>
		                                                                           <div class="col d-inline-block">23</div>
		                                                                       </div>
		                                                                   </th>
		                                                               </tr> -->
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
		    </div>
		</div>
	</div>
</div>

<script>
// 	var $window = $(window);
// 	var nav = $('.fixed-button');
// 	    $window.scroll(function(){
// 	        if ($window.scrollTop() >= 200) {
// 	        nav.addClass('active');
// 	    }
// 	    else {
// 	        nav.removeClass('active');
// 	    }
// 	});
	
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
	});
	
</script>
	
</body>
</html>