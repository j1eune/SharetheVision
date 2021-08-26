<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<link href="resources/assets/css/datePicker/datePicker.css" rel="stylesheet" type="text/css">
<style>
	.listTable>thead>tr>th, .listTable>tbody>tr>td, .listTable>tbody>tr>th {
		text-align: center
	}
	
	#settingText {
		display: inline-block;
		vertical-align: middle;
		/* 		font-size: 1.2rem; */
		cursor: pointer;
	}
	
	.icofont-gear {
		display: inline-block;
		vertical-align: middle;
		/* 		font-size: 1.2rem; */
	}
	
	.filebox label{
		display: inline-block;
		padding: .5em .75em;
/* 		color: #999; */
		color: #FFB64D;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: white;
		cursor: pointer;
		border: 1px solid #FFB64D;
		/* 	border: 1px solid #ebebeb; */
		/* 	border-bottom-color: #e2e2e2; */
		border-radius: .25em;
	}
	
	.filebox input[type="file"] { /* 파일 필드 숨기기 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	
	#downloadLabel a{
		text-decoration: none;
		color: #FFB64D;
	}
</style>
<jsp:include page="../common/common.jsp" />
</head>
<body>
<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring">
                <div class="frame"></div>
            </div>
        </div>
    </div>
</div> 
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
	<div class="pcoded-container navbar-wrapper">    
		
		<!--  topMenu  -->
	    <jsp:include page="../common/topMenu.jsp" />           
	    <!--  sideMenu    -->        
	    <jsp:include page="../common/sideMenu.jsp" />
	
		<!-- main start -->
		<div class="pcoded-main-container">
		    <div class="pcoded-wrapper">
		        <div class="pcoded-content">
		            <div class="pcoded-inner-content">
		                <div class="main-body">
		                    <div class="page-wrapper">
		                        <!-- Page-header start -->
<!-- 		                        <div class="page-header card"> -->
<!-- 		                        </div> -->
		                        <!-- Page-header end -->
	                        	<!-- Page-body start -->
								<div class="page-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="card">
												<div class="card-header">
													<div class="text-center">
						                                <label id="prev"><i class="icofont icofont-rounded-left icofont-2x"></i></label>
						                                &nbsp;
						                                <div class="page-header-title m-b-20">
						                                    <h2 id="currentMonth"></h2>
						                                </div>
						                                &nbsp;
						                                <label id="next"><i class="icofont icofont-rounded-right icofont-2x"></i></label>
						                            </div>
						                            <div>
						                            	<div class="icofont icofont-gear"></div>
						                            	<div id="settingText">전사 연차 초기 설정</div>
						                            </div>
<!-- 			                                            <button type="button" id="setting">연차초기설정</button> -->
<!-- 						                            <div> -->
<!-- 														<h5>전사휴가현황</h5> -->
<!-- 						                            </div> -->
												</div>
												<div class="card-block">
													<p>"Lorem ipsum dolor sit amet, consectetur adipiscing
														elit, sed do eiusmod tempor incididunt ut labore et
														dolore magna aliqua. Ut enim ad minim veniam, quis
														nostrud exercitation ullamco laboris nisi ut aliquip ex
														ea commodo consequat. Duis aute irure dolor in
														reprehenderit in voluptate velit esse cillum dolore eu
														fugiat nulla pariatur. Excepteur sint occaecat cupidatat
														non proident, sunt in culpa qui officia deserunt mollit
														anim id est laborum."</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="settingModalLabel" aria-hidden="true">
		                    		 <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title mx-auto" id="settingModalLabel">연차 설정</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                	<span aria-hidden="true">&times;</span>
								                </button>
								            </div>
								            <div class="modal-body mx-4">
												<form action="leaveSetting.le" method="post" enctype="Multipart/form-data">
													<div class="form-group row">
														<label for="uploadFile" class="col-sm-6 col-form-label">초기 설정 파일 등록</label>
														<div class="col-sm-6 filebox">
															<label for="uploadFile">
																<i class="icofont icofont-upload-alt"></i>
																<span>업로드</span>
															</label>
									            			<input type="file" name="uploadFile" id="uploadFile">
														</div>
													</div>
													<div class="form-group row">
														<label for="download" class="col-sm-6 col-form-label">샘플 양식 다운로드</label>
														<div class="col-sm-6 filebox">
															<label for="download" id="downloadLabel" >
																<i class="icofont icofont-download-alt"></i>
																<a href="<c:url value="/resources/leaveSetting/sample/sample.xlsx"/>">다운로드</a>
															</label>
														</div>
													</div>
													<div class="form-group row mt-3">
														<div class="col-sm-12">
															<div class="mb-3">
																<i class="icofont icofont-info-circle"></i>
																<span>CSV파일 등록 시 주의 사항</span><br>
															</div>
															<span> - 사원ID : 각 사원의 사원 아이디를 입력</span><br>
															<span> - 입사일 : yyyy-mm-dd 형식으로 입사일을 입력</span><br>
															<span> - 총 연차 개수 : 현재까지 생성된 연차 개수를 입력</span><br>
															<span> - 사용 연차 개수 : 생성된 연차 개수 중 사용한 연차 개수를 입력</span>
															<div class="mt-2">
																<i class="icofont icofont-mega-phone"></i>
																엑셀 파일을 꼭 CSV(쉼표로 분리) 형식으로 저장 후 업로드 해주세요
															</div>
														</div>
													</div>
													<div class="form-group row float-right mt-3">
														<div class="col-sm-10">
															<button type="submit" class="btn btn-sm" style="background-color : #FFB64D; color: white">제출하기</button>
														</div>
													</div>
												</form>
											</div>
										</div>
								    </div>
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
	var $window = $(window);
	var nav = $('.fixed-button');
	$window.scroll(function() {
		if ($window.scrollTop() >= 200) {
			nav.addClass('active');
		} else {
			nav.removeClass('active');
		}
	});

	$(function() {
		var today = new Date();

		var year = today.getFullYear().toString();

		var month = today.getMonth() + 1;
		month = month < 10 ? '0' + month.toString() : month.toString();

		$('#currentMonth').html(year + "." + month);
	});

	// 연차 초기 설정
	$('#settingText').on('click', function(){
		$('#settingModal').modal('show');
	});
	
</script>
	
	<!-- test Chart -->
	<script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script>
</body>
</html>