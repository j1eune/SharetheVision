<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#goTo, #getOff, #changeState, #selectState{border: 2px solid #660099; background-color: white; color:#660099; font-size: 20px; box-shadow: none;}
	#selectState{border-radius: 20px;}
	#selectState li{font-size: 20px;}
	#selectState li:hover{cursor:pointer; color: #660099; background-color: #F8F9FA;}
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
                                            <i class="icofont icofont-rounded-left icofont-2x"></i>
                                            &nbsp;
                                            <div class="page-header-title m-b-20">
                                                <h2> 2021. 08 </h2>
                                            </div>
                                            &nbsp;
                                            <i class="icofont icofont-rounded-right icofont-2x"></i>
                                            <div class="">
                                                <div class="card-block text-center">
                                                    <div class="row">
                                                        <div class="col-sm b-r-default">
                                                            <h5 class="m-b-20">이번 주 누적</h5>
                                                            <h3>38h 28m 24s</h3>
                                                        </div>
                                                        <div class="col-sm b-r-default">
                                                            <h5 class="m-b-20">이번 주 초과</h5>
                                                            <h3>0h 0m 0s</h3>
                                                        </div>
                                                        <div class="col-sm b-r-default">
                                                            <h5 class="m-b-20">이번 주 잔여</h5>
                                                            <h3>13h 31m 36s</h3>
                                                        </div>
                                                        <div class="col-sm b-r-default">
                                                            <h5 class="m-b-20">이번 달 누적</h5>
                                                            <h3>154h 32m 37s</h3>
                                                        </div>
                                                        <div class="col-sm">
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
                                                                    <!-- <i class="icofont icofont-rounded-down"></i> -->
                                                                    <i class="icofont icofont-rounded-down"></i>
                                                                    &nbsp; 1주차
                                                                </a>
                                                            </h3>
                                                        </div>
                                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                                            <div class="accordion-content accordion-desc">
                                                                <div class="table-border-style">
                                                                    <div class="table-responsive">
                                                                        <table class="table table-hover">
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
                                                                                <tr>
                                                                                    <td>01 일</td>
                                                                                    <td>09:58:39</td>
                                                                                    <td>16:23:49</td>
                                                                                    <td>05h25m34s</td>
                                                                                    <td>기본 05h25m34s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                    <td></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>02 월</td>
                                                                                    <td>08:41:39</td>
                                                                                    <td>18:01:21</td>
                                                                                    <td>07h15m02s</td>
                                                                                    <td>기본 07h15m02s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                    <td></td>
                                                                                </tr>
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
                                                                        <table class="table table-hover">
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
                                                                                <tr>
                                                                                    <td>01 일</t>
                                                                                    <td>09:58:39</td>
                                                                                    <td>16:23:49</td>
                                                                                    <td>05h25m34s</td>
                                                                                    <td>기본 05h25m34s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                    <td></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>02 월</td>
                                                                                    <td>08:41:39</td>
                                                                                    <td>18:01:21</td>
                                                                                    <td>07h15m02s</td>
                                                                                    <td>기본 07h15m02s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                    <td></td>
                                                                                </tr>
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
                                                                    <table class="table table-hover">
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
                                                                            <tr>
                                                                                <td>01 일</td>
                                                                                <td>09:58:39</td>
                                                                                <td>16:23:49</td>
                                                                                <td>05h25m34s</td>
                                                                                <td>기본 05h25m34s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>02 월</td>
                                                                                <td>08:41:39</td>
                                                                                <td>18:01:21</td>
                                                                                <td>07h15m02s</td>
                                                                                <td>기본 07h15m02s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                <td></td>
                                                                            </tr>
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
                                                                    <table class="table table-hover">
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
                                                                            <tr>
                                                                                <td>01 일</td>
                                                                                <td>09:58:39</td>
                                                                                <td>16:23:49</td>
                                                                                <td>05h25m34s</td>
                                                                                <td>기본 05h25m34s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>02 월</td>
                                                                                <td>08:41:39</td>
                                                                                <td>18:01:21</td>
                                                                                <td>07h15m02s</td>
                                                                                <td>기본 07h15m02s / 연장 0h0m0s / 야간 0h0m0s</td>
                                                                                <td></td>
                                                                            </tr>
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
                                                                    <table class="table table-hover">
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
                                                                            <tr class="clickDaily">
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
                                                                            </tr>
                                                                            <tr class="clickDaily">
                                                                                <td>02 월</td>
                                                                                <td>08:41:39</td>
                                                                                <td>18:01:21</td>
                                                                                <td>07h15m02s</td>
                                                                                <td>기본 07h15m02s / 연장 0h0m0s / 야간 0h0m0s</td>
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
                                                                            </tr>
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
		    var dailyTr = $('.clickDaily').next('tr');
		    dailyTr.css('display', 'none');
		});
		
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
		
		var check = true;
		$('.clickWeek').on('click', function(){
		    var icon = $(this).find('i');
		
		    if(check){
		        icon.removeClass('icofont-rounded-down').addClass('icofont-rounded-up');
		        
		        check = false;
		    } else {
		        icon.removeClass('icofont-rounded-up').addClass('icofont-rounded-down');
		
		        check = true;
		    }
		});
	</script>
	
	<!-- test Chart -->
	<script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script>
</body>
</html>