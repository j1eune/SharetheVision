<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title> Welcome SV Company! </title>

      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
	 
	  <jsp:include page="/WEB-INF/views/common/common.jsp" />

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
<!-- Pre-loader end -->

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">       

    <!--  topMenu  -->
    <jsp:include page="/WEB-INF/views/common/topMenu.jsp" />           
    <!--  sideMenu    -->        
    <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />
        
    <!-- Main Content Start -->           
    <div class="pcoded-main-container">
        <div class="pcoded-wrapper">               
            <div class="pcoded-content">
                <div class="pcoded-inner-content">
                    <div class="main-body">
                        <div class="page-wrapper">
                            <div class="page-body">
                                <div class="row">
                                <!-- card1 start -->
                                <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-warning-alt bg-c-purple card1-icon"></i>
                                            <span class="text-c-purple f-w-600">연차사용</span>
                                            <h4>3 / 15</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-purple f-16 icofont icofont-tag m-r-10"></i>2021년도
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card1 end -->
                                <!-- card1 start -->
                                <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                                            <span class="text-c-blue f-w-600">근태현황</span>
                                            <h4>97/100%</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-blue f-16 icofont icofont-warning m-r-10"></i>지각: 3회
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card1 end -->
                                <!-- card1 start -->
                                <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-ui-home bg-c-pink card1-icon"></i>
                                            <span class="text-c-pink f-w-600">보너스</span>
                                            <h4>$50,000</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-pink f-16 icofont icofont-calendar m-r-10"></i>초과근무 포상
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card1 end -->
                                <!-- card1 start -->
                                <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-social-twitter bg-c-yellow card1-icon"></i>
                                            <span class="text-c-yellow f-w-600">결재서류</span>
                                            <h4>UI 기획안</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i> 제출 /완료
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card1 end -->

                                <!-- Data widget start -->
                                <div class="col-md-12 col-xl-5">
                                    <div class="card project-task" style="height: 350px;">
                                        <div class="card-header">
                                            <div class="card-header-left ">
                                                <h5>Project & task</h5>
                                            </div>
                                            <!-- 팀장급만 프로젝트 추가 권한 조건 {-->
                                            <!-- <div class="card-header-right">
                                                <button id="addPro" class="btn-sm btn-primary" style="background-color: #660099;">ADD + </button>
                                            </div> -->
                                            <!-- } 버튼 보이는 조건 여기까지-->
                                        </div>
                                        <div class="card-block p-b-10">
                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <thead></thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="task-contain">
                                                                    <h6 class="bg-c-purple d-inline-block text-center">M1</h6>
                                                                    <p class="d-inline-block m-l-20">UI Design 12345</p>
                                                                </div>
                                                            </td>
                                                            <th>
                                                                <div class="progress d-inline-block">
                                                                    <div class="progress-bar bg-c-purple" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:80%"></div>
                                                                </div>
                                                                <p> 21-02-15 ~ 21-09-16</p>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="task-contain">
                                                                    <h6 class="bg-c-blue d-inline-block text-center">S2</h6>
                                                                    <p class="d-inline-block m-l-20">Semi Project</p>
                                                                </div>
                                                            </td>
                                                            <th>
                                                                <div class="progress d-inline-block">
                                                                    <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%"></div>
                                                                </div>
                                                                <p> 21-05-14 ~ 21-07-06</p>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="task-contain">
                                                                    <h6 class="bg-c-yellow d-inline-block text-center">S2</h6>
                                                                    <p class="d-inline-block m-l-20">Final Project</p>
                                                                </div>
                                                            </td>
                                                            <th>
                                                                <div class="progress d-inline-block">
                                                                    <div class="progress-bar bg-c-yellow" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:10%"></div>
                                                                </div>
                                                                <p> 21-07-09 ~ 21-09-15</p>
                                                            </th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-xl-7" >
                                    <div class="card add-task-card" style="height: 350px; overflow-y:scroll;">
                                        <div class="card-header">
                                            <div class="card-header-left">
                                                <h5>To do list</h5>
                                            </div>
                                            <div class="card-header-right">
                                                <button class="btn btn-card bg-c-purple text-c-white" id="addTodo">ADD + </button>
                                            </div>
                                        </div>
                                        <div class="card-block">
                                            <div class="to-do-list">
                                                <div class="checkbox-fade fade-in-primary d-block">
                                                    <label class="check-task d-block">
                                                        <input type="checkbox" value="">
                                                        <span class="cr">
                                                            <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                        </span>
                                                        <span><h6>Schedule Meeting with Compnes <span class="label bg-c-yellow m-l-10 f-10">***</span></h6></span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="to-do-list">
                                                <div class="checkbox-fade fade-in-primary d-block">
                                                    <label class="check-task d-block">
                                                        <input type="checkbox" value="">
                                                        <span class="cr">
                                                            <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                        </span>
                                                        <span><h6>DB에 있는 To do list 테이블 가져와서 개인업무 뿌리기 <span class="label bg-c-blue m-l-10 f-10">**</span></h6></span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="to-do-list">
                                                <div class="checkbox-fade fade-in-primary d-block">
                                                    <label class="check-task d-block">
                                                        <input type="checkbox" value="">
                                                        <span class="cr">
                                                            <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                        </span>
                                                        <span><h6>기능구현할때 로그 써논 장소 적어뒀다가 지우는거 까먹지 말기<span class="label bg-c-pink m-l-10 f-10">*</span></h6></span>
                                                    </label>                                                            
                                                </div>
                                            </div>
                                            <div class="to-do-list">
                                                <div class="checkbox-fade fade-in-primary d-block">
                                                    <label class="check-task d-block">
                                                        <input type="checkbox" value="">
                                                        <span class="cr">
                                                            <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                        </span>
                                                        <span><h6>팀장급만 프로젝트 ADD 버튼 보이게 하는 조건식 쓰기, 버튼 디자인 정돈하기 <span class="label bg-c-blue m-l-10 f-10">**</span></h6></span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="to-do-list">
                                                <div class="checkbox-fade fade-in-primary d-block">
                                                    <label class="check-task d-block">
                                                        <input type="checkbox" value="">
                                                        <span class="cr">
                                                            <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                        </span>
                                                        <span><h6>작업시작시 README 일기, Fetch/pull 하고 시작하기, 마지막에 push  <span class="label bg-c-blue m-l-10 f-10">**</span></h6></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>   

                                <!-- 캘린더 넣을 예정입니다 Statestics Start  -> Calendar Schedule ADD **-->
                                <div class="col-md-12 col-xl-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Schedule</h5>
                                            <div class="card-header-left"> 달력 넣을 자리</div>
                                        </div>
                                        <div class="card-block">
                                            <div id="statestics-chart" style="height:517px;"></div>

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
        <div class="fixed-button" >
            <a href="#!" target="_blank" class="btn-sm bg-c-purple">
                <i class="ti-angle-up text-c-white" ></i>
            </a>
        </div>
    </div>
    <!-- Main Content End -->           
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
</body>

</html>
