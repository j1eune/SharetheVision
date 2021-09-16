<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>
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
		#checkEmailDiv{
 			display:none; 
		}
		
		#memberTable td{
			text-align: center;
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
                                                    		<c:param name="condition" value="refresh"/>
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                            <a href="${ memberList }"><i class="icofont icofont-refresh icofont-lg"></i></a>
                                                        </li>
                                                        
                                                        <!-- 근무 중 사원 보기 -->
                                                    	<c:url var="attendanceMember" value="memberList.me">
                                                    		<c:param name="condition" value="attendence"/>
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ attendanceMember }"><i class="icofont icofont-under-construction-alt icofont-lg"></i>&nbsp;근무 중</a>
                                                        </li>
                                                        
                                                        <!-- 휴가 중 사원 보기 -->
                                                    	<c:url var="leaveMember" value="memberList.me">
															<c:param name="condition" value="leave"/>                                                    	
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ leaveMember }"><i class="icofont icofont-travelling icofont-lg"></i>&nbsp;휴가 중</a>
                                                        </li>
                                                        <!-- 외근 중 사원보기 -->
                                                    	<c:url var="outsideMember" value="memberList.me">
															<c:param name="condition" value="outside"/>                                                    	
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ outsideMember }"><i class="icofont icofont-runner-alt-1 icofont-lg"></i>&nbsp;외근 중</a>
                                                        </li>
                                                        
                                                        <!-- [관리자일 경우] 사원 추가 -->
                                                        <c:if test="${loginUser.adminNo > 4}">
	                                                        <li class="breadcrumb-item">
	                                                        	<div data-toggle="modal" data-target="#exampleModalLong" style="display: inline-block;" id="insertMemberDiv"><i class="icofont icofont-plus icofont-lg"></i>&nbsp;사원 추가</div>
	                                                        </li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Page-header end -->

                                    <div class="page-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="card"><br>
                                                	<div class="pcoded-search" style="text-align:right;">
											            <span class="searchbar-toggle">  </span>
											            <div class="pcoded-search-box" style="display:inline-block; text-align:right; margin-right:20px;">
											                <input type="text" id="searchMember" size="25" placeholder="이름, 직급 및 부서명으로 검색" value="${search }">
											                <span class="search-icon" id="searchBtn"><i class="ti-search" aria-hidden="true"></i></span>
											            </div>
											        </div>
                                                    <div class="card-header">
                                                        <table class="table" id="memberTable">
                                                        	<thead>
	                                                        	<tr>
	                                                        		<th style="width:10%; text-align:center;">이름</th>
	                                                        		<th style="width:10%; text-align:center;">직급</th>
	                                                        		<th style="width:10%; text-align:center;">부서</th>
	                                                        		<th style="width:20%; text-align:center;">전화번호</th>
	                                                        		<th style="width:40%; text-align:center;">주소</th>
	                                                        		<th style="width:10%; text-align:center;">근무상태</th>
	                                                        	</tr>
	                                                        </thead>
	                                                        <tbody>
	                                                        	<c:if test="${ !empty list}">
		                                                        	<c:forEach var="b" items="${ list }">
		                                                        		<tr>
		                                                        			<td>${ b.name }</td>
		                                                        			<td>${ b.jobName }</td>
		                                                        			<td>${ b.deptName }</td>
		                                                        			<td>${ b.phone }</td>
		                                                        			<td>${ b.address }</td>
		                                                        			<td>
		                                                        				<c:choose>
			                                                        				<c:when test="${ b.mState == 1}">
			                                                        					업무종료
			                                                        				</c:when>
			                                                        				<c:when test="${ b.mState == 2}">
			                                                        					업무 중
			                                                        				</c:when>
			                                                        				<c:when test="${ b.mState == 3}">
			                                                        					외근
			                                                        				</c:when>
			                                                        				<c:when test="${ b.mState == 4}">
			                                                        					휴가
			                                                        				</c:when>
		                                                        				</c:choose>
		                                                        			</td>
		                                                        		</tr>
		                                                        	</c:forEach>
                                                      			</c:if>
                                                      			<c:if test="${ empty list}">
                                                      				<tr>
                                                      					<td colspan="5" style="text-align:center;">등록된 사원이 없습니다.</td>
                                                      				</tr>
                                                      			</c:if>		
	                                                        </tbody>
                                                        </table>
                                                        <br>
                                                        <div style="text-align: center;">
                                                        	<c:if test="${pi != null }">
	                                                        	<c:if test="${pi.currentPage <= 1}">
		                                                        	<span style="display:inline-block;">&lt;</span>&nbsp;
	                                                        	</c:if>
	                                                        	<c:if test="${ pi.currentPage > 1 }">
																	<c:url var="before" value="memberList.me">
																		<c:param name="condition" value="${condition }"/>
																		<c:param name="page" value="${ pi.currentPage - 1 }"/>
																	</c:url>
																	<a href="${ before }">&lt;</a> &nbsp;
																</c:if>
	                                                        	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                                                        		<c:if test="${ pi.currentPage eq p }">
	                                                        			<span style="display:inline-block; border-bottom: 1px solid black;">
	                                                        			<font color="black" size="4"><b>${p }&nbsp;</b></font>
	                                                        			</span>
	                                                        		</c:if>
	                                                        		
	                                                        		<c:if test="${ pi.currentPage ne p }">
																		<c:url var="pageList" value="memberList.me">
																			<c:param name="condition" value="${ condition }"/>
																			<c:param name="page" value="${ p }"/>
																		</c:url>
																		<a href="${ pageList }">${ p }&nbsp;</a>
	                                                        		</c:if>                                                        		
	                                                        	 </c:forEach>
	                                                        	
	                                                        	 <c:if test="${ pi.currentPage >= pi.maxPage }">
		                                                        	&gt;
	                                                        	 </c:if>
	                                                        	 <c:if test="${ pi.currentPage < pi.maxPage }">
																	<c:url var="after" value="memberList.me">
																		<c:param name="condition" value="${condition }"/>
																		<c:param name="page" value="${ pi.currentPage + 1 }"/>
																	</c:url> 
																	<a href="${ after }">&gt;</a>
																 </c:if>
															</c:if>
                                                        </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                                <!-- 사원추가 modal 창 -->
                                <form onsubmit="return insertMember();"action="insertMember.me" method="post">
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
												      <input type="text" class="form-control" name="name" id="inputEmail4" placeholder="이름" required>
												    </div>
												    <div class="form-group col-md-4">
												      <label for="inputPassword4">부서</label>
												      <select class="form-control" name="deptNo" required>
												      	<option>부서</option>
												      	<option value=1>인사</option>
												      	<option value=2>마케팅</option>
												      	<option value=3>생산</option>
												      	<option value=4>영업</option>
												      	<option value=5>회계</option>
												      </select>
												    </div>
												    <div class="form-group col-md-4">
												      <label for="inputPassword4">직책</label>
												      <select class="form-control" name="jobNo" required>
												      	<option>직책</option>
												      	<option value=5>부장</option>
												      	<option value=4>차장</option>
												      	<option value=3>과장</option>
												      	<option value=2>대리</option>
												      	<option value=1>사원</option>
												      </select>
												    </div>
											    </div>
												<div class="form-row">
													<div class="form-group col-md-8">
													    <label for="inputAddress2">아이디</label>
													    <input type="text" class="form-control" name="mId" onkeyup="checkId();" required id="inputId" placeholder="Id">
													</div>
													<div class="form-group col-md-4">
														<label for="inputAddress2"></label><br><br>&nbsp;&nbsp;
													    <div id="checkInputId" style="display:inline-block;"></div>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-8">
													    <label for="inputAddress2">Email</label>
													    <input type="text" class="form-control" name="email" id="inputEmail" placeholder="Email" required>
												    </div>
												    <div class="form-group col-md-4">
												    	<label for="inputCity">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
												    	<button type="button" id="checkEmailButton" class="btn btn-outline-primary">인증번호 전송</button>
												    </div>
												</div>
												<div class="form-row" id="checkEmailDiv">
													<div class="form-group col-md-8">
														<input type="hidden" id="randomInput"/>
													    <input type="text" onblur="checkRandom();" id="checkRandomInput" class="form-control" placeholder="인증번호를 입력하세요">
												    </div>
												    <div class="form-group col-md-12">
												    	<div id="checkCount" style="display:inline-block;"></div>
												    </div>
												</div>
												<div class="form-group">
												    <label for="inputAddress">전화번호</label>
												    <input type="text" class="form-control" name="phone" id="phone" onblur="checkPhone();" placeholder="'-' 을 포함한 전화번호">
												</div>
												<div class="form-row">
												    <div class="form-group col-md-3">
												      <label for="inputCity">주소</label>
												      <input type="text" id="sample6_postcode" name="address1" readonly class="form-control mt-1 adressInput" placeholder="우편번호" onclick="sample6_execDaumPostcode()" required>
												    </div>
												    <div class="form-group col-md-9">
												    	<label for="inputCity">&nbsp;</label>
												    	<input type="text" id="sample6_address" name="address2" readonly class="form-control mt-1" placeholder="주소" required>
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
		
		$("#checkEmailButton").on("click",function(){
			var email = $("#inputEmail").val();
			
			if(email.length == 0){
				alert("이메일을 입력해주세요");
				return;
			}
			
			$.ajax({
				url: 'checkEmail.me',
				data: {email: email},
				success: function(data){
					var random = parseInt(data);

					$("#checkEmailDiv").show();
					$("#randomInput").val(random);
				},
				error: function(data){
					console.log("실패" + data);
				}
			})
		});
		
		emailCheck = false;
		count = 1;
		
		function checkRandom(){
			var check = $("#checkRandomInput").val();
			var random = $("#randomInput").val();
			
			if(count < 6){
				if(check == random){
					console.log("일치함");
					$("#checkCount").text("메일 인증에 성공하였습니다.");
					$("#checkCount").css("color","blue");
					emailCheck = true;
				} else {
					console.log("불일치함");
					alert("인증번호가 일치하지 않습니다.[재시도 가능 횟수](" + count + "/6)");
					$("#checkCount").text("메일 인증에 실패하였습니다.");
					$("#checkCount").css("color","red");
					emailCheck = false;
					count++;
				}
			} else {
				alert("메일인증을 다시 시도해주세요.");
				$("#checkEmailDiv").hide();
			}
			
		}
		
		inputPhone = false;
		
		//전화번호 정규식
		function checkPhone(){
			var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			var phone = document.getElementById("phone").value;
			
			var check = regExp.test(phone);
			if(!check){
				inputPhone = false;
				alert("전화번호 양식을 확인해주세요.");
			} else {
				inputPhone = true;
			}
			
		}
		
		function insertMember(){
			if(emailCheck && inputId && inputPhone){
				return true;
			} else if(!inputId){
				alert("아이디가 중복되었습니다.");
				return false;
			} else if(!emailCheck){
				alert("이메일을 인증 해주세요.");
				return false;
			} else if(!inputPhone){
				alert("전화번호 양식을 확인해주세요.");
				return false;
			}
		}
		
		$("#searchBtn").on("click",function(){
			var search = $("#searchMember").val();
			
			location.href="searchMember.me?search="+search;
			
		});

		inputId = false;
		
		//아이디 중복체크
		function checkId(){
			var mId = $("#inputId").val();
			
			$.ajax({
				url:"checkId.me",
				data:{mId:mId},
				success:function(data){
					if(data.trim() == 'true'){
						inputId = true;
						$("#checkInputId").text('아이디 중복 확인');
						$("#checkInputId").css("color","blue");
					} else {
						inputId = false;
						$("#checkInputId").text('아이디가 중복됩니다.');
						$("#checkInputId").css("color","red");
					}
				},
				error:function(data){
					console.log("아이디 중복체크 실패");
				}
			})
		}
		
		
	</script>

</body>

</html>
