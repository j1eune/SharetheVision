<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar header-navbar pcoded-header" style="background-color: #660099; box-shadow: 3px 3px 3px 1px #C0C0C0;">
    <div class="navbar-wrapper" >
        <div class="navbar-logo" style="background-color: #660099;">
<!-- <a class="mobile-menu" id="mobile-collapse" href="#!"> -->
<!-- <i class="ti-menu"></i> -->
            <a class="mobile-search morphsearch-search" href="#">
                <i class="ti-search"></i>
            </a>
            <a href="main">
<!-- <img class="img-fluid" src="resources/assets/images/logo.png" alt="Theme-Logo" /> -->
                <img class="img-fluid" src="resources/assets/images/SVlogo.png" alt="Theme-Logo" />
            </a>
            <a class="mobile-options">
                <i class="ti-more"></i>
            </a>
        </div>
<!-- top middle -->
        <div class="navbar-container container-fluid">
            <ul class="nav-left">
            </ul>
            <ul class="nav-right">
                <li class="header-notification">
                    <span class="text-c-white" style="cursor:pointer" onclick="meeting();"></span>
                </li>            
                <li class="header-notification">
                    <a href="#!">
                        <i class="ti-bell text-c-yellow" ></i>
                        <span class="badge bg-c-yellow"></span>
                    </a>
                    <ul class="show-notification">
                        <li>
                            <h6 class="text-c-purple" >Notifications</h6>
                            <label class="label label-warning">New</label>
                        </li>
                        <li>
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="notification-user">결재 승인 </h5>
                                    <p class="notification-msg"> Complete / Reject </p>
                                    <span class="notification-time">time hh:mm:ss</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="notification-user">New Project </h5>
                                    <p class="notification-msg"> (소속팀) UI 설계 프로젝트 </p>
                                    <span class="notification-time">time hh:mm:ss</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="media">
                                <div class="media-body">
                                    <h5 class="notification-user">내 게시글 댓글 알림</h5>
                                    <p class="notification-msg"> 게시글 : (게시글 제목) </p>
                                    <span class="notification-time">time hh:mm:ss</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>

                <li class="header-notification">
                    <a href="#!">
                        <i class="ti-comment text-c-yellow"></i>
                         <c:if test="${readCount == 0}">
                       	 	<span class="badge bg-c-purple"></span>
                        </c:if>
                         <c:if test="${readCount != 0}">
                       	 	<span class="badge bg-c-yellow"></span>
                        </c:if>
                    </a>
                    
                    <c:if test="${readCount != 0}">
                    <ul class="show-notification Messenger">
                        <li>
                            <h6 class="text-c-purple">Messenger</h6>
                            <label class="label label-warning">New</label>
                        </li>
                        <li> 
                        	<a style="cursor:pointer" target="_blank" class="chatting">
	                            <div class="media">
	                                <i class="ti-email text-c-yellow"></i> 
	                                <div class="media-body" style="margin-left:15px !important;">
	                                    <h5 class="notification-user">New Message</h5>
	                                    <p class="notification-msg">새 메세지가 ${ readCount } 개 있습니다.</p>
	                                    <span class="notification-time"> - Go Click - </span>
	                                </div>
	                            </div>
                            </a>
                        </li>
                    </ul>
                    </c:if>
                </li>

                <!-- top right 프로필-->
                <li class="user-profile header-notification">
                    <a href="#!">
						<c:if test="${userAttach != null}">
							<img style="width: 45px; height: 45px; border-radius:65%;" class="profileImg" src="resources/muploadFile/${userAttach.atChange }"/>
						</c:if>
						<c:if test="${userAttach == null }">
							<img style="width: 45px; height: 45px; border-radius:65%;" src="resources/assets/images/defaultProfile.png">
						</c:if>
                        <span class="text-c-white"> ${loginUser.name} 님</span>
                        <i class="ti-angle-down text-c-white"></i>
                    </a>
                    <ul class="show-notification profile-notification">
                        <li>
                            <a href="#!">
                                <i class="ti-settings"></i> Settings
                            </a>
                        </li>
                        <li>
                            <a href="updateProfileForm.me">
                                <i class="ti-user"></i> View Profile
                            </a>
                        </li>
                        <li> 
                            <a style="cursor:pointer" target="_blank" class="chatting">
                                <i class="ti-email"></i> My Messages
                            </a>
                        </li>
                        <li>
                            <a href="meetingForm.pr">
                                <i class="ti-video-camera"></i> Get Meeting
                            </a>
                        </li>
                        <li>
                            <a href="#" onclick="logout()">
                                <i class="ti-layout-sidebar-left"></i> Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>
$(function(){
	//메신저 알람
	MSreadCount();	
	//게시물 , 결재 알람 추가 란 ..........
	
	setInterval(function(){
		MSreadCount();
		
	},10000);//10second 
});

function readCount(){
	$.ajax({
		url:"MSreadCount",
		success: function(data){
			console.log("readCount data::",data);
		},
		error: function(data){
			console.log(error);
		}
	});
}

$(".chatting").click(function () {
	$.ajax({
	  type:"POST"
	  ,url:"chatstatus" 
	  ,data:{"chatstat" : 1}
	  ,success:function(){
		  console.log("${chatstatus}");
		  location.reload();
	  },
	  error: function(xhr, status, error) {
            alert(error);
      }  
	 });

window.open('msStart','MS','top=auto,left=auto,width=380,height=600');
});
		
</script>
            