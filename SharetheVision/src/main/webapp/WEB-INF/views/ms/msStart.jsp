<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title> SV Messenger </title>
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
<!--  Messenger START  -->                    
<div class="container bootstrap snippets bootdey" >
	<div class="row">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green"></i> ${loginUser.name} 님의 SV Messenger </h4>
					</div>
					<div class="portlet-widgets">
						<select class="caret" id="who">
							<option value="" selected disabled>-- 수신인 --</option>
							<option value="">인사팀</option>
							<option value="">마케팅팀</option>
							<option value="">영업팀</option>
							<option value="">홍보팀</option>
							<option value="">회계팀</option>
						</select>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--    채팅창    -->
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
						<div class="row" style="height: 100px !important;">
							<div class="col-md-10">
								<textarea id="chatContent" style="width:25em; resize:none;"rows=4 placeholder="메세지 입력"></textarea>
							</div>
							<div class="col-md-2" style="margin-bottom: 3px !important;">
								<button class="btn btn-sm bg-c-dblue text-c-white" onclick="submit();" id="send">File</button>
								<button class="btn btn-sm bg-c-purple text-c-white" onclick="submit();" id="send">Send</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 채팅 창 끝 -->
			</div>
		<!-- /.col-md-4 -->
	</div><!-- row -->
</div><!-- container -->    
<!--  Messenger END  -->            
</body>
</html>