<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SV Company</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<link href="resources/assets/css/datePicker/datePicker.css" rel="stylesheet" type="text/css">
<style>
	.listTable>thead>tr>th, .listTable>tbody>tr>td, .listTable>tbody>tr>th, .listTable>tbody>tr>td>div {
		text-align: center;
	}
       
	#leaveTime input[type="radio"]{
		visibility: hidden;
		height: 0;
		width: 0;
	}
	
	#leaveTime label {
		vertical-align: middle;
		text-align: center;
		cursor: pointer;
		background-color: white;
		color: #FFB64D;;
		border: 1px solid #FFB64D;;
		padding: 5px 10px;
		border-radius: 3px;
	}
	
	#leaveTime input[type="radio"]:checked + label{
		background-color: #FFB64D;
		color: white;
	}
	
	#usedTd input[type="radio"] {
    	visibility: hidden;
		height: 0;
		width: 0;
    }
    
	#usedTd label {
		vertical-align: middle;
		text-align: center;
		cursor: pointer;
		background-color: white;
		color: #FFC107;;
 		border: 1.2px solid #FFC107; 
		padding-left: 3px;
		padding-right: 3px;
		border-radius: 3px;
	}
	
	#usedTd input[type="radio"]:checked + label{
		background-color: #FFC107;
		color: white;
	}
	
	#title h5{
		font-family: 'Recipekorea';
	}
	
	#title h3 {
		font-family: 'SpoqaHanSansNeo-Regular';
		color: #660099;
	}
	
	/* 전사휴가설정 */
/* 	#settingText { */
/* 		display: inline-block; */
/* 		vertical-align: middle; */
		/* 		font-size: 1.2rem; */
/* 		cursor: pointer; */
	}
	
/* 	.icofont-gear { */
/* 		display: inline-block; */
/* 		vertical-align: middle; */
		/* 		font-size: 1.2rem; */
/* 	} */
	
