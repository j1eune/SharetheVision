<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content="flat ui, admin  Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    
    <jsp:include page="/WEB-INF/views/common/common.jsp"/>
    
</head>

<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
			
			<jsp:include page="/WEB-INF/views/common/sideMenu.jsp"/>
		
			<jsp:include page="/WEB-INF/views/common/topMenu.jsp"/>
			
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">

                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont icofont icofont-file-document bg-c-pink"></i>
                                                    <div class="d-inline">
                                                        <h4>화상회의</h4>
                                                        <span>Share the Vision과 연동된 Zoom을 통해 팀원들과 협업할 수 있습니다.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4" >
                                            	<div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title" >
                                                        <li class="breadcrumb-item">
                                                        	<input type="button" class="btn btn-danger btn-round btn-outline-danger" id="meetingBtn" value="회의 시작하기"/>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Page-header end -->

                                    <div class="page-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Share the Vision과 연동된 Zoom회의</h5>
                                                        <br><br>
                                                        <span><i class="icofont icofont-exclamation icofont-2x"></i><font size="5">주의사항</font></span>
                                                        <span><i class="icofont icofont-check"></i>회의 생성하기 버튼을 누를 때마다 새로운 회의가 생성됩니다.</span>
                                                        <span><i class="icofont icofont-check"></i>회의를 생성하면 초대 URL이 출력됩니다.</span>
                                                        <span><i class="icofont icofont-check"></i>회의를 만든 후 호스트가 입장하지 않으면 회의에 참여할 수 없습니다.</span>
                                                        <span><i class="icofont icofont-check"></i>회의를 생성한 후 입장하기 버튼을 눌러 회의를 활성화 시켜주시기 바랍니다.</span>
                                                        <span><i class="icofont icofont-check"></i>회의 초대 시간이 만료되면 회의 중지를 누르시고 새로운 회의를 생성해 주시기 바랍니다.</span>
                                                        <span><i class="icofont icofont-check"></i>초대 URL이 출력된 박스를 클릭하면 URL이 복사됩니다.</span>
                                                        
                                                    </div>
                                                    <div class="card-block" id="contentDiv" style="display:none;">
                                                    	<div class="form-group">
														    <i class="ti-layers">&nbsp;</i><label for="urlTextarea">초대 URL : </label>
														    <textarea onclick="copyText();" style="resize:none;" class="form-control" id="urlTextarea" rows="3"></textarea>
														 </div>
														 <br>
														 <input type="hidden" id="startUrl"/>
														 <div style="text-align: center;">
		                                                     <button onclick="openMeeting()" class="btn btn-danger" style="margin-right:15px;">회의 입장하기</button>
		                                                     <button onclick="location.href='home.me'" class="btn btn-inverse btn-outline-inverse">취소</button>
														 </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
    </div>
</body>
<script>
	count = 1;
	
	$("#meetingBtn").on("click",function(){
		if(count % 2 == 1){
			makeMeeting();
			$(this).val("회의 중지");
		} else {
			console.log("하이드 해야됨");
			$("#contentDiv").hide();
			$(this).val("회의 시작하기");
		}
		count++;
	});

	function makeMeeting(){
		var area = document.getElementById("urlTextarea");
		var start = document.getElementById("startUrl");
		
		$.ajax({
			url: "meeting.pr",
			dataType: "json",
			success: function(data){
				if(data != null){
					area.value = data.join_url;
					start.value = data.start_url;
					$("#contentDiv").show();
				}
				
			},
			error: function(data){
				console.log('실패함');
				
			}
		})
	}
	
	function copyText(){
		var area = document.getElementById("urlTextarea");
		
		area.select();
		document.execCommand("copy");
		
		alert("초대 URL이 복사되었습니다.");
	}
	
	function openMeeting(){
		var url = document.getElementById("startUrl").value;
		window.open(url);
	}
	
</script>

</html>
