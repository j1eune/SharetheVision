<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>SV Company</title>
 <!-- Meta -->
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="description" content="CodedThemes">
 <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
 <meta name="author" content="CodedThemes">

<!-- calendar -->
<link rel="stylesheet" href="resources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href='resources/vendor/css/select2.min.css' />
<link rel="stylesheet" href="resources/vendor/css/main.css">
<link rel="stylesheet" href='resources/vendor/css/bootstrap-datetimepicker.min.css' />
</head>
<body>
<!-- 템플릿  공통 -->
<jsp:include page="/WEB-INF/views/common/common.jsp" />

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
<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">       

	<!--  topMenu  -->
	<jsp:include page="/WEB-INF/views/common/topMenu.jsp" />           
	<!--  sideMenu    -->        
	<jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />
     


    <!-- Main Content Start -->           
    <div class="pcoded-main-container">
        <div class="pcoded-wrapper">               
            <div class="pcoded-content">
                <div class="pcoded-inner-content">
                    <div class="main-body">
                        <div class="page-wrapper">
                            <div class="page-body">
                                <div class="row">
                                <!-- card1 start -->
                                 <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-ui-office bg-c-pink card1-icon"></i>
                                            <span class="text-c-pink f-w-600">출근횟수</span>
                                            <h4>${coCount}/${monEnd}건</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-pink f-16 icofont icofont-calendar m-r-10"></i>${month}월
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card2 start -->
                                <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                                            <span class="text-c-blue f-w-600">근태현황</span>
                                            <h4 id="main_commute">${coTotal + owTotal}h/52h</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-blue f-16 icofont icofont-warning m-r-10"></i>
                                                    <span id="main_tardy">지각: ${tardy}회</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card3 start -->
                               	<div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-ui-home bg-c-purple card1-icon"></i>
                                            <span class="text-c-purple f-w-600">연차사용</span>
                                            <h4>${usedTotal}/${total}</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-purple f-16 icofont icofont-tag m-r-10"></i>2021년도
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- card4 start -->
                                <div class="col-md-6 col-xl-3">
                                    <div class="card widget-card-1">
                                        <div class="card-block-small">
                                            <i class="icofont icofont-social-twitter bg-c-yellow card1-icon"></i>
                                            <span class="text-c-yellow f-w-600">결재서류</span>
                                            <h4>UI 기획안</h4>
                                            <div>
                                                <span class="f-left m-t-10 text-muted">
                                                    <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i> 제출 /완료
                                                </span>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <!-- card4 end -->

                                <!-- Data widget start -->
                                <div class="col-md-12 col-xl-6">
                                    <div class="card project-task" style="height: 300px">
                                        <div class="card-header">
                                            <div class="card-header-left ">
                                                <h4>프로젝트</h4>
                                            </div>
                                        </div>
                                        <!-- 로그인유저가 속한 프로젝트가 있다면 가져오기-->
                                        <div class="card-block p-b-10" style="overflow-y:auto">
                                            <div class="table-responsive">
                                                <table class="table table-hover" id="projectTb">
                                                    <thead></thead>
                                                    <tbody></tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 프로젝트 목록 widget -->
                                    </div>
                                </div>
                                <!-- To Do List -->
                                <div class="col-md-12 col-xl-6" >
                                    <div class="card add-task-card" style="height: 300px;">
                                        <div class="card-header">
                                            <div class="card-header-left">
                                                <h4>업무 목록</h4>
                                            </div>
                                        </div>
                                        <div class="card-block" style="overflow-y:auto">
                                         <!--  체크리스트 시작 -->
                                            <div class="to-do-list"></div>
                                            <div>
                                                <div class="checkbox-fade d-block">
                                                    <span class="cr">
                                                         <i class="cr-icon icofont txt-default"></i>
                                                     </span>
                                                     <div>
                                                     	 <input type="text" id="addTodo" placeholder="( Todo 작성하시고 꼭 Save 하세요 )">
	                                                     <span class="f-right"><button class="btn btn-mini" id="saveBtn"> SAVE</button></span><hr>
                                                     </div>
                                                </div>
                                             </div>
                                          <!--  체크리스트 끝 -->
                                        </div>
                                    </div>
                                </div>   
          					 <!-- Calendar Schedule -->
                                <div class="col-md-12 col-xl-12">
	                                <div class="card">                                   
	                                    <div class="container">
								        <input type="hidden" id="e-id" value="${loginUser.mCode}">
								        <input type="hidden" id="e-dept" value="${loginUser.deptNo}">
								        <!-- 일자 클릭시 메뉴오픈 -->
								        <div id="contextMenu" class="dropdown clearfix">
								            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu" id="sccode"
								                style="display:block;position:static;margin-bottom:5px;">
								                <li value="1"><a tabindex="-1">부서일정</a></li>
								                <li value="2"><a tabindex="-1" >개인일정</a></li>
								                <li class="divider"></li>
								                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
								            </ul>
								        </div>
								        <div id="wrapper">
								            <div id="loading"></div>
								            <div id="calendar"></div>
								        </div>
								        <!-- 일정 추가 MODAL -->
								        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
								            <div class="modal-dialog" role="document">
								                <div class="modal-content">
								                    <div class="modal-header">
								                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                        <span aria-hidden="true">&times;</span></button>
								                        <h4 class="modal-title"></h4>
								                    </div>
								                    <div class="modal-body">
								                        <div class="row">
								                            <div class="col-xs-12">
								                                <label class="col-xs-4" for="edit-title">일정명 : </label>
								                                <input class="inputModal" type="text" name="edit-title" id="edit-title" required="required" />
								                            </div>
								                        </div>
								                        <div class="row">
								                            <div class="col-xs-12">
								                                <label class="col-xs-4" for="edit-start">시작일 : </label>
								                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
								                            </div>
								                        </div>
								                        <div class="row">
								                            <div class="col-xs-12">
								                                <label class="col-xs-4" for="edit-end">종료일 : </label>
								                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
								                            </div>
								                        </div>
								                        <div class="row">
								                            <div class="col-xs-12">
								                                <label class="col-xs-4" for="edit-type">구분명 : </label>
								                                <select class="inputModal" name="edit-type" id="edit-type" style="width: 140px; height: 20px;">
								                                    <option class="text-c-purple" value="1">부서일정</option>
								                                    <option class="text-c-yellow" value="2">개인일정</option>
								                                </select>
								                            </div>
								                        </div>
								                    	<div class="row" style="display:none">
								                            <div class="col-xs-12">
								                                <label class="col-xs-4" for="edit-color">색상</label>
								                                <select class="inputModal" name="color" id="edit-color">
									                                    <option value="#660099">보라색</option>
									                                    <option value="#FFB64D">주황색</option>
								                                </select>
								                            </div>
								                        </div>
								                    </div>
								                    <div class="modal-footer modalBtnContainer-addEvent">
								                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
								                    </div>
								                    <!--  일정 수정 MODAL -->
								                    <div class="modal-footer modalBtnContainer-modifyEvent">
								                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
										                <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
								                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
							                    	</div>
								                </div><!-- /.modal-content -->
								            </div><!-- /.modal-dialog -->
								        </div><!-- /.modal -->
								    </div><!--    /.container     -->
	                                </div>
                                </div>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="fixed-button" >
            <a href="#!" target="_blank" class="btn-sm bg-c-purple">
                <i class="ti-angle-up text-c-white" ></i>
            </a>
        </div>
    </div>
    <!-- Main Content End -->           
    </div>
