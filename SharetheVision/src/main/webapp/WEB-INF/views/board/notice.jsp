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
	<script src="https://unpKg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	
	.card-box {
	    width: 1171.6px;
	    display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	}
	
	.card-half {
	    width: 570px;
	    margin-bottom: 0;
	}
	
	.more-btn-box {
		width: 73px;
	}
	
	.card .card-header .card-header-right i {
		margin: 0 5px;
	}
	
	.notice-title {
		width: 650px;
		text-align: center;
	}
	
	span.notice-title {
		text-align: left;
		font-weight: bold;
	}
	
	.notice-writer {
		width: 180px;
		text-align: center;
	}
	
	.notice-no {
		text-align: center;
		width: 100px;
	}
	
	.notice-createdate {
		width: 180px;
		text-align: center;
	}
	
	
	tbody td {
		cursor: pointer;
	}
	
	.emptyList {
		text-align: center;
		pointer-events: none;
		color: #666;
		height: 60px;
		line-height: 60px;	
	}
	
	.board-no-align {
		text-align: center;
	}
	
	.notice-badge {
		padding: 7px 20px;
		background: #fff;
		border: 1px solid #888;
		font-weight: bold;
		border-radius: 15px;
		margin-right: 15px;
	}
	
	.badge-dept {
		color: blue;
		border: 1px solid blue;
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
                                                        <span>사내 공지사항이나 부서 공지사항을 확인하는 공간입니다.</span>
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
                                        <div class="card-header">
                                            <h5>공지사항</h5>
                                            <div class="card-header-right more-btn-box">
                                            	<a href="noticeList.bo">
	                                                <span class="more-btn">더보기<i class="ti-angle-double-right"></i></span>
                                            	</a>
                                            </div>
                                        </div>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <table class="table table-hover board-table">
                                                    <thead>
                                                        <tr>
                                                            <th class="notice-no"><input type="hidden" id="currentList" value="${ currentList }"></th>
                                                            <th class="notice-title">제목</th>
                                                            <th class="notice-writer">작성자</th>
                                                            <th class="notice-createdate">작성일</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    	<c:if test="${ !empty notice }">
	                                                    	<c:forEach var="notice" items="${ notice }">
		                                                        <tr>
			                                                        <c:url var="boardDetail" value="boardDetail.bo">
			                                                        </c:url>
		                                                            <td scope="row" class="board-no-align">${ notice.boardNo }</td>
		                                                            <td>
		                                                            	<c:if test="${ notice.noticeType == 1 }">
			                                                            	<span class="notice-badge badge-all">전체</span><span class="notice-title">${ notice.boardTitle }</span>
		                                                            	</c:if>
		                                                            	<c:if test="${ notice.noticeType == 2 }">
			                                                            	<span class="notice-badge badge-dept">부서</span><span class="notice-title">${ notice.boardTitle }</span>
		                                                            	</c:if>
	                                                            	</td>
		                                                            <td class="notice-writer">${ notice.boardWriter }</td>
		                                                            <td class="notice-createdate">${ notice.boardCreateDate }</td>
		                                                        </tr>
	                                                        </c:forEach>
                                                        </c:if>
                                                        <c:if test="${ empty notice }">
                                                        	<tr>
                                                        		<td colspan="4" class="emptyList">등록된 공지사항이 없습니다.</td>
                                                        	</tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
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
<script>
 	$(function(){
 		$('.board-table').find("td").click(function() {
 			var bId = $(this).parents().children("td").eq(0).text();
 			var currentList = $('#currentList').val();

			location.href="noticeDetail.bo?bId="+bId+"&currentList="+currentList;
 		});
 	});
	
</script>
</body>

</html>