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
                        <i class="ti-bell text-c-yellow"></i>
                        <span class="badge bg-c-yellow" id="noticePoint"></span>
                    </a>
                    <ul class="show-notification" id="notification">
                    </ul>
                </li>

                <li class="header-notification">
                    <a href="#!">
                        <i class="ti-comment text-c-yellow"></i>
                       	<span class="badge" id="msbadge"></span>
                    </a>
                    <ul class="show-notification Messenger">
                        <li>
                            <h6 class="text-c-purple">Messenger</h6>
                            <label class="label" id="msLabel">New</label>
                        </li>
                        <li> 
                        	<a style="cursor:pointer" target="_blank" class="chatting">
	                            <div class="media">
	                                <i class="ti-email text-c-yellow"></i> 
	                                <div class="media-body" style="margin-left:15px !important;">
	                                    <h5 class="notification-user">SV Messenger</h5>
	                                    <div class="notification-msg" id="msMsg"></div>
	                                    <span class="notification-time"> - Go Click - </span>
	                                </div>
	                            </div>
                            </a>
                        </li>
                    </ul>
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
                            <a href="updateProfileForm.me">
                                <i class="ti-user"></i> View Profile
                            </a>
                        </li>
<!--                    <li> 
                            <a style="cursor:pointer" target="_blank" class="chatting">
                                <i class="ti-email"></i> My Messages
                            </a>
                        </li> -->
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
var loginUser = "${loginUser}";
if( loginUser !=null){
	MSreadCount();
	function MSreadCount(){
		$.ajax({
			url:"MSreadCount",
			success: function(data){
				$div=$('#msMsg');
				$div.html('');
				var $span; 
				if(data == '0'){
					$('#msbadge').addClass('bg-c-purple');
					$('#msLabel').addClass('label-gray').text('Empty');
					$('.ti-email').css('color','gray');
					$span=$('<span>').text("새 메세지가 없습니다.");
				}else{
					$('#msbadge').addClass('bg-c-yellow');
					$('#msLabel').addClass('label-warning');
					$span=$('<span>').text("새로운 메세지가"+ data +"개 있습니다.");
				}
				$div.append($span);
			},
			error: function(data){
				console.log("Message Count fail.");
			}
		});
	};	
	
	//메신저  알람 1분 마다 업데이트 가져오기 
	setInterval(function(){
		MSreadCount();	
		
	},60000);// 1min

}
$(".chatting").click(function () {
	$.ajax({
	  url:"chatstatus", 
	  data:{"chatstat" : 1},
	  success:function(){
		  console.log("${chatstatus}");
		  //location.reload();
	  },
	  error: function(xhr, status, error) {
          alert("Open the Messenger Fail.");
      }  
	 });
	window.open('msStart','MS','top=auto,left=auto,width=383,height=600');
});		

// 프로젝트 알림 AJax
$(document).ready(function(){
	var mCode = "${loginUser.mCode}";
	var badge = $("#noticePoint");
	$.ajax({
		url:'notice.no',
		data:{mCode:mCode},
		success:function(data){
			var $ul = $("#notification");

			var $noti = '<h6 class="text-c-purple" style="display: inline-block;"><b>Notifications</b></h6>';
			var $newLabel = '<label style="float: right;" class="label label-warning">New</label>';
			
			var $Emptynoti = '<h6 class="text-c-purple" style="display: inline-block;"><b>No Notifications</b></h6>';
			var $EmptyLabel = '<label style="float: right;" class="label label-gray">Empty</label>';
			
			var $noDiv1 = '<div class="media">';
			var $noDiv2 = '<div class="media-body">'; 
			
			var $noCategory;
			var $noContent;
			var $noDate;
			
			var $result;
			
			if(data.length != 0){
				badge.css('visibility', 'visible');
				$ul.append("<li>"+$noti+$newLabel+"</li>");
				
				for(var i = 0; i < data.length; i++){
					$noCategory = '<h5 class="notification-user">'+data[i].noticeCategory+'</h5>';
					$noContent = '<p class="notification-msg">'+ data[i].noticeContent +'</p>';
					$noDate = '<span class="notification-time">'+data[i].noticeDate + ' </span>';
					
					$result = $noDiv1 + $noDiv2 + $noCategory + $noContent + $noDate;
					$ul.append("<li>"+$result+"</li>");
				}
			} else {
				badge.css('visibility', 'hidden');
				$ul.append("<li>"+$Emptynoti+$EmptyLabel+"</li>");
			}
		},
		error:function(data){
			console.log("실패함");
		}
	});
});

$(document).on('click', '.media', function() {
	$(this).css("cursor","pointer");	
	var category = $(this).find('.notification-user').text();
	var content = $(this).find('.notification-msg').text();

	$.ajax({
		url: 'selectNotice.no',
		data: {category: category, content: content},
		success: function(data) {
			if (data != 'error') {
				location.href=data;
			}
		}
	})
})


</script>