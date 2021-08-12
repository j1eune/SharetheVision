<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>GURU Able - Free Lite Admin Template </title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content="flat ui, admin  Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    
	<jsp:include page="/WEB-INF/views/common/common.jsp"/>

	<style>
		#insertMemberDiv{
			cursor: pointer;
			opacity: 0.8;
		}
	</style>
</head>

<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

           <!-- sideMenu -->
	        <jsp:include page="/WEB-INF/views/common/sideMenu.jsp"/>
	        <!-- topMenu -->
			<jsp:include page="/WEB-INF/views/common/topMenu.jsp"/>
            
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">

                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-7">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont icofont icofont-clip-board bg-c-pink"></i>
                                                    <div class="d-inline">
                                                        <h4>Group Member</h4>
                                                        <span>부서의 직원들을 볼 수 있는 곳입니다</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                    	<!-- 새로고침 -->
                                                    	<c:url var="memberList" value="memberList.me">
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                            <a href="${ memberList }"><i class="icofont icofont-refresh icofont-lg"></i></a>
                                                        </li>
                                                        
                                                        <!-- 근무 중 사원 보기 -->
                                                    	<c:url var="attendanceMember" value="memberList.me">
                                                    		<param name="attendence" value="attendence">
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ attendanceMember }"><i class="icofont icofont-under-construction-alt icofont-lg"></i>&nbsp;근무 중</a>
                                                        </li>
                                                        
                                                        <!-- 휴가 중 사원 보기 -->
                                                    	<c:url var="leaveMember" value="memberList.me">
															<param name="leave" value="leave">                                                    	
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ leaveMember }"><i class="icofont icofont-travelling icofont-lg"></i>&nbsp;휴가 중</a>
                                                        </li>
                                                        
                                                        <!-- [관리자일 경우] 사원 추가 -->
<%--                                                         <c:if test="${loginUser != null }"> --%>
	                                                        <li class="breadcrumb-item">
	                                                        	<div data-toggle="modal" data-target="#exampleModalLong" style="display: inline-block;" id="insertMemberDiv"><i class="icofont icofont-plus icofont-lg"></i>&nbsp;사원 추가</div>
	                                                        </li>
<%--                                                         </c:if> --%>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Page-header end -->

                                    <div class="page-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <table class="table table-hover">
                                                        	<thead>
	                                                        	<tr>
	                                                        		<th style="width:10%; text-align:center;">이름</th>
	                                                        		<th style="width:10%; text-align:center;">직급</th>
	                                                        		<th style="width:20%; text-align:center;">전화번호</th>
	                                                        		<th style="width:40%; text-align:center;">주소</th>
	                                                        		<th style="width:20%; text-align:center;">이메일</th>
	                                                        		<th style="width:10%; text-align:center;">근무상태</th>
	                                                        	</tr>
	                                                        </thead>
	                                                        <tbody>
	                                                        </tbody>
                                                        </table>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                                <!-- 사원추가 modal 창 -->
                                <form action="insertMember.me" method="post">
	                                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									    
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLongTitle">사원 추가</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      
									      <div class="modal-body">
												<div class="form-row">
												    <div class="form-group col-md-4">
												      <label for="inputEmail4">이름</label>
												      <input type="text" class="form-control" id="inputEmail4" placeholder="이름">
												    </div>
												    <div class="form-group col-md-4">
												      <label for="inputPassword4">부서</label>
												      <select class="form-control">
												      	<option>인사</option>
												      	<option>마케팅</option>
												      	<option>생산</option>
												      	<option>영업</option>
												      	<option>회계</option>
												      </select>
												    </div>
												    <div class="form-group col-md-4">
												      <label for="inputPassword4">직책</label>
												      <select class="form-control">
												      	<option>사원</option>
												      	<option>대리</option>
												      	<option>과장</option>
												      	<option>부장</option>
												      </select>
												    </div>
											    </div>
												<div class="form-group">
												    <label for="inputAddress2">아이디</label>
												    <input type="text" class="form-control" id="inputAddress2" placeholder="Id">
												</div>
												<div class="form-group">
												    <label for="inputAddress">전화번호</label>
												    <input type="text" class="form-control" id="inputAddress" placeholder="'-' 을 포함한 전화번호">
												</div>
												<div class="form-row">
												    <div class="form-group col-md-3">
												      <label for="inputCity">주소</label>
												      <input type="text" id="sample6_postcode" name="address1" readonly class="form-control mt-1 adressInput" placeholder="우편번호" onclick="sample6_execDaumPostcode()" required>
												    </div>
												    <div class="form-group col-md-9">
												    	<label for="inputCity">&nbsp;</label>
												    	<input type="text" id="sample6_address" name="address2" class="form-control mt-1" placeholder="주소" required>
												    </div>
												 </div>
												 <div class="form-group">
												    <label for="inputAddress">상세 주소</label>
												    <input type="text" id="sample6_detailAddress" name="address3" class="form-control mt-1" placeholder="상세주소" required>
												    <input type="hidden" id="sample6_extraAddress" class="form-control"placeholder="참고항목">
												</div>
									      </div>
									      
									      <div class="modal-footer">
									        <button type="submit" class="btn btn-danger">사원 추가하기</button>&nbsp;&nbsp;
									        <button type="button" class="btn btn-inverse btn-outline-inverse" data-dismiss="modal">취소</button>
									      </div>
									    </div>
									    
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
	<script>
		// ajax로 리스트 출력
		
		// addMember Modal 창 띄우기
		$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
		
		// 우편주소 넣기
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>

</body>

</html>