</style>
<jsp:include page="../common/common.jsp" />
<jsp:include page="../common/font.jsp" />
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
		                        <div class="page-header card">
		                            <div class="text-center">
		                                <div class="page-header-title m-b-20">
		                                    <h2 id="currentMonth"></h2>
		                                </div>
		                                <div class="">
		                                    <div class="card-block" id="title">
		                                        <div class="row">
		                                            <div class="col-lg my-auto">
		                                                <h5>${name} ${jobName}</h5>
						                            </div>
		                                            <div class="col-lg b-r-default b-l-default">
		                                                <h5 class="m-b-20">발생 연차</h5>
		                                                <h3>${annualTotal}</h3>
		                                            </div>
		                                            <div class="col-lg b-r-default">
		                                                <h5 class="m-b-20">조정 연차</h5>
		                                                <h3>${adjustTotal}</h3>
		                                            </div>
		                                            <div class="col-lg b-r-default">
		                                                <h5 class="m-b-20">총 연차</h5>
		                                                <c:set var="total" value="${annualTotal + adjustTotal}"/>
		                                                <h3>${total}</h3>
		                                            </div>
		                                            <div class="col-lg b-r-default">
		                                                <h5 class="m-b-20">사용 연차</h5>
		                                                <h3>${usedTotal}</h3>
		                                            </div>
		                                            <div class="col-lg">
		                                                <h5 class="m-b-20">잔여 연차</h5>
		                                                <c:set var="remain" value="${annualTotal + adjustTotal - usedTotal}"/>
		                                                <h3>${remain}</h3>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- Page-header end -->
		                        <!-- Page-body start -->
		                        <div class="page-body">
		                            <div class="card">
		                                <div class="card-header">
		                                    <h3>신청 내역</h3>
		                                    <!-- <span>use class <code>table</code> inside table element</span> -->
		                                    <div class="card-header-right">
		                                        <ul class="list-unstyled card-option">
		                                            <li><i class="icofont icofont-simple-left"></i></li>
		                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                            <li><i class="icofont icofont-ui-edit leave-card"></i></li>
		                                            <!-- <li><i class="icofont icofont-error close-card"></i></li> -->
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="card-block table-border-style">
		                                    <div class="table-responsive">
		                                        <table class="table listTable">
		                                            <thead>
		                                                <tr>
		                                                    <th>신청일</th>
		                                                    <th>휴가구분</th>
		                                                    <th>연차 사용기간</th>
		                                                    <th>사용연차</th>
		                                                    <th>결제상태</th>
		                                                    <th>사용상태</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                            <c:forEach var="r" items="${leaveList}" varStatus="vs">
		                                            	<input type="hidden" value="${r.leaveUsedNo}">
		                                            	<tr>
		                                            		<td>${r.createDate}</td>
		                                            		<td>
		                                            			<c:choose>	
																	<c:when test="${r.type == 1}">
																		연차
																	</c:when>
																	<c:when test="${r.type == 2}">
																		반차
																	</c:when>
																	<c:when test="${r.type == 3}">
																		경조사
																	</c:when>
																	<c:when test="${r.type == 4}">
																		공가
																	</c:when>
																	<c:when test="${r.type == 5}">
																		병가
																	</c:when>
																	<c:when test="${r.type == 6}">
																		특별휴가
																	</c:when>
																	<c:when test="${r.type == 7}">
																		오전반차
																	</c:when>
																	<c:when test="${r.type == 8}">
																		오후반차
																	</c:when>
		                                            			</c:choose>
		                                            		</td>
		                                            		<td>${r.startDate} ~ ${r.endDate}</td>
		                                            		<td>${r.days}</td>
		                                            		<td>
		                                            			<c:choose>	
																	<c:when test="${r.approval == 'Y'}">
																		<div style="background-color:rgba(13, 110, 253, 0.1); color:#0D6EFD; border-radius: 10px; width:40px; display: inline-block">승인</div>
																	</c:when>
																	<c:when test="${r.approval == 'N'}">
																		<div style="background-color:rgba(226, 54, 54, 0.1); color:#E23636; border-radius: 10px; width:40px; display: inline-block">반려</div>
																	</c:when>
																	<c:when test="${r.approval == 'W'}">
																		<div style="background-color:rgba(0, 177, 89, 0.1); color:#00b159; border-radius: 10px; width:40px; display: inline-block">대기</div>
																	</c:when>
		                                            			</c:choose>
		                                            		</td>
		                                            		<td id="usedTd">
																<input type="radio" name="usedRadio" id="noUsed${vs.count}" value="N"/>
									                            <label for="noUsed${vs.count}" <c:if test="${r.status == 'N'}">style="background-color: #FFC107; color: white"</c:if>>미사용</label>
									                            <input type="radio" name="usedRadio" id="used${vs.count}" value="Y"/>
									                            <label for="used${vs.count}" <c:if test="${r.status == 'Y'}">style="background-color: #FFC107; color: white"</c:if>>사용완료</label>
		                                            		</td>
		                                            	</tr>
		                                            </c:forEach>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="card">
		                                <div class="card-header">
		                                    <h3>사용 내역</h3>
		                                    <!-- <span>use class <code>table</code> inside table element</span> -->
		                                    <div class="card-header-right">
		                                        <ul class="list-unstyled card-option">
		                                            <li><i class="icofont icofont-simple-left "></i></li>
		                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                            <li><i class="icofont icofont-ui-edit leave-card"></i></li>
		                                            <!-- <li><i class="icofont icofont-error close-card"></i></li> -->
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="card-block table-border-style">
		                                    <div class="table-responsive">
		                                        <table class="table listTable">
		                                            <thead>
		                                                <tr>
		                                                    <th>이름</th>
		                                                    <th>부서명</th>
		                                                    <th>휴가구분</th>
		                                                    <th>사용연차</th>
		                                                    <th>연차 사용기간</th>
		                                                    <th>내용</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                            <c:forEach var="r" items="${leaveList}">
		                                            	<c:if test="${r.status == 'Y'}">
		                                            	<tr>
		                                            		<td>${name}</td>
		                                            		<td>${deptName}</td>
		                                            		<td>
		                                            			<c:choose>
																	<c:when test="${r.type == 1}">
																		연차
																	</c:when>
																	<c:when test="${r.type == 2}">
																		반차
																	</c:when>
																	<c:when test="${r.type == 3}">
																		경조사
																	</c:when>
																	<c:when test="${r.type == 4}">
																		공가
																	</c:when>
																	<c:when test="${r.type == 5}">
																		병가
																	</c:when>
																	<c:when test="${r.type == 6}">
																		특별휴가
																	</c:when>
																	<c:when test="${r.type == 7}">
																		오전반차
																	</c:when>
																	<c:when test="${r.type == 8}">
																		오후반차
																	</c:when>
		                                            			</c:choose>
		                                            		</td>
		                                            		<td>${r.days}</td>
		                                            		<td>${r.startDate} ~ ${r.endDate}</td>
		                                            		<td>${r.content}</td>
		                                            	</tr>
		                                            	</c:if>
		                                            </c:forEach>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="card">
		                                <div class="card-header">
		                                    <h3>생성 내역</h3>
		                                    <!-- <span>use class <code>table</code> inside table element</span> -->
		                                    <div class="card-header-right">
		                                        <ul class="list-unstyled card-option">
		                                            <li><i class="icofont icofont-simple-left "></i></li>
		                                            <li><i class="icofont icofont-maximize full-card"></i></li>
		                                            <li><i class="icofont icofont-minus minimize-card"></i></li>
		                                            <li><i class="icofont icofont-refresh reload-card"></i></li>
		                                            <!-- [관리자일 경우] 연차 설정 가능 -->
