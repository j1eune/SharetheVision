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
                                                        <span>????????? ???????????? ??? ??? ?????? ????????????</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                    	<!-- ???????????? -->
                                                    	<c:url var="memberList" value="memberList.me">
                                                    		<c:param name="condition" value="refresh"/>
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                            <a href="${ memberList }"><i class="icofont icofont-refresh icofont-lg"></i></a>
                                                        </li>
                                                        
                                                        <!-- ?????? ??? ?????? ?????? -->
                                                    	<c:url var="attendanceMember" value="memberList.me">
                                                    		<c:param name="condition" value="attendence"/>
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ attendanceMember }"><i class="icofont icofont-under-construction-alt icofont-lg"></i>&nbsp;?????? ???</a>
                                                        </li>
                                                        
                                                        <!-- ?????? ??? ?????? ?????? -->
                                                    	<c:url var="leaveMember" value="memberList.me">
															<c:param name="condition" value="leave"/>                                                    	
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ leaveMember }"><i class="icofont icofont-travelling icofont-lg"></i>&nbsp;?????? ???</a>
                                                        </li>
                                                        <!-- ?????? ??? ???????????? -->
                                                    	<c:url var="outsideMember" value="memberList.me">
															<c:param name="condition" value="outside"/>                                                    	
                                                    	</c:url>
                                                        <li class="breadcrumb-item">
                                                        	<a href="${ outsideMember }"><i class="icofont icofont-runner-alt-1 icofont-lg"></i>&nbsp;?????? ???</a>
                                                        </li>
                                                        
                                                        <!-- [???????????? ??????] ?????? ?????? -->
                                                        <c:if test="${loginUser.adminNo > 4}">
	                                                        <li class="breadcrumb-item">
	                                                        	<div data-toggle="modal" data-target="#exampleModalLong" style="display: inline-block;" id="insertMemberDiv"><i class="icofont icofont-plus icofont-lg"></i>&nbsp;?????? ??????</div>
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
											                <input type="text" id="searchMember" size="25" placeholder="??????, ?????? ??? ??????????????? ??????" value="${search }">
											                <span class="search-icon" id="searchBtn"><i class="ti-search" aria-hidden="true"></i></span>
											            </div>
											        </div>
                                                    <div class="card-header">
                                                        <table class="table" id="memberTable">
                                                        	<thead>
	                                                        	<tr>
	                                                        		<th style="width:10%; text-align:center;">??????</th>
	                                                        		<th style="width:10%; text-align:center;">??????</th>
	                                                        		<th style="width:10%; text-align:center;">??????</th>
	                                                        		<th style="width:20%; text-align:center;">????????????</th>
	                                                        		<th style="width:40%; text-align:center;">??????</th>
	                                                        		<th style="width:10%; text-align:center;">????????????</th>
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
			                                                        					????????????
			                                                        				</c:when>
			                                                        				<c:when test="${ b.mState == 2}">
			                                                        					?????? ???
			                                                        				</c:when>
			                                                        				<c:when test="${ b.mState == 3}">
			                                                        					??????
			                                                        				</c:when>
			                                                        				<c:when test="${ b.mState == 4}">
			                                                        					??????
			                                                        				</c:when>
		                                                        				</c:choose>
		                                                        			</td>
		                                                        		</tr>
		                                                        	</c:forEach>
                                                      			</c:if>
                                                      			<c:if test="${ empty list}">
                                                      				<tr>
                                                      					<td colspan="5" style="text-align:center;">????????? ????????? ????????????.</td>
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
                                <!-- ???????????? modal ??? -->
                                <form onsubmit="return insertMember();"action="insertMember.me" method="post">
	                                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									    
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLongTitle">?????? ??????</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      
									      <div class="modal-body">
												<div class="form-row">
												    <div class="form-group col-md-4">
												      <label for="inputEmail4">??????</label>
												      <input type="text" class="form-control" name="name" id="inputEmail4" placeholder="??????" required>
												    </div>
												    <div class="form-group col-md-4">
												      <label for="inputPassword4">??????</label>
												      <select class="form-control" name="deptNo" required>
												      	<option>??????</option>
												      	<option value=1>??????</option>
												      	<option value=2>?????????</option>
												      	<option value=3>??????</option>
												      	<option value=4>??????</option>
												      	<option value=5>??????</option>
												      </select>
												    </div>
												    <div class="form-group col-md-4">
												      <label for="inputPassword4">??????</label>
												      <select class="form-control" name="jobNo" required>
												      	<option>??????</option>
												      	<option value=5>??????</option>
												      	<option value=4>??????</option>
												      	<option value=3>??????</option>
												      	<option value=2>??????</option>
												      	<option value=1>??????</option>
												      </select>
												    </div>
											    </div>
												<div class="form-row">
													<div class="form-group col-md-8">
													    <label for="inputAddress2">?????????</label>
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
												    	<button type="button" id="checkEmailButton" class="btn btn-outline-primary">???????????? ??????</button>
												    </div>
												</div>
												<div class="form-row" id="checkEmailDiv">
													<div class="form-group col-md-8">
														<input type="hidden" id="randomInput"/>
													    <input type="text" onblur="checkRandom();" id="checkRandomInput" class="form-control" placeholder="??????????????? ???????????????">
												    </div>
												    <div class="form-group col-md-12">
												    	<div id="checkCount" style="display:inline-block;"></div>
												    </div>
												</div>
												<div class="form-group">
												    <label for="inputAddress">????????????</label>
												    <input type="text" class="form-control" name="phone" id="phone" onblur="checkPhone();" placeholder="'-' ??? ????????? ????????????">
												</div>
												<div class="form-row">
												    <div class="form-group col-md-3">
												      <label for="inputCity">??????</label>
												      <input type="text" id="sample6_postcode" name="address1" readonly class="form-control mt-1 adressInput" placeholder="????????????" onclick="sample6_execDaumPostcode()" required>
												    </div>
												    <div class="form-group col-md-9">
												    	<label for="inputCity">&nbsp;</label>
												    	<input type="text" id="sample6_address" name="address2" readonly class="form-control mt-1" placeholder="??????" required>
												    </div>
												 </div>
												 <div class="form-group">
												    <label for="inputAddress">?????? ??????</label>
												    <input type="text" id="sample6_detailAddress" name="address3" class="form-control mt-1" placeholder="????????????" required>
												    <input type="hidden" id="sample6_extraAddress" class="form-control"placeholder="????????????">
												</div>
									      </div>
									      <div class="modal-footer">
									        <button type="submit" class="btn btn-danger">?????? ????????????</button>&nbsp;&nbsp;
									        <button type="button" class="btn btn-inverse btn-outline-inverse" data-dismiss="modal">??????</button>
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
		// ajax??? ????????? ??????
		
		// addMember Modal ??? ?????????
		$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
		
		// ???????????? ??????
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
	
	                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
	                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
	                var addr = ''; // ?????? ??????
	                var extraAddr = ''; // ???????????? ??????
	
	                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
	                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
	                    addr = data.roadAddress;
	                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
	                    addr = data.jibunAddress;
	                }
	
	                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
	                if(data.userSelectedType === 'R'){
	                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
	                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
	                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // ???????????? ??????, ??????????????? ?????? ????????????.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // ????????? ??????????????? ?????? ????????? ?????????.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // ????????? ???????????? ????????? ????????????.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		
		$("#checkEmailButton").on("click",function(){
			var email = $("#inputEmail").val();
			
			if(email.length == 0){
				alert("???????????? ??????????????????");
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
					console.log("??????" + data);
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
					console.log("?????????");
					$("#checkCount").text("?????? ????????? ?????????????????????.");
					$("#checkCount").css("color","blue");
					emailCheck = true;
				} else {
					console.log("????????????");
					alert("??????????????? ???????????? ????????????.[????????? ?????? ??????](" + count + "/6)");
					$("#checkCount").text("?????? ????????? ?????????????????????.");
					$("#checkCount").css("color","red");
					emailCheck = false;
					count++;
				}
			} else {
				alert("??????????????? ?????? ??????????????????.");
				$("#checkEmailDiv").hide();
			}
			
		}
		
		inputPhone = false;
		
		//???????????? ?????????
		function checkPhone(){
			var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			var phone = document.getElementById("phone").value;
			
			var check = regExp.test(phone);
			if(!check){
				inputPhone = false;
				alert("???????????? ????????? ??????????????????.");
			} else {
				inputPhone = true;
			}
			
		}
		
		function insertMember(){
			if(emailCheck && inputId && inputPhone){
				return true;
			} else if(!inputId){
				alert("???????????? ?????????????????????.");
				return false;
			} else if(!emailCheck){
				alert("???????????? ?????? ????????????.");
				return false;
			} else if(!inputPhone){
				alert("???????????? ????????? ??????????????????.");
				return false;
			}
		}
		
		$("#searchBtn").on("click",function(){
			var search = $("#searchMember").val();
			
			location.href="searchMember.me?search="+search;
			
		});

		inputId = false;
		
		//????????? ????????????
		function checkId(){
			var mId = $("#inputId").val();
			
			$.ajax({
				url:"checkId.me",
				data:{mId:mId},
				success:function(data){
					if(data.trim() == 'true'){
						inputId = true;
						$("#checkInputId").text('????????? ?????? ??????');
						$("#checkInputId").css("color","blue");
					} else {
						inputId = false;
						$("#checkInputId").text('???????????? ???????????????.');
						$("#checkInputId").css("color","red");
					}
				},
				error:function(data){
					console.log("????????? ???????????? ??????");
				}
			})
		}
		
		
	</script>

</body>

</html>
