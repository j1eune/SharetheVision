<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Welcome SV Company!</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords"
        content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    <jsp:include page="/WEB-INF/views/common/common.jsp" />

    <style>
        .boardDetail-box {
            width: 100%;
            height: 550px;
            padding: 20px;
            position: relative;
        }

        .boardDetail-title {
            font-size: 32px;
            padding: 35px 15px;
        }

        .boardDetail-card {
            margin-bottom: 0;
        }

        .boardDetail-tabs {
            justify-content: flex-end;
        }

        .boardDetail-project-name {
            color: blue;
            margin-right: 10px;
        }

        .boardDetail-content-box {
            height: 70%;
            position: relative;
        }

        .boardDetail-btn-box {
            position: absolute;
            bottom: 20px;
            right: 0;
            margin-right: 20px;
            transform: translate(0, -50%);
        }
        
        .boardDetail-btn {
        	background-color: #660099;
        	border-color: #660099;
        	color: #fff;
        }
        
        .boardDetail-btn:hover {
        	background-color: #aa00ff;
        	border-color: #aa00ff;
        }
        
        .boardDetail-boardInfo {
        	font-size: 14px;
        	color: #444;
        	padding-left: 15px;
        	display: flex;
        	flex-direction: row;
       	    position: absolute;
		    transform: translate(-50%, -50%);
		    top: 26.5%;
		    left: 7%;
        }
        
        .board-flex-column {
        	display: flex;
			flex-direction: column;
        }
		
		.board-writer {
			margin-bottom: 5px;
		}
		
		.board-date {
			font-size: 12px;
			margin-bottom: 0;
		}
		
		
		.boardDetail-writer-img {
			width: 46.6px;
			height: 46.6px;
			border: 1px solid #ccc;
			border-radius: 50%;
			margin-right: 10px;
			text-align: center;
		}
		
		.boardDetail-writer-img i {
			color: #ccc;
			font-size: 24px;
			width: 46.6px;
			height: 46.6px;
			line-height: 46.6px;
		}
		        
    </style>

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
            <jsp:include page="../common/topMenu.jsp" />
            <!--  sideMenu    -->
            <jsp:include page="../common/sideMenu.jsp" />

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">

                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">

                                    <!-- 여기부터 작성 -->

                                    <div class="card boardDetail-card">
                                        <div class="boardDetail-box">
                                            <div class="boardDetail-title">
                                            	<div><span class="boardDetail-project-name">[ ${ board.project } ]</span>${ board.boardTitle }</div>
                                           	</div>
                                           	<div class="boardDetail-boardInfo">
												<div class="boardDetail-writer-img"><i class="ti-user"></i></div>
                                           		<div class="boardDetail-flex-column">
	                                           		<p class="board-writer">장원형</p>
	                                           		<p class="board-date">${ board.boardCreateDate }</p>
                                           		</div>
                                      		</div>
                                            <!-- Nav tabs -->
                                            <ul class="nav nav-tabs  tabs boardDetail-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-toggle="tab" href="#home1"
                                                        role="tab">내용</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#profile1"
                                                        role="tab">첨부파일</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#messages1"
                                                        role="tab">수정기록</a>
                                                </li>
                                                <!-- <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#settings1" role="tab">Settings</a>
                                                </li> -->
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content tabs card-block boardDetail-content-box">
                                                <div class="tab-pane boardDetail-content active" id="home1"
                                                    role="tabpanel">
                                                    <p class="m-0">${ board.boardContent }</p>
                                                    <div class="boardDetail-btn-box">
                                                    	<c:url var="addScrap" value="addScrap.bo">
                                                    		<c:param name="mCode" value="${ loginUser.mCode }"/>
                                                    		<c:param name="boardNo" value="${ board.boardNo }"/>
                                                    		<c:param name="project" value="${ board.project }"/>
                                                    		<c:param name="boardTitle" value="${ board.boardTitle }"/>
                                                    		<c:param name="boardWriter" value="${ board.boardWriter }"/>
                                                    	</c:url>
                                                    	<c:url var="deleteScrap" value="deleteScrap.bo">
                                                    		<c:param name="mCode" value="${ loginUser.mCode }"/>
                                                    		<c:param name="boardNo" value="${ board.boardNo }"/>
                                                    	</c:url>
                                                    	
                                                    	<c:if test="${ scrapState == null }">
	                                                        <a href="${ addScrap }">
	                                                        	<button type="button" id="boardDetailFileUploadBtn"
	                                                            class="btn boardDetail-btn">스크랩 하기</button>
	                                                    	</a>
                                                    	</c:if>
                                                    	
                                                    	<c:if test="${ scrapState != null }">
	                                                        <a href="${ deleteScrap }">
	                                                        	<button type="button" id="boardDetailFileUploadBtn"
	                                                            class="btn boardDetail-btn">스크랩 취소</button>
	                                                    	</a>
                                                    	</c:if>
                                                    	
                                                    </div>
                                                </div>
                                                <div class="tab-pane boardDetail-content" id="profile1" role="tabpanel">
                                                    <p class="m-0">등록된 첨부파일이 없습니다.</p>
                                                    <div class="boardDetail-btn-box">
                                                        <button type="button" id="boardDetailFileUploadBtn"
                                                            class="btn boardDetail-btn">첨부파일</button>
                                                    </div>
                                                </div>
                                                <div class="tab-pane boardDetail-content" id="messages1"
                                                    role="tabpanel">
                                                    <p class="m-0">수정기록이 없습니다.</p>
                                                    <div class="boardDetail-btn-box">
                                                        <button type="button" id="boardDetailUpdateBtn"
                                                            class="btn btn-primary boardDetail-btn">수정하기</button>
                                                    </div>
                                                </div>
                                                <!-- <div class="tab-pane" id="settings1" role="tabpanel">
                                                    <p class="m-0">4.Cras consequat in enim ut efficitur. Nulla posuere elit quis auctor interdum praesent sit amet nulla vel enim amet. Donec convallis tellus neque, et imperdiet felis amet.</p>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>


                                    <!-- 여기까지 작성 -->

                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
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


    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="assets/js/modernizr/css-scrollbars.js"></script>
    <!-- classie js -->
    <script type="text/javascript" src="assets/js/classie/classie.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="assets/js/script.js"></script>
    <script src="assets/js/pcoded.min.js"></script>
    <script src="assets/js/demo-12.js"></script>
    <script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
</body>

</html>