<%-- 													<c:if test="${loginUser.adminNo > 4}"> --%>
		                                            <li><i class="icofont icofont-ui-edit" id="setting"></i></li>
<%-- 													</c:if> --%>
<!-- 		                                            <li><i class="icofont icofont-error close-card"></i></li> -->
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="card-block table-border-style">
		                                    <div class="table-responsive">
		                                        <table class="table listTable">
		                                            <thead>
		                                                <tr>
		                                                    <th>등록일</th>
		                                                    <th>연차구분</th>
		                                                    <th>사용기간</th>
		                                                    <th>발생일수</th>
		                                                    <th>내용</th>
		                                                </tr>
		                                            </thead>
		                                            <tbody>
		                                                <c:forEach var="r" items="${annualList}">
		                                                	<tr>
		                                                		<td>${r.createDate}</td>
		                                                		<c:if test="${r.type == 0}">
		                                                			<td>생성연차</td>
		                                                		</c:if>
		                                                		<c:if test="${r.type == 1}">
		                                                			<td>조정연차</td>
		                                                		</c:if>
		                                                		<c:if test="${r.type == 2}">
		                                                			<td>1년미만 연차</td>
		                                                		</c:if>
		                                                		<td>${r.startDate} ~ ${r.endDate}</td>
		                                                		<td>${r.total}</td>
		                                                		<td>${r.content}</td>
		                                                	</tr>
		                                                </c:forEach>
		                                            </tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- 휴가 신청 모달 -->
		                        <div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true">
		                        	<%@include file="leaveModal.jsp" %>
		                    	</div>
		                    	<!-- 연차설정 모달 -->
                            	<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="settingModalLabel" aria-hidden="true">
                            		<%@include file="leaveSettingModal.jsp" %>
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
	    $window.scroll(function(){
	        if ($window.scrollTop() >= 200) {
	        nav.addClass('active');
	    }
	    else {
	        nav.removeClass('active');
	    }
	});
	
	$(function(){
	     var today = new Date();
	        
	     var year = today.getFullYear().toString();
	     
	     var month = today.getMonth() + 1;
	     month = month < 10 ? '0' + month.toString() : month.toString();
     
		$('#currentMonth').html(year + "." + month).css({'font-family':'SpoqaHanSansNeo-Bold'});
	});
	
	// 휴가 신청
	$('.leave-card').on('click', function(){
	    $('#leaveModal').modal('show');
	});
	
	// 휴가 기간 선택
	$('.datepicker').datepicker();
	
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	
	// 반차 선택시 오전 오후
	$('#half').css('display', 'none');
	
	$('#leaveType').on('click', function(){
	    var half = $("#leaveType option:selected").val();
	    if(half == '2'){
	        $('#half').show();
	    } else {
	        $('#half').hide();
	    }
	});
	
	// 휴가 미사용 사용완료
	$('input[name=usedRadio]').on('click', function(){
		var status = $(this).val();
		var no = $(this).parents('tr').prev().val();
		
		location.href="changeStatus.le?status="+status+"&no="+no;
	});
	
	// 연차 초기 설정
	$('#setting').on('click', function(){
		var adminNo = <c:out value="${loginUser.adminNo}"/>;
		if(adminNo > 4){
			$('#settingModal').modal('show');
		} else {
			alert('부장 직급 이상만 설정 가능합니다. 부장님께 문의하세요.');
		}
	});
	
</script>
	
	<!-- test Chart -->
	<script src="resources/assets/pages/chart/morris/morris-custom-chart.js"></script>
</body>
</html>