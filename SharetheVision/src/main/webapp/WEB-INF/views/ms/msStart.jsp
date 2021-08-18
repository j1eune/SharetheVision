<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title> Messenger </title>
 <!-- Meta -->
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="description" content="CodedThemes">
 <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
 <meta name="author" content="CodedThemes">
<!-- Messenger CSS -->
<link rel="stylesheet" type="text/css" href="resources/vendor/css/custom.css">
</head>
<body>
<!-- 템플릿  공통 -->
<jsp:include page="/WEB-INF/views/common/common.jsp" />

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

		<!--  Messenger START  -->                    
		<div class="container bootstrap snippets bootdey">
		    <div class="row">
		        <div class="col-md-4 col-md-offset-4">
		            <div class="portlet portlet-default">
		                <div class="portlet-heading">
		                    <div class="portlet-title">
		                        <h4><i class="fa fa-circle text-green"></i> Jane Smith</h4>
		                    </div>
		                    <div class="portlet-widgets">
		                        <div class="btn-group">
		                            <button type="button" class="btn btn-white dropdown-toggle btn-xs" data-toggle="dropdown">
		                                <i class="fa fa-circle text-green"></i> Status
		                                <span class="caret"></span>
		                            </button>
		                            <ul class="dropdown-menu" role="menu">
		                                <li><a href="#"><i class="fa fa-circle text-green"></i> Online</a>
		                                </li>
		                                <li><a href="#"><i class="fa fa-circle text-orange"></i> Away</a>
		                                </li>
		                                <li><a href="#"><i class="fa fa-circle text-red"></i> Offline</a>
		                                </li>
		                            </ul>
		                        </div>
		                        <span class="divider"></span>
		                        <a data-toggle="collapse" data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
		                    </div>
		                    <div class="clearfix"></div>
		                </div>
		                <div id="chat" class="panel-collapse collapse in">
		                    <div>
		                    <div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 300px;">
		                        <div class="row">
		                            <div class="col-lg-12">
		                                <p class="text-center text-muted small">January 1, 2014 at 12:23 PM</p>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-lg-12">
		                                <div class="media">
		                                    <a class="pull-left" href="#">
		                                        <img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
		                                    </a>
		                                    <div class="media-body">
		                                        <h4 class="media-heading">Jane Smith
		                                            <span class="small pull-right">12:23 PM</span>
		                                        </h4>
		                                        <p>Hi, I wanted to make sure you got the latest product report. Did Roddy get it to you?</p>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <hr>
		                        <div class="row">
		                            <div class="col-lg-12">
		                                <div class="media">
		                                    <a class="pull-left" href="#">
		                                        <img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
		                                    </a>
		                                    <div class="media-body">
		                                        <h4 class="media-heading">John Smith
		                                            <span class="small pull-right">12:28 PM</span>
		                                        </h4>
		                                        <p>Yeah I did. Everything looks good.</p>
		                                        <p>Did you have an update on purchase order #302?</p>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <hr>
		                        <div class="row">
		                            <div class="col-lg-12">
		                                <div class="media">
		                                    <a class="pull-left" href="#">
		                                        <img class="media-object img-circle img-chat" src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
		                                    </a>
		                                    <div class="media-body">
		                                        <h4 class="media-heading">Jane Smith
		                                            <span class="small pull-right">12:39 PM</span>
		                                        </h4>
		                                        <p>No not yet, the transaction hasn't cleared yet. I will let you know as soon as everything goes through. Any idea where you want to get lunch today?</p>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <hr>
		                    </div>
		                    </div>
		                    <div class="portlet-footer">
		                        <form role="form">
		                            <div class="form-group">
		                                <textarea class="form-control" placeholder="Enter message..."></textarea>
		                            </div>
		                            <div class="form-group">
		                                <button type="button" class="btn btn-default pull-right">Send</button>
		                                <div class="clearfix"></div>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- /.col-md-4 -->
		    </div>
		</div>    
		<!--  Messenger END  -->            
	</div>
</div>

</body>
</html>