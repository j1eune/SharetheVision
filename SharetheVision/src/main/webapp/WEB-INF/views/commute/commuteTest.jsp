<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
		                                               <h3>${weekWorkTotal}</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 연장</h5>
		                                               <h3>${weekOverTotal}</h3>
		                                           </div>
		                                           <div class="col-lg b-r-default">
		                                               <h5 class="m-b-20">이번 주 잔여</h5>
		                                               <h3>${52 - (weekWorkTotal+weekOverTotal)}</h3>
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
			                                                   <div class="table-border-style">
			                                                       <div class="table-responsive">
			                                                           <table class="table table-hover" id="${i}WeekTable">
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
			                                                               <!-- 일 반복 -->
				                                                               <c:forEach var="j" begin="0" end="6">
					                                                               <tr class="clickDaily">
																						<td id="${i}${j}date">1</td>
																						<td id="${i}${j}start">2</td>
																						<td id="${i}${j}end">3</td>
																						<td id="${i}${j}total">4</td>
																						<td id="${i}${j}detail">5</td>
																						<td id="${i}${j}request">6</td>
					                                                               </tr>
					                                                               <tr class="tiemTr">
					                                                               		<th colspan="6">
					                                                               			<div class="row">
					                                                               				<c:forEach var="k" begin="1" end="24">
					                                                               					<div class="col d-inline-block">
					                                                               						${k<0 ? "0" + k : k}
					                                                               					</div>
					                                                               				</c:forEach>
					                                                               			</div>
					                                                               		</th>
					                                                               </tr>
				                                                               </c:forEach>
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
	    if(first.getDay() == 0){
	        var todayWeek = Math.floor(today.getDate() / 7);
	    } else {
	        var todayWeek = Math.ceil((today.getDate() + first.getDay()) / 7);
	    }
	
	    var thisWeek = $('#'+todayWeek+'WeekTable').parents('.collapse');
	    thisWeek.addClass('show');
	    thisWeek.prev().find('i').removeClass('icofont-rounded-down').addClass('icofont-rounded-up');
		
	    function showCalendar(){
	        currentTitle.innerHTML = first.getFullYear() + "." + monthList[first.getMonth()];
	        
	        $('.clickDaily').show();
	        var cnt = 1;
	        
	     	// 주 반복
	        for(var i = 1; i < 7; i++){
	            // 일 반복
	            for(var j = 0; j < 7; j++){
	                if((i == 1 && j >= first.getDay()) || (i != 1 && cnt <= pageYear[first.getMonth()])){
	                    // 날짜 + 요일
	                    var date = $('#'+i+j+'date');
	                    
	                    date.html('');
	                    date.html((cnt < 10 ? "0" + cnt : cnt) + " " + dayList[j]);
	                    
	                    cnt++;
	                } else {
	                	var tr = $('#'+i+j+'date').parents('tr');
	                	tr.hide();
	                }
	            }
	        }
			
	        $.ajax({
	        	url: 'commuteTable.co',
	        	success: function(data){
	        		console.log('성공');
	        		console.log(data);
	        	},
	        	error: function(data){
	        		console.log('실패');
	        	}
	        	
	        });
	    };
	
	    showCalendar();
		
	 	// 일일 출퇴근 상세 현황
	    $(document).on("click", ".clickDaily", function (e) {
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