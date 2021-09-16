<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>SV Company</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<style>
	#prev, #next{cursor:pointer}
		
	#title h5 {
		font-family : 'Recipekorea';
	}
	
	#title h3 {
		font-family : 'SpoqaHanSansNeo-Regular';
		color: #660099;
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
		                                   <div class="card-block text-center" id="title">
		                                       <div class="row">
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 누적</h5>
		                                               <h3>${weekWorkTotal}</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 연장</h5>
		                                               <h3>${weekOverTotal}</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 잔여</h5>
		                                               <h3>${remainTotal}</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 달 누적</h5>
		                                               <h3>${monthWorkTotal}</h3>
		                                           </div>
		                                           <div class="col-lg">
		                                               <h5 class="m-b-20">이번 달 연장</h5>
		                                               <h3>${monthOverTotal}</h3>
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
				                               	<c:forEach var="i" begin="1" end="6">
			                                       <div class="accordion-panel">
			                                           <div class="accordion-heading clickWeek" role="tab" id="heading${i}">
			                                               <h3 class="card-title accordion-title">
			                                                   <a class="accordion-msg" data-toggle="collapse" data-parent="#accordion" href="#collapse${i}" aria-expanded="true" aria-controls="collapse${i}">
			                                                       <i class="icofont icofont-rounded-down"></i>
			                                                       &nbsp; ${i}주차
			                                                   </a>
			                                               </h3>
			                                           </div>
			                                           <div id="collapse${i}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${i}">
			                                               <div class="accordion-content accordion-desc">
			                                                   <div class="table-border-style"  id="content">
			                                                       <div class="table-responsive">
			                                                           <table class="table table-hover" id="${i}WeekTable" style="overflow: hidden;">
			                                                               <thead>
			                                                                   <tr>
			                                                                       <th>일자</th>
			                                                                       <th>업무시작</th>
			                                                                       <th>업무종료</th>
			                                                                       <th>총 근무시간</th>
			                                                                       <th>근무시간 상세</th>
			                                                                       <th></th>
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
				                                </c:forEach>
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
	    var pageYear = (first.getFullYear() % 4 === 0) ? leapYear : notLeapYear;
	
	    // 이번 주 show
	    // 오늘 날짜에 이번달 시작하는 요일의 getDay를 더해서 한 주를 7의 배수로 만들기
	    var selectedDay = today.getDate();
	    var monthFirst = first.getDay();
	    var todayWeek = Math.ceil((selectedDay + monthFirst) / 7);
	    
	    var thisWeek = $('#'+todayWeek+'WeekTable').parents('.collapse');
	    thisWeek.addClass('show');
	    thisWeek.prev().find('i').removeClass('icofont-rounded-down').addClass('icofont-rounded-up');
		
	    function showCalendar(){
	        currentTitle.innerHTML = first.getFullYear() + "." + monthList[first.getMonth()];
	        currentTitle.style.fontFamily = "SpoqaHanSansNeo-Bold";
	       
	        String.prototype.format = function() {
	            var formatted = this;
	            for(var arg in arguments) {
	                formatted = formatted.replace("{" + arg + "}", arguments[arg]);
	            }
	            return formatted;
	        };
	     	
	        $.ajax({
	        	url: 'commuteTable.co',
	        	data: {year:first.getFullYear(), month:monthList[first.getMonth()], last:pageYear[first.getMonth()]},
	        	success: function(map){
	        		console.log('commuteTable 성공');
	        		console.log(map);
	        		
	     	        var cnt = 1;
	        		// 주 반복
	     	        for(var i = 1; i < 7; i++){
	     	        	var $weekTable = $('#'+i+'WeekTable').find('tbody');
	     	        	$weekTable.empty();
	     	            // 일 반복
	     	            for(var j = 0; j < 7; j++){
	     	            	var $dailyTr = document.createElement('tr');
			                $dailyTr.setAttribute('class', 'clickDaily');
			                
			                if((i == 1 && j >= first.getDay()) || (i != 1 && cnt <= pageYear[first.getMonth()])){
			                    // 날짜 + 요일
			                    var $td1 = document.createElement('th');
			                    var $td2 = document.createElement('td');
			                    var $td3 = document.createElement('td');
			                    var $td4 = document.createElement('td');
			                    var $td5 = document.createElement('td');
			                    var $td6 = document.createElement('td');
			
			                    $td1.textContent = (cnt < 10 ? "0" + cnt : cnt) + " " + dayList[j];
			                
			                    $td1.setAttribute('id', cnt + "date");
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
			                    var $timeTr = $('<tr id="'+cnt+'daily" class="timeTr">').css({'display':'none', 'overflow':'hidden'});
			                    var $timeTh = $('<th class="small font-weight-bold" colspan="6">').css({'background-color':'rgba(222, 199, 254, 0.1)'});
			                    var $timeDiv = $('<div class="row" id="'+cnt+'timeDiv">');
			                    for(var k = 00; k < 24; k++){
			                        var $timeDetaildiv = $('<div class="col d-inline-block" id="'+k+'time">').html(k < 10 ? "0" + k : k);
			                        $timeDiv.append($timeDetaildiv);
			                    }
			                    $timeTh.append($timeDiv);
			                    $timeTr.append($timeTh);
								
			                    $weekTable.append($dailyTr);
			                    $weekTable.append($timeTr);
			
			                    cnt++;
			                }
	     	            }
	     	        }
	        		
	        		// Commute 데이터 붙이기
	        		for(var i = 0; i < map.colist.length - 1; i++){
	        			var day = map.colist[i].enrollDate.substring(8);
	        			var startTime = map.colist[i].commuteStart.substring(11);
	        			var endTime = map.colist[i].commuteEnd.substring(11);
	        			var workTime = map.colist[i].worktime;
	        			var detailStartTime = map.colist[i].commuteStart.substring(11, 13);
        				var detailEndTime = map.colist[i].commuteEnd.substring(11, 13);
	        			
	        			for(var j = 1; j <= 31; j++){
	        				if(day == j){
	        					
	        					$('#'+j+'start').html(startTime);
	        					$('#'+j+'end').html(endTime);
	        					$('#'+j+'total').html(workTime);
	        					
	        					var workTimeSplit = workTime.toString().split('.');
	        					var detail = (workTimeSplit.length == 2) ? '기본'+"{0}h{1}m".format(workTimeSplit[0], workTimeSplit[1]) : '기본'+"{0}h".format(workTimeSplit[0]);
	        					$('#'+j+'detail').html(detail);
	        					
	        					// detail 시간
	        					var $detailStartDiv = $('#'+j+'timeDiv').children('div').eq(detailStartTime);
	        					var $detailTimeDiv = $('#'+j+'timeDiv').children('div').eq(detailEndTime);
	        					
	        					var $startSpan = $('<br><span class="small">').html('&nbsp;출근').css({'border-left':'2px solid #A05FFC', 'font-family':'SpoqaHanSansNeo-Medium'});
	        					var $endSpan = $('<br><span class="small">').html('&nbsp;퇴근').css({'border-left':'2px solid #A05FFC', 'font-family':'SpoqaHanSansNeo-Medium'});
	        					$detailStartDiv.append($startSpan);
	        					$detailTimeDiv.append($endSpan);
	        				}
	        			}
					}
	        		
	        		// Overwork 데이터 붙이기
	        		for(var i = 0; i < map.owlist.length; i++){
	        			var day = map.owlist[i].overworkDate.substring(8);
	        			var overWork = map.owlist[i].overworktime;
	        			
	        			var detailStartTime = map.owlist[i].overworkStart.substring(0,2);
// 	        			var detailEndTime = map.owlist[i].overworkEnd.substring(0,2);
	        			
	        			for(var j = 1; j <= 31; j++){
	        				if(day == j){
	        					var worktime = parseFloat($('#'+j+'total').html());
	        					var coDetail = $('#'+j+'detail').html();

	        					$('#'+j+'total').html(worktime + overWork);

	        					var overWorkSplit = overWork.toString().split('.');
	        					var detail = (overWorkSplit.length == 2) ? ' / 연장'+"{0}h{1}m".format(overWorkSplit[0], overWorkSplit[1]) : ' / 연장'+"{0}h".format(overWorkSplit[0]); 
	        					
	        					$('#'+j+'detail').html(coDetail + detail);
	        					
	        					// detail시간
	        					var $detailStartDiv = $('#'+j+'timeDiv').children('div').eq(detailStartTime);
// 	        					var $detailTimeDiv = $('#'+j+'timeDiv').children('div').eq(detailEndTime);
	        					
	        					var $startSpan = $('<br><span class="small">').html('&nbsp;연장').css({'border-left':'2px solid #A05FFC', 'font-family':'SpoqaHanSansNeo-Medium'});
// 	        					var $endSpan = $('<br><span class="b-l-default small">').html('&nbsp;퇴근');
	        					$detailStartDiv.append($startSpan);
// 	        					$detailTimeDiv.append($endSpan);
	        				}
	        			}
	        		}
	        		
	        	},
	        	error: function(data){
	        		console.log('실패');
	        	}
	        	
	        });
	    };
	
	    showCalendar();
		
	 	// 일일 출퇴근 상세 현황
	    $(document).on("click", ".clickDaily", function(){
	    	var currentRow = $(this);
	        var detail = currentRow.next('tr');
        	currentRow.css({'border-top':'1.5px solid #DEC7FE'});
	        if(detail.is(":visible")){
	        	currentRow.css({'border-top':'0'});
	            detail.hide();
	        } else {
	            detail.show();
	            detail.css({'cursor':'default', 'border-bottom':'1.5px solid #DEC7FE'});
	        }
	    });

	    // 이전 버튼
	    $('#prev').on('click', function(){
	        if(pageFirst.getMonth() === 1){
	            pageFirst = new Date(first.getFullYear()-1, 12, 1);
	            first = pageFirst;
	            pageYear = (first.getFullYear() % 4 === 0) ? leapYear : notLeapYear;
	        }else{
	            pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
	            first = pageFirst;
	        }
	        today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	    
	        showCalendar();
	    });
	
	    // 다음 버튼
	    $('#next').on('click', function(){
	        if(pageFirst.getMonth() === 12){
	            pageFirst = new Date(first.getFullYear()+1, 1, 1);
	            first = pageFirst;
	            pageYear = (first.getFullYear() % 4 === 0) ? leapYear : notLeapYear;
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