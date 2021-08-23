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
<div class="container bootstrap snippets bootdey" id="toptop">
	<div class="row">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green"></i> ${loginUser.name} 님의 SV Messenger </h4>
					</div>
					<div class="portlet-widgets">
						<select class="caret" id="toId" name="toId">
							<option selected disabled>-- 수신인 --</option>
							<c:forEach items="${ tolist }" var= "to"> 
								<c:if test="${ to.name != loginUser.name}">  <!-- 본인은 제외시키기  -->
									<optgroup label="${ to.deptName } 팀 ">
										<c:if test="${ to.deptName eq '인사'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '마케팅' }" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '생산'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '영업'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '회계'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
									</optgroup>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--    채팅창    -->
				<div id="chat" class="panel-collapse">
					<div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: auto;">
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
										<img class="media-object img-circle img-chat" src="resources/assets/images/dp.png" alt="">
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
					<div class="portlet-footer">
						<div class="row" style="height: 100px !important;">
							<div class="col-sm-10">
								<textarea id="chatContent" style="width:17em; resize:none;"rows=4 placeholder="메세지 입력"></textarea>
							</div>
							<div class="col-sm-2" style="margin-bottom: 3px;">
								<button class="btn btn-sm bg-c-dblue text-c-white" onclick="" id="">File</button>
								<button type="button" class="btn btn-sm bg-c-purple text-c-white" onclick="submitFunction();">Send</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 채팅 창 끝 -->
			</div>
	</div><!-- row -->
</div><!-- container -->    
<!--  Messenger END  -->          

<script>
$( document ).ready(function() { 
		
/* 	$(function(){
		ReadList();
		setInterval(function(){	ReadList();	},3000); 
	}); */
	
/* 	function dept(){
		$.ajax({
			url:'dept.ms',
			contentType:"application/json; charset=UTF-8",
			dataType:'json',
			data:{ deptNo:deptNo },
			success: function(data){
				console.log('dept.ms success');
				
				$tBody = $('#tb tbody'); 
				
				var $tr;
				var $id;
				var $title;
				var $writer;
				var $createDate;
				var $count;
				var $file;
				
				if(data.length>0){
					for( var i in data){
						$tr=$('<tr>');
							$id=$('<th>').text(data[i].boardId); 
						$title=$('<th>').text(data[i].boardTitle)
						$writer = $('<th>').text(data[i].boardWriter);
						$createDate = $('<th>').text(data[i].boardCreateDate);
						$count = $('<th>').text(data[i].boardCount);
						$file = $('<th>').text(data[i].originalFileName);
						if(data[i].originalFileName != null){
							$file = $('<th>').text('O')
						}
						
						$tr.append($id);
						$tr.append($title);
						$tr.append($writer);
						$tr.append($createDate);
						$tr.append($count);
						$tr.append($file);
						$tBody.append($tr);
					}
				}
				
			},
			error: function(data){
				console.log(dept.ms error);
			}
		});
	} */
	

}); 
	
function submitFunction(){
	var m_code2 = $('#toId option:selected').val();
	var ms_content = $('#chatContent').val();

	if(m_code2==null){
		alert('수신인을 선택해주세요');
	}
	if(ms_content.trim()==''){
		alert('메세지를 입력해주세요');
	}
	
	$.ajax({
		type : "POST",
		url  : "msSend.ms",
		data : {
				'm_code2'   : m_code2,
				'ms_content': ms_content
		},
		success: function(data){
			if(data=='success'){
				console.log("send success");
				$('#chatContent').val('');
			}
		},
		error: function(data){
			console.log("send error");
		}
	});
};

/* 
var lastId = 0;
function Readlist(){
	var m_code2 = $('#toId option:selected').val();
	var ms_content = $('#chatContent').val();

	if(m_code2==null){
		alert('수신인을 선택해주세요');
	}
	if(ms_content.trim()==''){
		alert('메세지를 입력해주세요');
	}
	
	$.ajax({
		type : "POST",
		url  : "msRead.ms",
		data : {
				'm_code2'   : m_code2,
				'ms_content': ms_content
		},
		success: function(data){
			if(data=='success'){
				console.log("send success");
				$('#chatContent').val('');
			}
		},
		error: function(data){
			console.log("send error");
		}
	});
};
 */
</script>

  
</body>
</html>