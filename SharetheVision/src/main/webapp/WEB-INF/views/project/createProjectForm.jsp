<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>SV Company</title>
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
	<jsp:include page="/WEB-INF/views/common/font.jsp"/>
	
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
 		#paginationBox{ 
 			display: inline-block;
 			text-align: center;
 		} 
 		.projectContent::-webkit-scrollbar{
 			background-color: white;
 			width: 4px;
 		}
 		.projectContent::-webkit-scrollbar-thumb{
 			background-color: lightgray;
 			border-radius: 30px;
 		}
 		.projectContent::-webkit-scrollbar-track{
 			background-color: white;
 		}
 		.projectDiv::-webkit-scrollbar{
 			display:none;
 		}
 		.projectDiv::-webkit-scrollbar-thumb{
 			display:none;
 		}
 		.projectDiv::-webkit-scrollbar-track{
 			display:none;
 		}
 		.projectName:hover{
 			cursor:pointer;
			color: black;
			font-weight: bold; 			
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
                                                    <i class="icofont icofont-file-document bg-c-green"></i>
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
															      <div id="memberDiv" style="display:inline-block;" data-toggle="modal" data-target="#exampleModalCenter"><i class="icofont icofont-user icofont-2x"></i><i class="icofont icofont-ui-add icofont-1x"></i></div>
															   </div>
															   <br><br>
															   <div class="form-group col-md-12" >
															   <br>
															   		<table id="projectMemberTable">
															   			<tbody>
															   				<tr>
															   					<td><input type="hidden" name="mCode" value="${loginUser.mCode }" />
															   					<td style="width:10%"><i class="icofont icofont-user icofont-1x" style="color: gray;"></i></td>
															   					<td style="width:20%">${loginUser.name }</td>
															   					<td style="width:20%">${loginUser.jobName }</td>
															   					<td style="width:20%">${loginUser.deptName }</td>
															   					<td style="width:30%">${loginUser.phone }</td>
															   				</tr>
															   			</tbody>
															   		</table>
															   </div>
															   <div class="form-group col-md-12">
															   		&nbsp;
															   </div>
															   <div class="form-group col-md-12" style="text-align: center;">
															   		<button type="submit" class="btn btn-success">생성</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															   		<button type="button" class="btn btn-inverse btn-outline-inverse"  onclick="reloadPage();" id="cancelButton">취소</button>
															   </div>
															 </div>
														 </form>
                                                    </div>
                                                    <br>
                                                    <div style="overflow:auto; height: 350px; margin-bottom:25px;" class="card-block projectContent">
	                                                   	<h5>진행중인 프로젝트</h5><br>
															<div class="container">
															    <div class="row">
			                                                   		<c:if test="${ !empty pList }">
																		<c:forEach var="pro" items="${pList }" varStatus="vs">
																			<c:if test="${pro.pEnd eq 'N'}">
																				<c:choose>
																					<c:when test="${vs.count % 5 == 1 }">
																						<c:set var="backColor" value="#EFAF97"/>
																					</c:when>
																					<c:when test="${vs.count % 5 == 2 }">
																						<c:set var="backColor" value="#EA9086"/>
																					</c:when>
																					<c:when test="${vs.count % 5 == 3 }">
																						<c:set var="backColor" value="#CB8D99"/>
																					</c:when>
																					<c:when test="${vs.count % 5 == 4 }">
																						<c:set var="backColor" value="#9D98AE"/>
																					</c:when>
																					<c:when test="${vs.count % 5 == 0 }">
																						<c:set var="backColor" value="#8498B6"/>
																					</c:when>
																				</c:choose>
																		        <div class="col-md-3 m-2 projectDiv" style="background-color:${backColor}; color:white; box-shadow: 2px 2px 1px 1px lightgray; height: 200px; border-radius: 20px; overflow: auto;">
																		        	<input type="hidden" name="pNo" value="${pro.pNo }"/>
																		        	<div style="text-align:left; padding-top:15px; padding-left:10px; font-family:SpoqaHanSansNeo-Bold; font-size:20px;" class="projectName">
																		        		${pro.pName }
																		        	</div>
																		        	<div style="text-align:right;">
																			        	<button class="completeBtn" style="background:none; font-family:SpoqaHanSansNeo-Bold; color:white;">완료</button>&nbsp;
																			        	<button class="deleteBtn" style="background:none; font-family:SpoqaHanSansNeo-Bold; color:white;">삭제</button>
																		        	</div>
																		        	<br>
																		        	
																		        	<div style="padding-left:10px; font-family:ELAND_Choice_B;">
																			        	${pro.pIntro }
																		        	</div>
																		        	
																		        	<br><br>
																		        	
																		        	<div style="padding-left:10px;">
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
                                                    <div style="height:10px; border-top:0.3px solid gray; width:90%; margin:auto"></div>
                                                    <div style="overflow:auto; height: 350px;" class="card-block  projectContent">
                                                    	<h5>완료된 프로젝트</h5><br>
															<div class="container">
															    <div class="row">
			                                                   		<c:if test="${ !empty pList }">
																		<c:forEach var="pro" items="${pList }" varStatus="vs">
																			<c:choose>
																				<c:when test="${vs.count % 5 == 1 }">
																					<c:set var="backColor" value="#EFAF97"/>
																				</c:when>
																				<c:when test="${vs.count % 5 == 2 }">
																					<c:set var="backColor" value="#EA9086"/>
																				</c:when>
																				<c:when test="${vs.count % 5 == 3 }">
																					<c:set var="backColor" value="#CB8D99"/>
																				</c:when>
																				<c:when test="${vs.count % 5 == 4 }">
																					<c:set var="backColor" value="#9D98AE"/>
																				</c:when>
																				<c:when test="${vs.count % 5 == 0 }">
																					<c:set var="backColor" value="#8498B6"/>
																				</c:when>
																			</c:choose>
																			
																			<c:if test="${pro.pEnd eq 'Y' }">
																		        <div class="col-md-3 m-2 projectDiv" style="background-color:${backColor}; color:white; box-shadow: 2px 2px 1px 1px lightgray; height: 200px; border-radius: 20px; overflow: auto;">
																		        	<input type="hidden" name="pNo" value="${pro.pNo }"/>
																		        	<div style="text-align:left; padding-top:15px; padding-left:10px; font-family:SpoqaHanSansNeo-Bold; font-size:20px;"  class="projectName">
																		        		${pro.pName }
																		        	</div>
																		        	<div style="text-align:right;">
																		        		<button class="progressBtn" style="background:none; font-family:SpoqaHanSansNeo-Bold; color:white;">진행</button>&nbsp;
																		        		<button class="deleteBtn" style="background:none; font-family:SpoqaHanSansNeo-Bold; color:white;">삭제</button>
																		        	</div>
																		        	<br>
																		        	
																		        	<div style="padding-left:10px; font-family:ELAND_Choice_B;">
																			        	${pro.pIntro }
																		        	</div>
																		        	
																		        	<br><br>
																		        	
																		        	<div style="padding-left:10px;">
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
                                <div class="modal fade" id="exampleModalCenter" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLongTitle">사원 추가</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <br>
								      <div class="pcoded-search" style="text-align:right;">
							              <span class="searchbar-toggle">  </span>
							              <div class="pcoded-search-box" style="display:inline-block; text-align:right; margin-right:20px;">
							                  <input type="text" id="searchMember" size="25" placeholder="이름, 직급 및 부서명으로 검색" value="${search }">
							                  <span class="search-icon" id="searchBtn"><i class="ti-search" aria-hidden="true"></i></span>
							              </div>
							          </div>
								      <div class="modal-body">
								      		<table style="width:100%;" id="memberListTable">
								      			<thead>
									      			<tr style="border-bottom:1px solid black;">
									      				<td></td>
									      				<td style="width: 10%">&nbsp;</td>
									      				<td style="width: 20%">이름</td>
									      				<td style="width: 20%">부서</td>
									      				<td style="width: 20%">직급</td>
									      				<td style="width: 40%">핸드폰 번호</td>
									      			</tr>
								      			</thead>
								      			<tbody>
								      			</tbody>
								      		</table>
								      		<br>
							      			<div id="pageDiv" class="mx-auto" style="text-align:center;">
												<ul id="paginationBox" class="pagination">
												</ul>
											</div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-success" id="addMemberButton" data-dismiss="modal">추가</button>
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
	
	$("#memberDiv").click(function(){
		memberList();
	});
	
	$("#searchBtn").click(function(){
		memberList();
	});
	
	function memberList(page){
		var search = $("#searchMember").val();
		
		$.ajax({
			url: "projectMember.pr",
			data: {search: search, page: page},
			success: function(data){
				
				var $tableBody = $("#memberListTable tbody");
				$tableBody.html('');
				
				var $tr;
				var $mCode;
				var $check;
				var $name;
				var $jobName;
				var $deptName;
				var $phone;
				
				for(var i in data.jArr){
					$tr = $('<tr>');
					$mCode = $('<td>').html('<input type="hidden" value="'+data.jArr[i].mCode+'"/>');
					$check = $('<td>').html('<input type="checkbox" name="addMemberCheckbox"/>');
					$name = $('<td>').text(data.jArr[i].name);
					$jobName = $('<td>').text(data.jArr[i].jobName);
					$deptName = $('<td>').text(data.jArr[i].deptName);
					$phone = $('<td>').text(data.jArr[i].phone);
					
					$tr.append($mCode);
					$tr.append($check);
					$tr.append($name);
					$tr.append($jobName);
					$tr.append($deptName);
					$tr.append($phone);
					$tableBody.append($tr);
				}
				
				listPage(data.pi, page);
				
			},
			error: function(data){
				console.log("실패함");				
			}
		});
	}
	
	function listPage(data, page){
		var search = document.getElementById("searchMember").value;
		var block = "";
		
		// 번호를 표시하는 부분
		for (var i = data['startPage']-1; i < data['endPage']; i++) {
			if (page-1 !== i) {
				block += "<li style='display:inline-block;' class='page-item'><a class='page-link' href='javascript:memberList("
						+ (i + 1) + ")'>" + (i + 1) + "</a></li>";
			} else {
				block += "<li style='display:inline-block;' class='page-item disabled'><a class='page-link'>"
						+ (i + 1) + "</a></li>";
			}
		}
		$("#paginationBox").html(block);
		$('#pageDiv').attr('class', 'mx-auto');
	}
	
	$("#addMemberButton").click(function(){
		var check = $("input[name=addMemberCheckbox]:checked");

		var $tableBody = $("#projectMemberTable tbody");
		
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
		location.replace("createProjectForm.pr");
	}
	
	$(document).ready(function(){
		$(".completeBtn").bind("click", function(){
			var pNo = $(this).parent().parent().children('input').val();
			var projectName = $(this).parent().prev().text().trim();
			
			var condition = 1;
			$.ajax({
				url:"changeProject.pr",
				data: {pNo: pNo, condition: condition, projectName:projectName},
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
			var pNo = $(this).parent().parent().children('input').val();
			var projectName = $(this).parent().prev().text().trim();
			
			var condition = 2;
			$.ajax({
				url:"changeProject.pr",
				data: {pNo: pNo, condition:condition, projectName:projectName},
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
			
			var pNo = $(this).parent().parent().children('input').val();
			var projectName = $(this).parent().prev().text().trim();
			
			var condition = 3;
			if(confirm(projectName + " 을(를) 삭제하시겠습니까?")){
				$.ajax({
					url:"changeProject.pr",
					data: {pNo: pNo, condition:condition, projectName:projectName},
					success: function(data){
						console.log(data);
						if(data == 1){
							location.href="createProjectForm.pr";
						} else {
							alert("프로젝트 삭제에 실패하였습니다.");
						}
					}
				});
			}
		});
		
		
	})
	
	// 프로젝트 검색으로 연결
	$(".projectName").bind("click",function(){
		var category = 'project';
		var word = $(this).text().trim();
		
		location.href="boardSearch.bo?category="+category+"&word="+word;
				
	});
	


</script>
</body>

</html>
