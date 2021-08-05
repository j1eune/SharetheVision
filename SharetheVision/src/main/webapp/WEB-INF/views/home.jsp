<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title> Welcome SV Company! </title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
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
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
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
                                                    <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                                                    <span class="text-c-blue f-w-600">Attendance</span>
                                                    <h4>80/100</h4>
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
                                                    <span class="text-c-pink f-w-600">Bonus</span>
                                                    <h4>$50,000</h4>
                                                    <div>
                                                        <span class="f-left m-t-10 text-muted">
                                                            <i class="text-c-pink f-16 icofont icofont-calendar m-r-10"></i>추석
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
                                                    <i class="icofont icofont-warning-alt bg-c-purple card1-icon"></i>
                                                    <span class="text-c-purple f-w-600">연차사용</span>
                                                    <h4>3 / 15</h4>
                                                    <div>
                                                        <span class="f-left m-t-10 text-muted">
                                                            <i class="text-c-purple f-16 icofont icofont-tag m-r-10"></i>여름휴가 포함
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
                                                    <span class="text-c-yellow f-w-600">연차사용</span>
                                                    <h4>3/15</h4>
                                                    <div>
                                                        <span class="f-left m-t-10 text-muted">
                                                            <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i>여름휴가 포함
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- card1 end -->
                                        <!-- Data widget start -->
                                        <div class="col-md-12 col-xl-6">
                                            <div class="card project-task">
                                                <div class="card-header">
                                                    <div class="card-header-left ">
                                                        <h5>Project & task</h5>
                                                    </div>
                                                </div>
                                                <div class="card-block p-b-10">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead></thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <div class="task-contain">
                                                                            <h6 class="bg-c-blue d-inline-block text-center">U</h6>
                                                                            <p class="d-inline-block m-l-20">UI Design</p>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <p class="d-inline-block m-r-20">4 : 36</p>
                                                                        <div class="progress d-inline-block">
                                                                            <div class="progress-bar bg-c-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="task-contain">
                                                                            <h6 class="bg-c-pink d-inline-block text-center">R</h6>
                                                                            <p class="d-inline-block m-l-20">Redesign Android App</p>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <p class="d-inline-block m-r-20">4 : 36</p>
                                                                        <div class="progress d-inline-block">
                                                                            <div class="progress-bar bg-c-pink" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:60%">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="task-contain">
                                                                            <h6 class="bg-c-yellow d-inline-block text-center">L</h6>
                                                                            <p class="d-inline-block m-l-20">Logo Design</p>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <p class="d-inline-block m-r-20">4 : 36</p>
                                                                        <div class="progress d-inline-block">
                                                                            <div class="progress-bar bg-c-yellow" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:50%">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xl-6">
                                            <div class="card add-task-card">
                                                <div class="card-header">
                                                    <div class="card-header-left">
                                                        <h5>To do list</h5>
                                                    </div>
                                                    <div class="card-header-right">
                                                        <button class="btn btn-card btn-primary">Add task </button>
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
                                                                <span><h6>Schedule Meeting with Compnes <span class="label bg-c-pink m-l-10 f-10">**</span></h6></span>
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
                                                                <span><h6>Schedule Meeting with Compnes <span class="label bg-c-blue m-l-10 f-10">*</span></h6></span>
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
                                                                <span><h6>Schedule Meeting with Compnes <span class="label bg-c-pink m-l-10 f-10">**</span></h6></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>   
                                        <!-- Data widget End -->


                                        
                                            <!-- Statestics Start  -> Calendar Schedule ADD **-->
                                            <div class="col-md-12 col-xl-8">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Statestics</h5>
                                                        <div class="card-header-left ">
                                                        </div>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="icofont icofont-simple-left "></i></li>
                                                                <li><i class="icofont icofont-maximize full-card"></i></li>
                                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
                                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
                                                                <li><i class="icofont icofont-error close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div id="statestics-chart" style="height:517px;"></div>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-md-12 col-xl-4">
                                                    <div class="card fb-card">
                                                        <div class="card-header">
                                                            <i class="icofont icofont-social-facebook"></i>
                                                            <div class="d-inline-block">
                                                                <h5>facebook</h5>
                                                                <span>blog page timeline</span>
                                                            </div>
                                                        </div>
                                                        <div class="card-block text-center">
                                                            <div class="row">
                                                                <div class="col-6 b-r-default">
                                                                    <h2>23</h2>
                                                                    <p class="text-muted">Active</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <h2>23</h2>
                                                                    <p class="text-muted">Comment</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card dribble-card">
                                                        <div class="card-header">
                                                            <i class="icofont icofont-social-dribbble"></i>
                                                            <div class="d-inline-block">
                                                                <h5>dribble</h5>
                                                                <span>Product page analysis</span>
                                                            </div>
                                                        </div>
                                                        <div class="card-block text-center">
                                                            <div class="row">
                                                                <div class="col-6 b-r-default">
                                                                    <h2>23</h2>
                                                                    <p class="text-muted">Live</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <h2>23</h2>
                                                                    <p class="text-muted">Message</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                           
                                            <!-- Email Sent End -->

                                            
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fixed-button">
                    <a href="https://codedthemes.com/item/guru-able-admin-template/" target="_blank" class="btn btn-md btn-primary">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
                    </a>
                </div>
                <!-- Main Content End -->     
                
                
            </div>
        </div>

        <!-- Warning Section Starts -->
        <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="resources/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="resources/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="resources/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="resources/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="resources/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->

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
