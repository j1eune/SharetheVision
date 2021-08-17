<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Welcome SV Company!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
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

.project-name {
	color: blue;
	font-weight: 600;
	width: 240px;
}

.project-title {
	width: 550px;
}

.project-no {
	text-align: center;
	width: 100px;
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

                                    <!-- 여기부터 작성 -->
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>프로젝트 자료실</h5>
                                            <div class="card-header-right more-btn-box">
                                            	<a href="boardList.bo">
	                                                <span class="more-btn">더보기<i class="ti-angle-double-right"></i></span>
                                            	</a>
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
                                                        <tr>
                                                        <c:url var="boardDetail" value="boardDetail.bo">
                                                        	<%-- <c:param name="boardId" value="${ b.boardId }"/> --%>
                                                        </c:url>
                                                            <td scope="row" class="project-no">1</td>
                                                            <td class="project-name">[ SharetheVision ]</td>
                                                            <td class="project-title">SV 프로젝트 자료1</td>
                                                            <td>장원형</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="project-no">2</td>
                                                            <td class="project-name">[ PROJECT ]</td>
                                                            <td class="project-title">프로젝트</td>
                                                            <td>스폰지밥</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="project-no">3</td>
                                                            <td class="project-name">[ 어떤가요 ]</td>
                                                            <td class="project-title">알ㄹ라랄</td>
                                                            <td>룰룰룰루루</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                       <div class="card">
                                           <div class="card-header">
                                               <h5>스크랩한 게시물</h5>
                                               <div class="card-header-right">
                                           	<a href="boardList.bo">
                                                <span class="more-btn">더보기<i class="ti-angle-double-right"></i></span>
                                           	</a>
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
                                                        <tr>
                                                        <c:url var="boardDetail" value="boardDetail.bo">
                                                        	<%-- <c:param name="boardId" value="${ b.boardId }"/> --%>
                                                        </c:url>
                                                            <td scope="row" class="project-no">1</td>
                                                            <td class="project-name">[ SharetheVision ]</td>
                                                            <td class="project-title">SV 프로젝트 자료1</td>
                                                            <td>장원형</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="project-no">2</td>
                                                            <td class="project-name">[ PROJECT ]</td>
                                                            <td class="project-title">프로젝트</td>
                                                            <td>스폰지밥</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="project-no">3</td>
                                                            <td class="project-name">[ 어떤가요 ]</td>
                                                            <td class="project-title">알ㄹ라랄</td>
                                                            <td>룰룰룰루루</td>
                                                        </tr>
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
                <div class="fixed-button">
                    <a href="https://codedthemes.com/item/guru-able-admin-template/" target="_blank" class="btn btn-md btn-primary">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
                    </a>
                </div>
            </div>
        </div>
     </div>
        
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