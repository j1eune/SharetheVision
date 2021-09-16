<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords"
        content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
<!--     Google font -->
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet"> -->
<!--     Required Fremwork -->
<!--     <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css"> -->
<!--     themify-icons line icon -->
<!--     <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css"> -->
<!--     ico font -->
<!--     <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css"> -->
<!--     Style.css -->
<!--     <link rel="stylesheet" type="text/css" href="assets/css/style.css"> -->
<!--     <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css"> -->
    <jsp:include page="/WEB-INF/views/common/common.jsp" />
	<jsp:include page="/WEB-INF/views/common/font.jsp"/>
	<script src="https://unpKg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
        .boardDetail-box {
            width: 100%;
            height: 550px;
            padding: 20px;
            position: relative;
        }

        .boardDetail-title {
            font-size: 32px;
            padding: 20px 15px 35px;
        }

		.boardDetail-title-wrap {
		    display: flex;
		    flex-direction: row;
		    align-items: center;
		}

        .boardDetail-card {
            margin-bottom: 0;
        }

        .boardDetail-tabs {
            justify-content: flex-end;
        }

        .boardDetail-notice-type {
            background: #fff;
            padding: 3px 15px;
            border-radius: 20px;
            margin-right: 15px;
            font-size: 20px;
            font-weight: bold;
        }
        
        .notice-all {
        	border: 2px solid #888;
        }
        
        .notice-dept {
        	color: blue;
        	border: 2px solid blue;
       	}

        .boardDetail-content-box {
            height: 80%;
            position: relative;
        }

        .boardDetail-btn-box {
        	width: 100%;
            position: absolute;
            bottom: 20px;
            right: 0;
			padding: 0 20px;
            transform: translate(0, -50%);
            display: flex;
            justify-content: space-between;
            flex-direction: row;
            
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
		    top: 23%;
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
			margin-right: 10px;
		}
		
		.boardDetail-writer-img i {
			color: #ccc;
			font-size: 24px;
			width: 46.6px;
			height: 46.6px;
			line-height: 46.6px;
		}
		
		.reply-area {
			height: 290px;
			overflow: scroll;
		}
		
		.reply-box {
			display: flex;
			align-items: center;
			padding: 7px 0;
		}
		
		.userInfo {
			display: flex;
			align-items: center;
			width: 140px;
		}
		
		.userPhoto {
			width: 35px;
			height: 35px;
			margin: 0 15px;
			border-radius: 50%;
		}
		
		.userName {
			font-size: 14px;
			font-wieght: 600;
			height: 20px;
			margin: 0;
		}
		
		.userDept {
			font-size: 10px;
			color: #888;
			height: 20px;
			margin: 0;
		}
		
		.reply-content {
			width: 815px;
		}
		
		.reply-createDate {
			width: 100px;
			text-align: center;
			font-size: 12px;
		}
		
		.reply-deleteBtn {
			width: 32px;
			text-align: center;
		}
		
		.replyInputBox {
			flex-direction: row;
		}
		
		.replyInput {
			border: none;
			border-bottom: 1px solid #609;
			width: calc(100% - 67.3px);
			padding-left: 10px;
		}
		
		.deleteIcon {
			color: #999;
			transition: .3s;
			cursor: pointer;
		}
		
		.deleteIcon:hover {
			color: #000;
		}
		
		.replyNo {
			display: none;
		}
		
		.reply-deleteBtn {
			border: none;
			background: none;
		}

		.project-ongoing,
		.project-end {
			font-size: 16px;
			font-weight: bold;
			color: #fff;
		    padding: 2px 10px;
		    border-radius: 5px;
		    margin-left: 10px;
		}
		
		.project-ongoing {
			background: #00c;
		}

		.project-end {
		    background: #888;
		}
		
		.boardDetail-head {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		
		.profileImg {
			border-radius: 50%;
		}
		
		.backBtn {
			padding: 5px 18px;
			font-size: 14px;
		}
		
		.reverse {
			flex-direction: row-reverse;
		}
		
		.boardContent {
			height: 300px;
			overflow: scroll;
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
                                            
                                            <input type="hidden" name="boardNo" value="${ notice.boardNo }">
                                            	<div class="boardDetail-head">
                                            		<div class="boardDetail-title-wrap">
                                            			<c:if test="${ notice.noticeType == 1 }">
	                                           			 	<span class="boardDetail-notice-type notice-all">전체</span>
                                            			</c:if>
                                            			<c:if test="${ notice.noticeType == 2 }">
	                                           			 	<span class="boardDetail-notice-type notice-dept">부서</span>
                                            			</c:if>
                                            			<span>${ notice.boardTitle }</span>
                                            		</div>
                                            		<c:url var="returnList" value="returnList.bo">
                                            			<c:param name="currentPage" value="${ currentPage }"/>
                                            			<c:param name="currentList" value="${ currentList }"/>
                                            		</c:url>
                                            		<a href="${ returnList }">
	                                            		<button type="button" id="boardDetailListBtn" class="btn boardDetail-btn backBtn">이전</button>
                                            		</a>
                                           		</div>
                                           	</div>
                                           	<div class="boardDetail-boardInfo">
												<div class="boardDetail-writer-img">
													<c:if test="${ empty profileImage }">
														<img class="profileImg" src="resources/assets/images/defaultProfile.png">
													</c:if>
													<c:if test="${ !empty profileImage }">
														<img class="profileImg" src="resources/muploadFile/${ profileImage.atChange }"/>
													</c:if>
												</div>
                                           		<div class="boardDetail-flex-column">
	                                           		<p class="board-writer">${ notice.boardWriter }</p>
	                                           		<p class="board-date">${ notice.boardCreateDate }</p>
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
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content tabs card-block boardDetail-content-box">
                                                <div class="tab-pane boardDetail-content active" id="home1"
                                                    role="tabpanel">
                                                    <p class="m-0 boardContent">${ notice.boardContent }</p>
                                                    <div class="boardDetail-btn-box">
                                                    	
                                                    	<c:if test="${ loginUser.mCode == notice.memberCode }">
	                                                    	<div>
	                                                    		<c:url var="updateNoticeForm" value="updateNoticeForm.bo">
	                                                    			<c:param name="boardNo" value="${ notice.boardNo }"/>
	                                                    			<c:param name="boardTitle" value="${ notice.boardTitle }"/>
	                                                    			<c:param name="boardContent" value="${ notice.boardContent }"/>
	                                                    			<c:param name="deptNo" value="${ notice.deptNo }"/>
	                                                    			<c:param name="noticeType" value="${ notice.noticeType }"/>
	                                                    		</c:url>
		                                                       	<button type="button" id="boardDetailUpdateBtn"
		                                                           class="btn boardDetail-btn updateBtn">수정</button>
		                                                           
	                                                            <c:url var="deleteNotice" value="deleteNotice.bo">
                                                    				<c:param name="bId" value="${ notice.boardNo }"/>
                                                    			</c:url>
		                                                       	<button type="button" id="boardDetailDeleteBtn"
		                                                           class="btn boardDetail-btn deleteBtn">삭제</button>
	                                                    	</div>
                                                    	</c:if>
                                                    	
                                                    </div>
                                                </div>
                                                <div class="tab-pane boardDetail-content" id="profile1" role="tabpanel">
                                                	<c:if test="${ attachedFile eq null }">
	                                                    <p class="m-0">등록된 첨부파일이 없습니다.</p>
                                                	</c:if>
                                                	<c:if test="${ attachedFile ne null }">
                                                		<a href="${ pageContext.request.contextPath }/resources/archive/${ attachedFile.atChange }" download="${ attachedFile.atOrigin }">${ attachedFile.atOrigin }</a>
                                                	</c:if>
                                                	<c:if test="${ attachedFile eq null }">
	                                                    <div class="boardDetail-btn-box">
	                                                        <button type="button" id="boardDetailDownloadBtn" class="btn boardDetail-btn">다운로드</button>
	                                                    </div>
                                                	</c:if>
                                                	<c:if test="${ attachedFile ne null }">
	                                                	<a  href="${ pageContext.request.contextPath }/resources/archive/${ attachedFile.atChange }"  download="${ attachedFile.atOrigin }">
		                                                    <div class="boardDetail-btn-box reverse">
		                                                        <button type="button" id="boardDetailDownloadBtn" class="btn boardDetail-btn">다운로드</button>
		                                                    </div>
	                                                	</a>
                                                	</c:if>
                                                </div>
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
    
    <script>
    	
    	$(function() {
    		$('.updateBtn').click(function() {
    			location.href="${ updateNoticeForm }";
    		});
    	});
    	
		$(function() {
    		$('.deleteBtn').click(function() {
    			swal({
    				title: "잠깐!",
    				text: "게시글을 삭제하시겠습니까?",
    				icon: "warning",
    				buttons: ["취소", "삭제"],
    				dangerMode: true,
    			})
    			.then((willDelete) => {
    				if (willDelete) {
		    			location.href="${ deleteNotice }";
    				}
    			});
    		});
		})
		
     </script>

                                                    
<!--     Warning Section Ends -->
<!--     Required Jquery -->
<!--     <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script> -->
<!--     <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script> -->
<!--     <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script> -->
<!--     <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script> -->
<!--     jquery slimscroll js -->
<!--     <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script> -->
<!--     modernizr js -->
<!--     <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script> -->
<!--     <script type="text/javascript" src="assets/js/modernizr/css-scrollbars.js"></script> -->
<!--     classie js -->
<!--     <script type="text/javascript" src="assets/js/classie/classie.js"></script> -->
<!--     Custom js -->
<!--     <script type="text/javascript" src="assets/js/script.js"></script> -->
<!--     <script src="assets/js/pcoded.min.js"></script> -->
<!--     <script src="assets/js/demo-12.js"></script> -->
<!--     <script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
</body>

</html>
