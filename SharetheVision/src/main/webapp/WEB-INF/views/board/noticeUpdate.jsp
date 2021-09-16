<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>SV Company</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
<!--     Google font -->
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet"> -->
<!--     Required Fremwork -->
<!--     <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css"> -->
<!--     themify-icons line icon -->
<!--     <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css"> -->
<!--     ico font -->
<!--     <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css"> -->
<!--     Style.css -->
<!--     <link rel="stylesheet" type="text/css" href="assets/css/style.css"> -->
<!--     <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css"> -->
	<jsp:include page="/WEB-INF/views/common/common.jsp"/>
	<jsp:include page="/WEB-INF/views/common/font.jsp"/>

<style>

	.inputBase {
		font-size: 14px;
		border-color: #ccc;
		border-radius: 2px;
	}

	.boardForm {
		padding: 30px 30px 0;
	}

	.titleWrap {
		margin-bottom: 20px;
		line-height: 40.4px;
	}

	.boardTitle {
		width: 876px;
		height: 40px;
		border-style: none;
		border: 1px solid #ccc;
		padding-left: 10px;
	}
	
	.boardContent {
		resize: none;
		padding: 20px;
		margin-bottom: 20px;
		width: 1111.6px;
	}
	
	.project {
		width: 220px;
		height: 40px;
		margin-right: 10px;
		padding-left: 5px;
	}
	
	.project option {
		height: 40px;
	}
	
	.uploadFile {
		padding: 6px 25px;
		background: #609;
		border-radius: 2px;
		color: #fff;
		cursor: pointer;
		margin-right: 5px;
	}
	
	.uploadFileName {
		height: 32.8px;
		border: none;
		border-bottom: 1px solid #999;
		font-size: 14px;
		color: #999;
		width: 300px;
	}
	
	.fileAndSubmit {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		width: 1111.6px;
	}
	
	.submitBtn {
		border: none;
		width: 88.23px;
		height: 32.8px;
		color: #fff;
		background: #609;
		border-radius: 2px;
		cursor: pointer;
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
                            <div class="main-body">
                                <div class="page-wrapper">
                                	<!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont icofont icofont-save bg-c-pink"></i>
                                                    <div class="d-inline">
                                                        <h4>공지사항</h4>
                                                        <span>사내 공지사항이나 부서 공지사항을 작성하는 공간입니다.</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Page-header end -->

                                    <!-- 여기부터 작성 -->
                                    <div class="card">
                                    	<form action="noticeUpdate.bo" method="post" enctype="Multipart/form-data" class="boardForm">
                                    		
                                    		<div class="titleWrap">
	                                    		<select class="project inputBase" name="noticeType">
	                                    			<option>공지를 선택하세요</option>
	                                    			<c:if test="${ notice.noticeType == 1 }">
		                                    			<option value="1" selected>전체</option>
		                                    			<option value="2">부서</option>
	                                    			</c:if>
	                                    			<c:if test="${ notice.noticeType == 2 }">
		                                    			<option value="1">전체</option>
		                                    			<option value="2" selected>부서</option>
	                                    			</c:if>
	                                    		</select>
	                                    		<input type="text" size="50" name="boardTitle" class="boardTitle inputBase" value="${ notice.boardTitle }">
                                    		</div>
											<textarea rows="15" name="boardContent" class="boardContent inputBase">${ notice.boardContent }</textarea>   
											<div class="fileAndSubmit">
												<div>
													<label for="uploadFile" class="uploadFile">업로드</label>
													<input type="file" id="uploadFile" name="uploadFile" style="display: none;">
													<c:if test="${ empty attachFile }">
														<input class="uploadFileName" value="파일선택" readonly>
													</c:if>
													<c:if test="${ !empty attachFile }">
														<input class="uploadFileName" value="${ attachFile.atOrigin }" readonly>
													</c:if>
													
													<input type="hidden" name="boardNo" value="${ notice.boardNo }">
													<input type="hidden" name="memberCode" value="${ loginUser.mCode }">
													<input type="hidden" name="deptNo" value="${ loginUser.deptNo }">
													<input type="hidden" name="boardWriter" value="${ loginUser.name }">
													
												</div>
												<input type="submit" value="작성" class="submitBtn">
											</div>        		
                                    	</form>
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
		$("#uploadFile").on('change', function() {
			var fileName = $(this).val();
			$(".uploadFileName").val(fileName);
		});
	</script>
        
<!-- <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script> -->
<!-- <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script> -->
<!-- <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script> -->
<!-- <!-- jquery slimscroll js --> -->
<!-- <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script> -->
<!-- <!-- modernizr js --> -->
<!-- <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script> -->
<!-- <!-- am chart --> -->
<!-- <script src="assets/pages/widget/amchart/amcharts.min.js"></script> -->
<!-- <script src="assets/pages/widget/amchart/serial.min.js"></script> -->
<!-- <!-- Todo js --> -->
<!-- <script type="text/javascript " src="assets/pages/todo/todo.js "></script> -->
<!-- <!-- Custom js --> -->
<!-- <script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script> -->
<!-- <script type="text/javascript" src="assets/js/script.js"></script> -->
<!-- <script type="text/javascript " src="assets/js/SmoothScroll.js"></script> -->
<!-- <script src="assets/js/pcoded.min.js"></script> -->
<!-- <script src="assets/js/demo-12.js"></script> -->
<!-- <script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script> -->
</body>

</html>