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
		#addProjectMemberDiv{
			cursor:pointer;
		}
		.deleteIcon{
			cursor:pointer;
		}
		.completeBtn{
			border:0; outline:0; background-color:white;
		}
		.completeBtn:hover{
			border-bottom: 1px solid black;
			cursor:pointer;
		}
		.deleteBtn{
			border:0; outline:0; background-color:white;
		}		
		.deleteBtn:hover{
			border-bottom: 1px solid black;
			cursor:pointer;
		}		
		.progressBtn{
			border:0; outline:0; background-color:white;
		}
		.progressBtn:hover{
			border-bottom: 1px solid black;
			cursor:pointer;
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

		<jsp:include page="/WEB-INF/views/common/sideMenu.jsp"/>
		
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
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont icofont icofont-file-document bg-c-pink"></i>
                                                    <div class="d-inline">
                                                        <h4>프로젝트</h4>
                                                        <span>팀원들과 협업할 프로젝트를 관리하는 곳입니다.</span>
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

                                    <div class="page-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="card">
                                                    <div class="card-header" style="border-bottom: 0.3px solid gray; width: 90%; margin: auto;">
                                                    	<h5>프로젝트 추가</h5>
                                                    	<br><br>
                                                    	<form action="createProject.pr" method="post">
	                                                    	<div class="form-row">
															   <div class="form-group col-md-3">
															      <label for="inputEmail4">프로젝트 명</label>
															      <input type="text" class="form-control" name="pName" id="inputEmail4" placeholder="프로젝트 명" required>
															   </div>
															   <div class="form-group col-md-8">
															      <label for="inputPassword4">프로젝트 내용</label>
															      <input type="text" class="form-control" name="pIntro" id="inputPassword4" placeholder="프로젝트 내용">
															   </div>
															   <div class="form-group col-md-1" id="addProjectMemberDiv">
															      <label for="inputCity">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;&nbsp;
															      <div style="display:inline-block;" data-toggle="modal" data-target="#exampleModalCenter"><i class="icofont icofont-user icofont-2x"></i><i class="icofont icofont-ui-add icofont-1x"></i></div>
															   </div>
															   <br><br>
															   <div class="form-group col-md-12" >
															   <br>
															   		<table id="projectMemberTable">
															   			<tbody>
															   			</tbody>
															   		</table>
															   </div>
															   <div class="form-group col-md-12">
															   		&nbsp;
															   </div>
															   <div class="form-group col-md-12" style="text-align: center;">
															   		<button type="submit" class="btn btn-danger">생성</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															   		<button type="button" class="btn btn-inverse btn-outline-inverse"  onclick="reloadPage();" id="cancelButton">취소</button>
															   </div>
															 </div>
														 </form>
                                                    </div>
                                                    <br>
                                                    <div class="card-block">
	                                                   	<label>진행중인 프로젝트</label><br>
															<div class="container">
															    <div class="row">
			                                                   		<c:if test="${ !empty pList }">
																		<c:forEach var="pro" items="${pList }">
																			<c:if test="${pro.pEnd eq 'N'}">
																		        <div class="col-md-3 m-2" style="box-shadow: 2px 2px 1px 1px lightgray; height: 200px; border-radius: 20px; overflow: auto;">
																		        	<input type="hidden" name="pNo" value="${pro.pNo }"/>
																		        	${pro.pName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		        	<button class="completeBtn">완료</button>&nbsp;<button class="deleteBtn" >삭제</button>
																		        	<hr style="border: solid 1px black;">
																		        	${pro.pIntro }<br><br><br>
																		        	<c:forEach var="mPro" items="${ pmList }">
																			        	<c:if test="${pro.pNo eq mPro.pNo}">
																		        			<c:if test="${ mPro.pName != null }">
																		        				<img src="resources/muploadFile/${mPro.pName }" style="width:30px; height:30px; border-radius: 65%;"/>
																		        			</c:if>
																		        			<c:if test="${ mPro.pName == null }">
																		        				<img src="resources/assets/images/defaultProfile.png" width="30px" height="30px;" />
																		        			</c:if>
																			        	</c:if>
																		        	</c:forEach>
																		        	
																		        </div>
																			</c:if>
																		</c:forEach>
			                                                   		</c:if>
															    </div>
															</div>
                                                    		
                                                    	<c:if test="${ empty pList }">
                                                    		진행 중인 프로젝트가 없습니다.
                                                    	</c:if>
                                                    </div>
                                                    <div class="card-block">
                                                    	<label>완료된 프로젝트</label><br>
															<div class="container">
															    <div class="row">
			                                                   		<c:if test="${ !empty pList }">
																		<c:forEach var="pro" items="${pList }">
																			<c:if test="${pro.pEnd eq 'Y' }">
																		        <div class="col-md-3 m-2" style="box-shadow: 2px 2px 1px 1px lightgray; height: 200px; border-radius: 20px; overflow: auto;">
																		        	<input type="hidden" name="pNo" value="${pro.pNo }"/>
																		        	${pro.pName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		        	<button class="progressBtn">진행</button>&nbsp;<button class="deleteBtn" >삭제</button>
																		        	<hr style="border: solid 1px black;">
																		        	${pro.pIntro }<br><br><br>
																		        	<c:forEach var="mPro" items="${ pmList }">
																			        	<c:if test="${pro.pNo eq mPro.pNo}">
																		        			<c:if test="${ mPro.pName != null }">
																		        				<img src="resources/muploadFile/${mPro.pName }" style="width:30px; height:30px; border-radius: 65%;"/>
																		        			</c:if>
																		        			<c:if test="${ mPro.pName == null }">
																		        				<img src="resources/assets/images/defaultProfile.png" width="30px" height="30px;" />
																		        			</c:if>
																			        	</c:if>
																		        	</c:forEach>
																		        	
																		        </div>
																			</c:if>
																		</c:forEach>
			                                                   		</c:if>
															    </div>
															</div>
		
	                                                    	<c:if test="${ empty pList }">
	                                                    		<tr>
	                                                    			<td>완료된 프로젝트가 없습니다.</td>
	                                                    		</tr>
	                                                   		</c:if>	
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 사원추가 Modal 창 -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLongTitle">사원 추가</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      		<table style="width:100%;">
								      			<tr style="border-bottom:1px solid black;">
								      				<td></td>
								      				<td style="width: 10%">&nbsp;</td>
								      				<td style="width: 20%">이름</td>
								      				<td style="width: 20%">부서</td>
								      				<td style="width: 20%">직책</td>
								      				<td style="width: 40%">핸드폰 번호</td>
								      			</tr>
								      			<c:if test="${ !empty list }">
								      				<c:forEach var="list" items="${ list }">
									      				<tr>
									      					<td><input type="hidden" value="${ list.mCode }"></td>
										      				<td><input type="checkbox" name="addMemberCheckbox"></td>
										      				<td>${ list.name }</td>
										      				<td>${ list.jobName }</td>
										      				<td>${ list.deptName }</td>
										      				<td>${ list.phone }</td>
									      				</tr>
								      				</c:forEach>
								      			</c:if>
								      			<c:if test="${ empty list }">
								      				<tr>
								      					<th style="text-align:center" colspan="6">등록된 사원이 없습니다.</th>
								      				</tr>
								      			</c:if>
								      		</table>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-primary" id="addMemberButton" data-dismiss="modal">추가</button>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								      </div>
								    </div>
								  </div>
								</div>
								<!-- Modal 창 끝 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	});
	
	$("#addMemberButton").click(function(){
		$.ajax({
			
		});
	});
	
	$("#addMemberButton").click(function(){
		var check = $("input[name=addMemberCheckbox]:checked");

		var $tableBody = $("#projectMemberTable tbody");
		$tableBody.html('');
		
		var $tr;
		var $mNum;
		var $img;
		var $name;
		var $dept;
		var $job;
		var $phone;
		var $button;
		
		check.each(function(i){
			var tr = check.parent().parent().eq(i);
			var td = tr.children();
			
			var col1 = td.find('input[type="hidden"]').val();
			var col2 = td.eq(2).text();
			var col3 = td.eq(3).text();
			var col4 = td.eq(4).text();
			var col5 = td.eq(5).text();
			
			console.log(col1);			
			
			$tr = $('<tr>');
			$mNum = $('<td>').html('<input type="hidden" name="mCode" value="'+col1+'" />');
			$img = $('<td style="width:10%">').html('<i class="icofont icofont-user icofont-1x" style="color: gray;"></i>');
			$name = $('<td style="width:20%">').text(col2);
			$dept = $('<td style="width:20%">').text(col3);
			$job = $('<td style="width:20%">').text(col4);
			$phone = $('<td style="width:30%">').text(col5);
			$button = $('<td style="width:10%">').html('<i class="icofont icofont-ui-close icofont-xs deleteIcon"></i>');
			
			
			$tr.append($mNum);
			$tr.append($img);
			$tr.append($name);
			$tr.append($dept);
			$tr.append($job);
			$tr.append($phone);
			$tr.append($button);
			$tableBody.append($tr);
			
		})
		
	});
	
	$(document).on("click",".deleteIcon", function(){
		var $tr = $(this).parent().parent();
		$tr.remove();
		$('input:[type=hidden]').each(function(){ this.defaultValue = this.value; });
	});
	
	function reloadPage(){
		location.replace("createProjectForm.me");
	}
	
	$(document).ready(function(){
		$(".completeBtn").bind("click", function(){
			var pNo = $(this).prev().val();
			var condition = 1;
			$.ajax({
				url:"changeProject.pr",
				data: {pNo: pNo, condition: condition},
				success: function(data){
					console.log(data);
					if(data == 1){
						location.href="createProjectForm.pr";
					} else {
						alert("프로젝트 완료에 실패하였습니다.");
					}
				}
			});
		});
		
		$(".progressBtn").bind("click", function(){
			console.log("진행 버튼");
			var pNo = $(this).prev().val();
			console.log(pNo);
			var condition = 2;
			$.ajax({
				url:"changeProject.pr",
				data: {pNo: pNo, condition:condition},
				success: function(data){
					console.log(data);
					if(data == 1){
						location.href="createProjectForm.pr";
					} else {
						alert("프로젝트 진행에 실패하였습니다.");
					}
				}
			});
		});
		
		$(".deleteBtn").bind("click", function(){
			console.log("삭제 버튼");
			var pNo = $(this).prev().prev().val();
			console.log(pNo);
			var condition = 3;
			$.ajax({
				url:"changeProject.pr",
				data: {pNo: pNo, condition:condition},
				success: function(data){
					console.log(data);
					if(data == 1){
						location.href="createProjectForm.pr";
					} else {
						alert("프로젝트 삭제에 실패하였습니다.");
					}
				}
			});
		});
		
		
	})


</script>
</body>

</html>
