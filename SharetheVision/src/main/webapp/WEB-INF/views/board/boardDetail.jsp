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

        .boardDetail-project-name {
            color: blue;
            margin-right: 10px;
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
            flex-direction: row-reverse;
            
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
		
		.reply-area::-webkit-scrollbar-thumb {
			background-color: lightgray;
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
                                            
                                            <input type="hidden" name="boardNo" value="${ board.boardNo }">
                                            	<div class="boardDetail-head">
                                            		<div class="boardDetail-title-wrap">
                                            			<span class="boardDetail-project-name">[ ${ board.project } ]</span>
                                            			<span>${ board.boardTitle }</span>
			                                       		<c:if test="${ board.boardState == 1 }">
			                                        		<span class="project-ongoing">진행중</span>
			                                       		</c:if>
			                                       		<c:if test="${ board.boardState == 2 }">
			                                        		<span class="project-end">종료</span>
			                                       		</c:if>
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
	                                           		<p class="board-writer">${ board.boardWriter }</p>
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
                                                        role="tab">댓글</a>
                                                </li>
                                                <!-- <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#settings1" role="tab">Settings</a>
                                                </li> -->
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content tabs card-block boardDetail-content-box">
                                                <div class="tab-pane boardDetail-content active" id="home1"
                                                    role="tabpanel">
                                                    <p class="m-0 boardContent">${ board.boardContent }</p>
                                                    <div class="boardDetail-btn-box">
                                                    	<c:url var="addScrap" value="addScrap.bo">
                                                    		<c:param name="mCode" value="${ loginUser.mCode }"/>
                                                    		<c:param name="boardNo" value="${ board.boardNo }"/>
                                                    		<c:param name="project" value="${ board.project }"/>
                                                    		<c:param name="boardTitle" value="${ board.boardTitle }"/>
                                                    		<c:param name="boardWriter" value="${ board.boardWriter }"/>
                                                    		<c:param name="currentList" value="${ currentList }"/>
                                                    		<c:param name="currentPage" value="${ currentPage }"/>
                                                    	</c:url>
                                                    	<c:url var="deleteScrap" value="deleteScrap.bo">
                                                    		<c:param name="mCode" value="${ loginUser.mCode }"/>
                                                    		<c:param name="bId" value="${ board.boardNo }"/>
                                                    		<c:param name="currentList" value="${ currentList }"/>
                                                    		<c:param name="currentPage" value="${ currentPage }"/>
                                                    	</c:url>
                                                    	
                                                    	
                                                    	<c:if test="${ scrapState == null }">
	                                                        <a href="${ addScrap }">
	                                                        	<button type="button" id="boardDetailAddScrapBtn"
	                                                            class="btn boardDetail-btn">스크랩 하기</button>
	                                                    	</a>
                                                    	</c:if>
                                                    	
                                                    	<c:if test="${ scrapState != null }">
	                                                        <a href="${ deleteScrap }">
	                                                        	<button type="button" id="boardDetailRemoveScrapBtn"
	                                                            class="btn boardDetail-btn">스크랩 취소</button>
	                                                    	</a>
                                                    	</c:if>
                                                    	<c:if test="${ loginUser.mCode == board.memberCode }">
	                                                    	<div>
	                                                    		<c:url var="updateBoardForm" value="updateBoardForm.bo">
	                                                    			<c:param name="boardNo" value="${ board.boardNo }"/>
	                                                    			<c:param name="boardTitle" value="${ board.boardTitle }"/>
	                                                    			<c:param name="boardContent" value="${ board.boardContent }"/>
	                                                    			<c:param name="project" value="${ board.project }"/>
	                                                    			<c:param name="deptNo" value="${ board.deptNo }"/>
	                                                    		</c:url>
		                                                       	<button type="button" id="boardDetailUpdateBtn"
		                                                           class="btn boardDetail-btn updateBtn">수정</button>
		                                                           
	                                                            <c:url var="deleteBoard" value="deleteBoard.bo">
                                                    				<c:param name="bId" value="${ board.boardNo }"/>
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
		                                                    <div class="boardDetail-btn-box">
		                                                        <button type="button" id="boardDetailDownloadBtn" class="btn boardDetail-btn">다운로드</button>
		                                                    </div>
	                                                	</a>
                                                	</c:if>
                                                </div>
                                                <div class="tab-pane boardDetail-content" id="messages1"
                                                    role="tabpanel">
                                                    <div class="reply-area">
                                                    	<c:if test="${ !empty reply }">
                                                    		<c:forEach var="reply" items="${ reply }">
		                                                    	<div class="reply-box">
		                                                    		<div class="userInfo">
		                                                    			<c:if test="${ reply.replyWriterImage == null }">
			                                                    			<div class="userPhoto"><img class="profileImg" src="resources/assets/images/defaultProfile.png"></div>
		                                                    			</c:if>
		                                                    			<c:if test="${ reply.replyWriterImage != null }">
			                                                    			<div class="userPhoto"><img class="profileImg" src="resources/muploadFile/${ reply.replyWriterImage }"></div>
		                                                    			</c:if>
		                                                    			<div class="userNameAndDept">
		                                                    				<p class="userName">${ reply.replyWriter }</p>
		                                                    				<p class="userDept"><span>${ reply.deptName }팀</span> <span>${ reply.jobName }</span></p>
		                                                    			</div>
		                                                    		</div>
		                                                    		<div class="reply-content">${ reply.replyContent }</div>
		                                                    		<div class="reply-createDate">${ reply.replyCreateDate }</div>
		                                                    		<c:if test="${ loginUser.mCode == reply.memberCode }">
			                                                    		<div class="reply-deleteBtn">
			                                                    			<i class="icofont icofont-ui-close icofont-xs deleteIcon deleteReply"></i>
		                                                    				<div class="replyNo">${ reply.replyNo }</div>
		                                                    			</div>
		                                                    		</c:if>
		                                                    		<c:if test="${ loginUser.mCode != reply.memberCode }">
		                                                    			<div class="reply-deleteBtn"></div>
		                                                    		</c:if>
		                                                    	</div>
	                                                    	</c:forEach>
                                                    	</c:if>
                                                    	<c:if test="${ empty reply }">
	                                                    	<p class="m-0">댓글이 없습니다.</p>
                                                    	</c:if>
                                                    </div>
                                                    <div class="boardDetail-btn-box replyInputBox">
                                                    	<input type="text" placeholder="댓글을 입력하세요" id="replyContent" class="replyInput">
                                                        <button type="button" id="boardDetailReplyBtn"
                                                            class="btn btn-primary boardDetail-btn">작성</button>
                                                    </div>
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
    			if (${ board.boardState == 2 }) {
    				swal({
    					title: "잠깐!",
    					text: "종료된 프로젝트는 수정할 수 없습니다.",
    					icon: "warning"
    				})
    			} else {
	    			location.href="${ updateBoardForm }";
    			}
    		});
    	});
    	
    	$(document).on('click', '.reply-deleteBtn', function() {
   			var rId = $(this).children("div").text();
    	
    		swal({
    			title: "잠깐!",
    			text: "댓글을 삭제하시겠습니까?",
  				icon: "warning",
  				buttons: ["취소", "삭제"],
  				dangerMode: true,
    		})
    		.then((willDelete) => {
    			if (willDelete) {
    				location.href="deleteReply.bo?rId="+rId;
    			}
    		})
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
		    			location.href="${ deleteBoard }";
    				}
    			});
    		});
		})
		
		$(function() {
			$('#boardDetailReplyBtn').click(function() {
				var replyContent = $('#replyContent').val();
				var bId = ${ board.boardNo };
				
				$.ajax({
					url: 'addReply.bo',
					data: {bId: bId, replyContent: replyContent},
					success: function(data) {
						if(data == "success") {
							$('#replyContent').val('');
							getReplyList();
						}
					}
				})
			});
		});
		
		function getReplyList() {
			var bId = ${board.boardNo};
			
			$.ajax({
				url: 'replyList.bo',
				data: {bId: bId},
				success: function(data) {
					console.log(data);
					
					$replyArea = $('.reply-area');
					$replyArea.html('');
					
					var $box;
					var $userInfo;
					var $userPhoto;
					var $userImg;
					var $userNAD;
					var $userName;
					var $userDept;
					var $userDeptName;
					var $userJobName;
					var $content;
					var $createDate;
					var $deleteBtn;
					var $replyNo;
					var $cparam;
					var $replyIcon;
					
					if (data.length > 0) {
						for(var i in data) {
							$box = $('<div class="reply-box">');
							$userInfo = $('<div class="userInfo">');
							$userPhoto = $('<div class="userPhoto">');
							if(data[i].replyWriterImage != null) {
								$userImg = $('<img class="profileImg" src="resources/muploadFile/'+data[i].replyWriterImage+'">');
							} else {
								$userImg = $('<img class="profileImg" src="resources/assets/images/defaultProfile.png">');
							}
							$userNAD = $('<div class="userNameAndDept">');
							$userName = $('<p class="userName">').text(data[i].replyWriter);
							$userDept = $('<p class="userDept">');
							$userDeptName = $('<span>').text(data[i].deptName + "팀");
							$userJobName = $('<span>').text(" " + data[i].jobName);
							$content = $('<div class="reply-content">').text(data[i].replyContent);
							$createDate = $('<div class="reply-createDate">').text(data[i].replyCreateDate);

							$deleteBtn = $('<div class="reply-deleteBtn">');
							$replyIcon = $('<i class="icofont icofont-ui-close icofont-xs deleteIcon deleteReply">');
							
							if(data[i].memberCode == "${ loginUser.mCode }"){
								$deleteBtn.append($replyIcon);
							}
							
							$replyNo = $('<div class="replyNo">').text(data[i].replyNo);
							
							
							$deleteBtn.append($replyNo);							
							
							$userPhoto.append($userImg);
							$userInfo.append($userPhoto);
							
							$userDept.append($userDeptName);
							$userDept.append($userJobName);
							
							$userNAD.append($userName);
							$userNAD.append($userDept);
							$userInfo.append($userNAD);
							
							$box.append($userInfo);
							$box.append($content);
							$box.append($createDate);
							$box.append($deleteBtn);
							$replyArea.append($box);
						}
					} else {
						$box = $('<div class="reply-box">');
						$content = $('<div class="reply-content">').text("등록된 댓글이 없습니다.");
						
						$box.append($content);
						$replyArea.append($box);
					}
				},
				error: function(data) {
					console.log('error');
				}
			})
			
		}
		
 		$(function() {
 			getReplyList();
			
 			setInterval(function() {
 				getReplyList();
 			}, 10000);
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
