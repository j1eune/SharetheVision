<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>

      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
<!--       Google font -->
<!--       <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet"> -->
<!--       Required Fremwork -->
<!--       <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css"> -->
<!--       themify-icons line icon -->
<!--       <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css"> -->
<!--       ico font -->
<!--       <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css"> -->
<!--       Style.css -->
<!--       <link rel="stylesheet" type="text/css" href="assets/css/style.css"> -->
<!--       <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css"> -->
   	  <jsp:include page="/WEB-INF/views/common/common.jsp"/>
	<jsp:include page="/WEB-INF/views/common/font.jsp"/>
	<script src="https://unpKg.com/sweetalert/dist/sweetalert.min.js"></script>
  
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
        height: 30px;
        float: right;
        position: absolute;
        bottom: 7px;
        right: 20px;
        display: flex;
        flex-direction: row;
        font-size: 12px;
    }

    .boardList-search-box {
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
        right: -10px;
        transform: translate(-50%, -50%);
        margin-top: 0 !important;
        cursor: pointer;
        border: none;
        background: #fff;
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
	
	.searchOption {
		width: 90px;
		height: 30px;
		margin-right: 10px;
		padding-left: 5px;
		font-size: 12px;
		border-color: #ccc;
		color: #444;
		border-radius: 2px;
	}
	
	.project-name {
		width: 240px;
	}
	
	.project-title {
		width: 525px;
	}
	
	.project-writer {
		width: 140px;
	}
	
	.project-state {
		width: 150px;
		text-align: center;
	}
	
	.project-ongoing {
		color: blue;
	}
	
	.project-end {
		color: #888;
	}
	
	.project-ongoing,
	.project-end {
		text-align: center;
		font-weight: bold;
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
	
	.emptyList {
		text-align: center;
		pointer-events: none;
		color: #666;
		height: 60px;
		line-height: 60px;	
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
                                            <h5 style="margin-left: 10px;">${ boardListTitle }</h5>
                                            <div class="boardList-search-position">
                                                <div class="pcoded-search-box boardList-search-box">
	                                                <form action="boardSearch.bo" method="post">
	                                                	<c:if test="${ category != null }">
		                                                	<select class="searchOption" name="category">
		                                                		<c:if test="${ category == 'title' }">
			                                                		<option value="title" selected>제목</option>
			                                                		<option value="project">프로젝트</option>
			                                                		<option value="writer">작성자</option>
		                                                		</c:if>
		                                                		<c:if test="${ category == 'project' }">
			                                                		<option value="title">제목</option>
			                                                		<option value="project" selected>프로젝트</option>
			                                                		<option value="writer">작성자</option>
		                                                		</c:if>
																<c:if test="${ category == 'writer' }">
			                                                		<option value="title">제목</option>
			                                                		<option value="project">프로젝트</option>
			                                                		<option value="writer" selected>작성자</option>
																</c:if>
		                                                	</select>
	                                                	</c:if>
	                                                	<c:if test="${ category == null }">
		                                                	<select class="searchOption" name="category">
		                                                		<option value="title">제목</option>
		                                                		<option value="project">프로젝트</option>
		                                                		<option value="writer">작성자</option>
		                                                	</select>
	                                                	</c:if>
	                                                	<c:if test="${ word != null }">
		                                                    <input type="text" placeholder="Search" name="word" class="boardList-search" value="${ word }">
	                                                	</c:if>
	                                                	<c:if test="${ word == null }">
		                                                    <input type="text" placeholder="Search" name="word" class="boardList-search">
	                                                	</c:if>
	                                                    <button class="search-icon board-search"><i class="ti-search" aria-hidden="true"></i></span></button>
	                                                </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <table class="table table-hover board-table">
                                                    <thead>
                                                        <tr>
                                                            <th class="project-no"></th>
                                                            <th class="project-name">프로젝트 명</th>
                                                            <th class="project-title">제목</th>
                                                            <th class="project-writer">작성자</th>
                                                            <th class="project-state">상태</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       <c:if test="${ !empty board }">
	                                                    	<c:forEach var="board" items="${ board }">
		                                                        <tr>
		                                                        <c:url var="boardDetail" value="boardDetail.bo">
		                                                        </c:url>
		                                                            <td scope="row" class="board-no-align">${ board.boardNo }</td>
		                                                            <td class="project-name-color">[ ${ board.project } ]</td>
		                                                            <td>${ board.boardTitle }</td>
		                                                            <td>${ board.boardWriter }</td>
		                                                            <c:if test="${ board.boardState == 1 }">
			                                                            <td class="project-ongoing">진행중</td>
		                                                            </c:if>
		                                                            <c:if test="${ board.boardState == 2 }">
			                                                            <td class="project-end">종료</td>
		                                                            </c:if>
		                                                        </tr>
	                                                        </c:forEach>
                                                        </c:if>
                                                        <c:if test="${ empty board }">
                                                        	<tr>
                                                        		<td colspan="4" class="emptyList">등록된 게시물이 없습니다.</td>
                                                        	</tr>
                                                        </c:if>
<%-- 														<c:forEach var="board" items="${ board }"> --%>
<!-- 															<tr> -->
<%-- 																<c:if test="${ !empty board }"> --%>
<%-- 																	<c:url var="boardDetail" value="boardDetail.bo"> --%>
<%-- 			                                                        </c:url> --%>
<%-- 																	<td scope="row" class="board-no-align">${ board.boardNo }</td> --%>
<%-- 		                                                            <td class="project-name-color">[ ${ board.project } ]</td> --%>
<%-- 		                                                            <td>${ board.boardTitle }</td> --%>
<%-- 		                                                            <td>${ board.boardWriter }</td> --%>
<%-- 		                                                        </c:if> --%>
<!-- 															</tr> -->
<%-- 														</c:forEach> --%>
<%--                                                         <c:if test="${ empty board }"> --%>
<!--                                                         	<td colspan="4" class="emptyList">등록된 게시물이 없습니다.</td> -->
<%--                                                         </c:if> --%>
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
                                    		<c:if test="${ currentList == 'boardList' }">
	                                    		<c:url value="boardList.bo" var="firstList">
	                                    			<c:param name="page" value="1"/>
	                                    		</c:url>
                                    		</c:if>
                                    		<c:if test="${ currentList == 'scrapList' }">
	                                    		<c:url value="boardScrapList.bo" var="firstList">
	                                    			<c:param name="page" value="1"/>
	                                    		</c:url>
                                    		</c:if>
                                        	<a href="${ firstList }"><i class="ti-angle-double-left paging-btn"></i></a>
                                    	</c:if>
                                    	
										<!-- 이전페이지 -->
										<c:if test="${ pi.currentPage <= 1 }">
	                                        <a><i class="ti-angle-left paging-btn"></i></a>
										</c:if>      
										                                  
										<c:if test="${ pi.currentPage > 1 }">
											<c:if test="${ currentList == 'boardList' }">
												<c:url value="boardList.bo" var="beforeList">
													<c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
												</c:url>
											</c:if>
											<c:if test="${ currentList == 'scrapList' }">
												<c:url value="boardScrapList.bo" var="beforeList">
													<c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
												</c:url>
											</c:if>
											<a href="${ beforeList }"><i class="ti-angle-left"></i></a>
    									</c:if>                                    
                                        
                                        <!-- 페이징 -->
                                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                        	<c:if test="${ p eq pi.currentPage }">
                                        		<a class="selectedPagingBtn"><span>${ p }</span></a>
                                        	</c:if>
                                        	
                                        	<c:if test="${ p ne pi.currentPage }">
                                        		<c:if test="${ currentList == 'boardList' }">
		                                        	<c:url var="pagination" value="boardList.bo">
		                                        		<c:param name="page" value="${ p }"/>
		                                        	</c:url>
                                        		</c:if>
                                        		<c:if test="${ currentList == 'scrapList' }">
		                                        	<c:url var="pagination" value="boardScrapList.bo">
		                                        		<c:param name="page" value="${ p }"/>
		                                        	</c:url>
                                        		</c:if>
		                                      	<a href="${ pagination }"><span>${ p }</span></a>
	                                      	</c:if>
                                        </c:forEach>
                                      	
                                      	<!-- 다음페이지 -->
                                      	<c:if test="${ pi.currentPage == pi.maxPage }">
	                                        <a><i class="ti-angle-right"></i></a>
                                      	</c:if>
                                      	<c:if test="${ pi.currentPage != pi.maxPage }">
                                      		<c:if test="${ currentList == 'boardList' }">
	                                      		<c:url value="boardList.bo" var="nextList">
	                                      			<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
	                                      		</c:url>
                                      		</c:if>
                                      		<c:if test="${ currentList == 'ScrapList' }">
	                                      		<c:url value="boardScrapList.bo" var="nextList">
	                                      			<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
	                                      		</c:url>
                                      		</c:if>
                                      		<a href="${ nextList }"><i class="ti-angle-right"></i></a>
                                      	</c:if>
                                      	
										<!-- 끝으로 가는 버튼 -->
										<c:if test="${ pi.currentPage == pi.maxPage }">
                                        	<a><i class="ti-angle-double-right"></i></a>
										</c:if>
										<c:if test="${ pi.currentPage != pi.maxPage }">
											<c:if test="${ currentList == 'boardList' }">
												<c:url value="boardList.bo" var="lastList">
													<c:param name="page" value="${ pi.maxPage }"></c:param>
												</c:url>
											</c:if>
											<c:if test="${ currentList == 'scrapList' }">
												<c:url value="boardScrapList.bo" var="lastList">
													<c:param name="page" value="${ pi.maxPage }"></c:param>
												</c:url>
											</c:if>
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
            </div>
        </div>
	</div>

<!-- <!-- Warning Section Ends --> -->
<!-- <!-- Required Jquery --> -->
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
			var currentList = "${ currentList }";
			
			$.ajax({
	 			url: 'boardStatus.bo',
	 			data: {bId: bId, current: 'list'},
	 			success: function(data) {
	 				var data1 = $.trim(data);
	 				if (data1 == '삭제') {
	 					swal({
	 						title: "잠깐!",
	 						text: "삭제된 게시글입니다. 스크랩 목록에서 삭제됩니다.",
	 						icon: "error",
	 						dangerMode: true,
	 					})
	 					.then((willDelete) => {
	 						if (willDelete) {
								location.href="alertDeleteScrap.bo?bId="+bId+"&current=boardScrapList";
	 						}
	 					})
	 				} else if (data1 == '존재') {
						location.href="boardDetail.bo?bId="+bId+"&currentPage="+${ currentPage }+"&currentList="+currentList;
	 				}
	 			}
	 		})
	 		
 		});
 	});
</script>
</body>

</html>
