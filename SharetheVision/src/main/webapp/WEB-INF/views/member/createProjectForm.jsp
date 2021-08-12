<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                                    	<form action="createProject.me" method="post">
	                                                    	<div class="form-row">
															   <div class="form-group col-md-3">
															      <label for="inputEmail4">프로젝트 명</label>
															      <input type="text" class="form-control" id="inputEmail4" placeholder="프로젝트 명" required>
															   </div>
															   <div class="form-group col-md-8">
															      <label for="inputPassword4">프로젝트 내용</label>
															      <input type="text" class="form-control" id="inputPassword4" placeholder="프로젝트 내용">
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
															   		<button type="button" class="btn btn-inverse btn-outline-inverse" id="cancelButton">취소</button>
															   </div>
															 </div>
														 </form>
                                                    </div>
                                                    <br>
                                                    <div class="card-block">
                                                    	<label>진행중인 프로젝트</label><br>
                                                    	<table>
                                                    		<tr>
                                                    			<td>진행 중인 프로젝트가 없습니다.</td>
                                                    		</tr>
                                                    	</table>                                                    	
                                                    </div>
                                                    <div class="card-block">
                                                    	<label>완료된 프로젝트</label><br>
                                                    	<table>
                                                    		<tr>
                                                    			<td>완료된 프로젝트가 없습니다.</td>
                                                    		</tr>
                                                    	</table>
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
								      			<tr>
								      				<td><input type="hidden"></td>
								      				<td><input type="checkbox" name="addMemberCheckbox"></td>
								      				<td>홍길동</td>
								      				<td>마케팅</td>
								      				<td>팀장</td>
								      				<td>010-5253-9563</td>
								      			</tr>
								      			<tr>
								      				<td><input type="hidden"></td>
								      				<td><input type="checkbox" name="addMemberCheckbox"></td>
								      				<td>강건강</td>
								      				<td>인사</td>
								      				<td>사원</td>
								      				<td>010-5234-7873</td>
								      			</tr>
								      			<tr>
								      				<td><input type="hidden"></td>
								      				<td><input type="checkbox" name="addMemberCheckbox"></td>
								      				<td>남나눔</td>
								      				<td>인사</td>
								      				<td>대리</td>
								      				<td>010-1242-2345</td>
								      			</tr>
								      			<tr>
								      				<td><input type="hidden"></td>
								      				<td><input type="checkbox" name="addMemberCheckbox"></td>
								      				<td>도대담</td>
								      				<td>마케팅</td>
								      				<td>사원</td>
								      				<td>010-1623-6432</td>
								      			</tr>
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
			
			var col1 = td.eq(0).text();
			var col2 = td.eq(2).text();
			var col3 = td.eq(3).text();
			var col4 = td.eq(4).text();
			var col5 = td.eq(5).text();
			
			$tr = $('<tr>');
			$mNum = $('<td>').html('<input type="hidden" name="num" value='+ col1 +'>');
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
	});
	
	

</script>
</body>

</html>
