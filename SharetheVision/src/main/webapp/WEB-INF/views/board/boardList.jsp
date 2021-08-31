<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Welcome SV Company!</title>

      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
   	  <jsp:include page="/WEB-INF/views/common/common.jsp"/>
  
    <style>

	a {
		text-decoration: none !important;
		color: #303548;
	}
	
	a:hover {
		color: #303548;
	}

    .boardList-wrapper {
        height: 580px;
        position: relative;
    }

    .card-header-position {
        position: relative;
    }

    .boardList-btn,
    .boardDetail-btn {
        font-size: 12px;
        padding: 7px 12px;
    }

    .boardList-search-position {
        width: 250px;
        height: 30px;
        float: right;
        position: absolute;
        bottom: 7px;
        right: 20px;
        display: flex;
        font-size: 12px;
    }

    .boardList-search-box {
        width: 250px;
        height: 30px;
        position: relative;
    }

    .boardList-search {
        width: 250px;
        height: 30px;
        border: none;
        border-bottom: 1px solid #ccc;
    }

    .board-search {
        position: absolute;
        top: 50%;
        right: 5px;
        transform: translate(-50%, -50%);
        margin-top: 0 !important;
        cursor: pointer;
    }

    .boardList-card {
        margin-bottom: 15px;
    }

    .boardList-btn-box,
    .boardDetail-btn-box {
        float: right;
    }

    .boardList-page-box {
        position: absolute;
        bottom: -35px;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        justify-content: center;
        align-items: center;
        width: 50%;
    }
    
    .paging-btn {
    	cursor: pointer;
   	}
    
    .boardList-btn {
       	background-color: #660099;
       	border-color: #660099;
       	color: #fff;
    }
    
    .boardList-btn:hover {
       	background-color: #aa00ff;
       	border-color: #aa00ff;
	}
       
	.boardList-page-box i {
		cursor: pointer;
	}
	
	.project-name {
		width: 240px;
	}
	
	.project-title {
		width: 550px;
	}
	
	.project-no {
		text-align: center;
		width: 100px;
	}
	
	tbody td {
		cursor: pointer;
	}

	.board-no-align {
		text-align: center;
	}
	
	.boardList-page-box a {
		width: 30px;
		height: 30px;
		border: 1px solid #ccc;
		margin-right: 5px;
 		text-align: center;
	}
	
	.boardList-page-box a i,
	.boardList-page-box a span {
		line-height: 30px;
	}
	
	.selectedPagingBtn {
		background: #333;
		border-color: #333;
	}
	
	.selectedPagingBtn span {
	color: #fff;
	}
	
	.project-name-color {
		color: blue;
		font-weight: 600;
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

                                <!-- 여기부터 수정 -->
                                <div class="page-wrapper boardList-wrapper">
                                	<!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont icofont icofont-save bg-c-pink"></i>
                                                    <div class="d-inline">
                                                        <h4>자료실</h4>
                                                        <span>진행중인 프로젝트 정보를 공유하는 곳입니다.</span>
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

                                    <div class="card boardList-card">
                                        <div class="card-header card-header-position">
                                            <h5>부서별 자료실</h5>
                                            <div class="boardList-search-position">
                                                <div class="pcoded-search-box boardList-search-box">
                                                    <input type="text" placeholder="Search" class="boardList-search">
                                                    <span class="search-icon board-search"><i class="ti-search" aria-hidden="true"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <table class="table table-hover board-table">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>프로젝트 명</th>
                                                            <th>제목</th>
                                                            <th>작성자</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       <c:if test="${ empty list }">
	                                                    	<c:forEach var="board" items="${ board }">
		                                                        <tr>
		                                                        <c:url var="boardDetail" value="boardDetail.bo">
		                                                        </c:url>
		                                                            <td scope="row" class="board-no-align">${ board.boardNo }</td>
		                                                            <td class="project-name-color">[ ${ board.project } ]</td>
		                                                            <td>${ board.boardTitle }</td>
		                                                            <td>${ board.boardWriter }</td>
		                                                        </tr>
	                                                        </c:forEach>
                                                        </c:if>
                                                        <c:if test="${ !empty list }">
                                                        	<tr>
                                                        		<td colspan="4" class="emptyList">등록된 게시물이 없습니다.</td>
                                                        	</tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="boardList-btn-box">
                                    	<c:url var="boardInsertForm" value="boardInsertForm.bo">
                                        	<c:param name="deptNo" value="${ loginUser.deptNo }"/>
                                        </c:url>
                                        <a href="${ boardInsertForm }"><button type="button" class="btn btn-primary boardList-btn">작성하기</button></a>
                                    </div>

                                    <div class="boardList-page-box">
										<!-- 처음으로 가는 버튼 -->
                                    	<c:if test="${ pi.currentPage <= 1 }">
                                        	<a><i class="ti-angle-double-left paging-btn"></i></a>
                                    	</c:if>
                                    	
                                    	<c:if test="${ pi.currentPage > 1 }">
                                    		<c:url value="boardList.bo" var="firstList">
                                    			<c:param name="page" value="1"/>
                                    		</c:url>
                                        	<a href="${ firstList }"><i class="ti-angle-double-left paging-btn"></i></a>
                                    	</c:if>
                                    	
										<!-- 이전페이지 -->
										<c:if test="${ pi.currentPage <= 1 }">
	                                        <a><i class="ti-angle-left paging-btn"></i></a>
										</c:if>      
										                                  
										<c:if test="${ pi.currentPage > 1 }">
											<c:url value="boardList.bo" var="beforeList">
												<c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
											</c:url>
											<a href="${ beforeList }"><i class="ti-angle-left"></i></a>
    									</c:if>                                    
                                        
                                        <!-- 페이징 -->
                                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                        	<c:if test="${ p eq pi.currentPage }">
                                        		<a class="selectedPagingBtn"><span>${ p }</span></a>
                                        	</c:if>
                                        	
                                        	<c:if test="${ p ne pi.currentPage }">
	                                        	<c:url var="pagination" value="boardList.bo">
	                                        		<c:param name="page" value="${ p }"/>
	                                        	</c:url>
		                                      	<a href="${ pagination }"><span>${ p }</span></a>
	                                      	</c:if>
                                        </c:forEach>
                                      	
                                      	<!-- 다음페이지 -->
                                      	<c:if test="${ pi.currentPage == pi.maxPage }">
	                                        <a><i class="ti-angle-right"></i></a>
                                      	</c:if>
                                      	<c:if test="${ pi.currentPage != pi.maxPage }">
                                      		<c:url value="boardList.bo" var="nextList">
                                      			<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
                                      		</c:url>
                                      		<a href="${ nextList }"><i class="ti-angle-right"></i></a>
                                      	</c:if>
                                      	
										<!-- 끝으로 가는 버튼 -->
										<c:if test="${ pi.currentPage == pi.maxPage }">
                                        	<a><i class="ti-angle-double-right"></i></a>
										</c:if>
										<c:if test="${ pi.currentPage != pi.maxPage }">
											<c:url value="boardList.bo" var="lastList">
												<c:param name="page" value="${ pi.maxPage }"></c:param>
											</c:url>
											<a href="${ lastList }"><i class="ti-angle-double-right"></i></a>
										</c:if>                                        
                                    </div>

                                    
                                    <!-- 여기까지 수정 -->
                                    <div id="styleSelector">

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
            </div>
        </div>
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
<!-- am chart -->
<script src="assets/pages/widget/amchart/amcharts.min.js"></script>
<script src="assets/pages/widget/amchart/serial.min.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="assets/pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="assets/js/script.js"></script>
<script type="text/javascript " src="assets/js/SmoothScroll.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/demo-12.js"></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>
<script>
 	$(function(){
 		$('.board-table').find("td").click(function() {
			var bId = $(this).parents().children("td").eq(0).text(); 			
 			location.href="boardDetail.bo?bId="+bId;
 		});
 	});
</script>
</body>

</html>
