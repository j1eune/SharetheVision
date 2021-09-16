<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.profileImg{
		width:100%;
		height:100%;
		object-fit: fill;
	}
	
	.profileBox{
		width: 45px;
		height: 45px;
		overflow:hidden;
		border-radius: 65%;
	}
</style>
<nav class="pcoded-navbar">
    <div style="height: 100px;"></div>
    <div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<div class="profileBox">
					<c:if test="${userAttach != null}">
						<img class="profileImg" src="resources/muploadFile/${userAttach.atChange }"/>
					</c:if>
					<c:if test="${userAttach == null }">
						<img class="profileImg" src="resources/assets/images/defaultProfile.png">
					</c:if>
				</div>
				<div class="user-details">
					<span>${loginUser.name} 님</span>
                     <span id="more-details">${loginUser.deptName}팀&nbsp;<font color="gray">${loginUser.jobName }</font>&nbsp;<i class="ti-angle-down"></i></span> 
				</div>
			</div>

			<div class="main-menu-content">
				<ul>
					<li class="more-details">
						<c:url var="updateProfileForm" value="updateProfileForm.me">
						</c:url>
						<a href="${ updateProfileForm }"><i class="ti-user"></i>View Profile</a>
						
						<c:url var="memberList" value="memberList.me">
							<c:param name="condition" value="refresh"/>
							<c:param name="page" value="1"/>
						</c:url>
						<a href="${ memberList }"><i class="ti-list"></i>Group Member</a> 
						
						<a href="#" onclick="logout()"><i class="ti-layout-sidebar-left"></i>Logout</a>
						<script>
							function logout(){
								if(confirm('로그아웃 하시겠습니까?')){
									location.href="logout.me";
								}
							}
						</script>
					</li>
				</ul>
			</div>
		</div>
		<br>
    
        <ul class="pcoded-item pcoded-left-item">
        
        <c:url var="home" value="home.me"></c:url>
            <li class="active">
                <a href="${ home }">
                    <span class="pcoded-micon" style="background-color: #660099;"><i class="ti-home"></i></span>
                    <span class="pcoded-mtext" data-i18n="nav.dash.main">메인화면</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
			<li class="pcoded-hasmenu">
				<c:url var="commuteMain" value="commuteMain.co"></c:url>
				<c:url var="commuteDetail" value="commuteDetail.co"></c:url>
				<c:url var="leaveDetail" value="leaveDetail.le"></c:url>
				<c:url var="leaveAll" value="leaveAll.le"></c:url>
				<a href="#" onclick="return false;">
					<span class="pcoded-micon" style="background-color:#FFB64D;"><i class="icofont icofont-bag-alt"></i></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">근태관리</span>
					<span class="pcoded-mcaret"></span>
			    </a>
			    <ul class="pcoded-submenu">
			        <li>
			            <a href="${ commuteMain }">
			                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
			                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">근태현황</span>
			                <span class="pcoded-mcaret"></span>
			            </a>
			        </li>
			        <li>
			            <a href="${ commuteDetail }">
			                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
			                <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">출퇴근현황</span>
			                <span class="pcoded-mcaret"></span>
			            </a>
			        </li>
			        <li>
			            <a href="${ leaveDetail }">
			                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
			                <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">휴가현황</span>
			                <span class="pcoded-mcaret"></span>
			            </a>
			        </li>
			    </ul>
			</li>
        </ul>
        
        <ul class="pcoded-item pcoded-left-item">
        
			<c:url var="approval" value="approval.ap"></c:url>
            <li>
                <a href="${ approval }">
                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">전자결재</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            
			<c:url var="notice" value="notice.bo"></c:url>
            <li>
                <a href="${ notice }">
                    <span class="pcoded-micon"><i class="ti-clipboard"></i><b>FC</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">공지사항</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            
            <li class="pcoded-hasmenu">
				<c:url var="board" value="board.bo">
					<c:param name="loginUserDeptNo" value="${ loginUser.deptNo }"></c:param>	
				</c:url>
				<c:url var="projectForm" value="createProjectForm.pr"></c:url>
				
				<a href="#" onclick="return false;">
					<span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
					<span class="pcoded-mtext"  data-i18n="nav.basic-components.main">프로젝트</span>
					<span class="pcoded-mcaret"></span>
			    </a>
			    <ul class="pcoded-submenu">
			        <li>
			            <a href="${ projectForm }">
			                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
			                <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">프로젝트 관리</span>
			                <span class="pcoded-mcaret"></span>
			            </a>
			        </li>
			        <li>
			            <a href="${ board }">
			                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
			                <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">자료실</span>
			                <span class="pcoded-mcaret"></span>
			            </a>
			        </li>
			    </ul>
			</li>
        </ul>
        <ul class="pcoded-item pcoded-left-item">
            <li>
                <a style="cursor:pointer"  target="_blank" class="chatting">
                    <span class="pcoded-micon" style="background-color:#8498B6;"><i class="ti-comment"></i><b></b></span>
                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">메신저</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
        </ul>
    </div>
</nav>

<script>
$(".chatting").click(function () {
			$.ajax({
			  type:"POST"
			  ,url:"chatstatus" 
			  ,data:{"chatstat" : 1}
			  ,success:function(){
				  console.log("${chatstatus}");
					//페이지 가져갈때 세션 생성해서 넘어가게함
				  location.reload();
			  },
			  error: function(xhr, status, error) {
		            alert(error);
		      }  
			 });
	
		window.open('msStart','MS','top=auto,left=auto,width=383,height=600');
});
</script>
