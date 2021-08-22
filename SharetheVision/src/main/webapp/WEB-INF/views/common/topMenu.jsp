<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<nav class="navbar header-navbar pcoded-header" style="background-color: #660099; box-shadow: 3px 3px 3px 1px #C0C0C0;">
    <div class="navbar-wrapper" >
        <div class="navbar-logo" style="background-color: #660099;">
<!-- <a class="mobile-menu" id="mobile-collapse" href="#!"> -->
<!-- <i class="ti-menu"></i> -->
            <a class="mobile-search morphsearch-search" href="#">
                <i class="ti-search"></i>
            </a>
            <a href="index.jsp">
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
                    <span class="text-c-white">알림 메세지 ( ) 건 </span>
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
                        <span class="badge bg-c-yellow"></span>
                    </a>
                    <ul class="show-notification Messenger">
                        <li>
                            <h6 class="text-c-purple">Messenger</h6>
                            <label class="label label-warning">New</label>
                        </li>
                        <li>
                            <div class="media">
                                <img class="d-flex align-self-center img-radius" src="resources/assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                <div class="media-body">
                                    <h5 class="notification-user">New Message</h5>
                                    <p class="notification-msg"> (발신인)님으로부터 새로운 메시지 </p>
                                    <span class="notification-time">time hh:mm:ss</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>


                <!-- top right 프로필-->
                <li class="user-profile header-notification">
                    <a href="#!">
                        <img src="resources/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
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
                            <a href="#">
                                <i class="ti-user"></i> Profile
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="ti-email"></i> My Messages
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="ti-lock"></i> Lock Screen
                            </a>
                        </li>
                        <li>
                            <a href="auth-normal-sign-in.html">
                                <i class="ti-layout-sidebar-left"></i> Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
            