</div>
<script src="resources/vendor/js/moment.min.js"></script>
<script src="resources/vendor/js/fullcalendar.min.js"></script>
<script src="resources/vendor/js/ko.js"></script>
<script src="resources/vendor/js/select2.min.js"></script>
<script src="resources/vendor/js/main.js"></script>
<script src="resources/vendor/js/addEvent.js"></script>
<script src="resources/vendor/js/editEvent.js"></script>
<script src="resources/vendor/js/etcSetting.js"></script>
<script src="resources/vendor/js/bootstrap-datetimepicker.min.js"></script>

<script>
$( document ).ready(function() {	
	listTodo();
	function listTodo(){
		$.ajax({
			url: 'listTo',
			success: function(data){
				$todiv = $('.to-do-list');
				$todiv.html('');
				
				if(data.length>0){
					for(var i in data){
						$li= $([
							'<li class="checkbox-fade fade-in-primary d-block">'
							,'   <label class="check-task d-block">'
							,'      <input type="checkbox" id="checkbox">'
							,'       <span class="cr">'
							,'			 <i class="cr-icon icofont icofont-ui-check txt-default"></i>'		
							,'		 </span>'	
							,'		 <div><h6 class="todoName"></h6>'
							,'			 <span class="f-right" style="margin-top:-10px;">'
							,'	 			<a class="delete_todolist">'
							,'					<i class="icofont icofont-ui-delete" style="cursor:pointer"></i>'
							,'	 			</a>'
							,'   		 </span>'
							,'		 </div>'
							,' 	 </label>'
							,' 	 <hr>'
							,'</li>'
						].join(''));
						
						if(data[i].chNo=='2'){
							$li.find('#checkbox').attr("checked",false);
						}else{
							$li.find('#checkbox').attr("checked",true);
							$li.find('.todoName').css("text-decoration", "line-through");
						}
						$li.find('.todoName').text(data[i].chName);
						$li.find('.delete_todolist').attr("onclick","delete_todo('"+data[i].dchNo+"')");
						$li.find('#checkbox').attr("onchange","update_todo('"+data[i].dchNo+"')");
						
						$todiv.append($li);
					}
				}	
			}
		});
	}
	
	$('#saveBtn').on('click',function(){
		var chName;
			chName = $('#addTodo').val();
		if(chName.trim()!=""){
			$.ajax({
				url: 'addTodo',
				data: { 'chName': chName},
				success: function(data){
					location.reload();
				}
			});
		}else{
			$('#addTodo').val('').focus();
		}
	})

	
	listProject();
	function listProject(){
		$.ajax({
			url: 'listProject',
			success: function(data){
				$tbody = $('#projectTb tbody');
				$tbody.html('');
				
				if(data.length>0){
					for(var i in data){
						$tr= $([
							'<tr>'
							,'   <td>'
							,'      <div class="task-contain">'
							,'       	<h6 class="bg-c-purple d-inline-block text-center" id="pNo">P1</h6>'
							,'			<p class="d-inline-block m-l-20" id="pName">ProjectName</p>'		
							,'		 </div>'
							,'	 </td>'
							,'	 <th>'
							,'	 	 <button class="btn btn-outline btn-sm" id="pStatus">ProjectStatus</button>'
							,'	 </th>'
							,'</tr>'  
						].join(''));
						$tr.find('#pNo').text('P'+data[i].pNo);
						$tr.find('#pName').text(data[i].pName);
						
						if(data[i].pEnd=='N'){
							$tr.find('#pStatus').addClass('btnpurple').attr('onclick','location.href="createProjectForm.pr"').text('진행중인 프로젝트');
						}else{
							$tr.find('#pStatus').attr('disabled',true).text('완료된 프로젝트');
							$tr.find('#pNo').css('background-color','#cccccc');
						}
						$tbody.append($tr);
					}
				}else{
					var $th;
					$th = $('<th>').text("현재 참여중인 프로젝트가 없습니다."); 
					$tbody.append($th);
				}	
			},
			error:function(){
				console.log("프로젝트 불러오기 실패 error.");
			}
		});
	}
	
    //화면 위로 올리는 버튼 액션
    var $window = $(window);
    var nav = $('.fixed-button');
    $window.scroll(function(){
        if($window.scrollTop() >= 200){
        	nav.addClass('active');
   		}else{
     		nav.removeClass('active');
     	}
    });
    
});//document ready end    

function update_todo(dchNo){
	$.ajax({
		url: 'updateTo',
		data: { 'dchNo': dchNo },
		success: function(data){
			if(data=="success"){
				location.reload();
			}else{
				console.log(data);
			}
		}
	});
}
function delete_todo(dchNo){
	$.ajax({
		url: 'deleteTo',
		data: { 'dchNo': dchNo },
		success: function(data){
			if(data=="success"){
				location.reload();
			}else{
				console.log(data);
			}
		}
	});
}

// 클릭 연계 이벤트 vendor.js 에 추가함        
</script>

<script>
/* 	// 연차사용, 근태현황
	$.ajax({
// 		url: "commuteChart.co",
// 		success: function(data){
			
		}
	}); */
</script>
</body>
</html>
