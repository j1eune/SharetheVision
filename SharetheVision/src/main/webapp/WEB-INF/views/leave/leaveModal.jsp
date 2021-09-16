<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SV Company</title>
</head>
<body>
	
	<!-- 휴가 요청 모달 -->
<!-- 	<div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true"> -->
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title mx-auto" id="leaveModalLabel">휴가 신청</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body mx-4">
<!-- 	                <form> -->
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="leaveType">휴가 종류</label>
                            <select class="form-control" id="leaveType">
                                <option>선택해주세요.</option>
                                <option value="1">연차</option>
                                <option value="2">반차</option>
                                <option value="3">경조사</option>
                                <option value="4">공가</option>
                                <option value="5">병가</option>
                                <option value="6">특별휴가</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        	사용가능한 휴가 : ${remain} 일 &nbsp;&nbsp;&nbsp;&nbsp; 신청한 휴가 : <span id="requestDays"></span>일
                    </div>
                    <div class="form-row">
						<label for="leavePeriod" style="padding-left: 5px;">
							휴가 기간 &nbsp; <i class="icofont icofont-info-circle" style="font-size: 12px;"></i><span style="font-size: 12px;">휴가가 하루일 경우 같은 날을 선택해주세요.</span>
						</label>
                        <div class="form-group col-md-5">
                            <input type="text" id="startDate" class="form-control datepicker" placeholder="시작일 년/월/일">
                        </div>
                        <div class="form-group col-md-1">
<!--                             <label>&nbsp;</label> -->
                            <div class="text-center my-auto">~</div>
                        </div>
                        <div class="form-group col-md-5">
<!--                             <label>&nbsp;</label> -->
                            <input type="text" id="endDate" class="form-control datepicker" placeholder="시작일 년/월/일">
                        </div>
                    </div>
                    <div class="form-group" id="half">
                        <label>오전 / 오후</label>
                        <div id="leaveTime">
                            <input type="radio" name="leaveTime" id="am" value="am"/>
                            <label for="am">오전</label>
                            <input type="radio" name="leaveTime" id="pm" value="pm"/>
                            <label for="pm">오후</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="leaveContent">신청사유</label>
                        <textarea class="form-control" id="leaveContent" rows="6" placeholder="사유를 입력해주세요." style="resize: none;"></textarea>
                    </div>
                    <div class="form-row mb-3">
                        <div class="form-group col-md-6">
                            <label for="leaveType">결재자</label>
                            <select class="form-control" id="leaveApproval">
                                <option>선택해주세요.</option>
								<c:forEach items="${mlist}" var="m">
									<optgroup label="${m.deptName} 팀 ">
										<c:if test="${m.deptName eq '인사'}" >
											<option value="${m.mId}">${m.name} ${m.jobName}</option>	
										</c:if>
										<c:if test="${ m.deptName eq '마케팅' }" >
											<option value="${m.mId}">${m.name} ${m.jobName}</option>	
										</c:if>
										<c:if test="${ m.deptName eq '생산'}" >
											<option value="${m.mId}">${m.name} ${m.jobName}</option>	
										</c:if>
										<c:if test="${ m.deptName eq '영업'}" >
											<option value="${m.mId}">${m.name} ${m.jobName}</option>	
										</c:if>
										<c:if test="${ m.deptName eq '회계'}" >
											<option value="${m.mId}">${m.name} ${m.jobName}</option>	
										</c:if>
									</optgroup>
								</c:forEach>
                            </select>
                        </div>
                    </div> 
                    <div class="mb-4 text-center">
                        <button type="button" class="btn" style="border: 1px solid #FFB64D; color: #FFB64D; background-color: white">저장하기</button>
                        <button type="button" class="btn" id="leaveSubmit" style="background-color: #FFB64D; color: white">신청하기</button>
                    </div>
<!-- 	                </form> -->
	            </div>
	        </div>
	    </div>
<!-- 	</div> -->

<script>
	$(function(){
		getLeaveList();
	});
	
	$('#endDate').on('change', function(){
		var startStr = $('#startDate').val();
		var endStr = $('#endDate').val();
		
		var half = $('input:radio[name=leaveTime]:checked').val();
		
		var startDate = parseDate(startStr);
		var endDate = parseDate(endStr);
		var btMs = endDate.getTime() - startDate.getTime();
		var btDay = btMs / (1000*60*60*24) + 1;
		if(half != undefined){
			btDay = 0.5;
		}

		$('#requestDays').html(btDay);
	});
	
	
	$('#leaveSubmit').on('click', function(){
		var type = $('#leaveType option:selected').val();
		var startStr = $('#startDate').val();
		var endStr = $('#endDate').val();
		
		var half = $('input:radio[name=leaveTime]:checked').val();
		if(half == 'am'){
			type = 7;
		} else if(half == 'pm'){
			type = 8;
		}
		
		var content = $('#leaveContent').val();
	
		var startDate = parseDate(startStr);
		var endDate = parseDate(endStr);
		var btMs = endDate.getTime() - startDate.getTime();
		var btDay = btMs / (1000*60*60*24) + 1;
		if(half != undefined){
			btDay = 0.5;
		}
		
		var approval = $('#leaveApproval option:selected').val();
		
		var leave = {"type":type, "startDate":startStr, "endDate":endStr, "days":btDay, "content":content, "approval":approval};
		
		$.ajax({
			url: 'leaveRequest.le',
			data: leave,
			success: function(data){
				console.log('성공');
				
				$('#leaveModal').modal('hide');
				getLeaveList();
			},
			error: function(data){
				console.log('실패');
			}
		});
	});
	
	
	function parseDate(str){
	    var yStr = str.substring(0,4);
	    var mStr = str.substring(5,7);
	    var dStr = str.substring(8,10);
	    
	    return new Date(yStr, mStr, dStr);
	}
	
	function getLeaveList(){
		$.ajax({
			url: 'leaveList.le',
			success: function(data){
				console.log('휴가 요청 성공');
				console.log(data);
				
				if(data != null){
					var $tbody = $('#leaveTable').find('tbody');
					$tbody.html('');
					
					var length = data.list.length-1;
					
					for(var i = length; i > length-5; i--){
						$tr = $('<tr>');
						
						var typeStr = data.list[i].type;
						var $type;
						if(typeStr == 1){
							$type = $('<td>').text('연차');
						} else if(typeStr == 2){
							$type = $('<td>').text('반차');
						} else if(typeStr == 3){
							$type = $('<td>').text('경조사');
						} else if(typeStr == 4){
							$type = $('<td>').text('공가');
						} else if(typeStr == 5){
							$type = $('<td>').text('병가');
						} else if(typeStr == 6){
							$type = $('<td>').text('특별휴가');
						} else if(typeStr == 7){
							$type = $('<td>').text('오전반차');
						} else if(typeStr == 8){
							$type = $('<td>').text('오후반차');
						}
						
						$date = $('<td>').text(data.list[i].startDate + '~' + data.list[i].endDate);
						
						$approval = $('<td>');
						var approvalStr = data.list[i].approval;
						if(approvalStr == 'N'){
							$approvalDiv = $('<div>').text('반려').css({'background-color':'rgba(226, 54, 54, 0.1)', 'color':'#E23636', 'border-radius':'10px', 'width':'40px'});
						} else if(approvalStr == 'Y'){
							$approvalDiv = $('<div>').text('승인').css({'background-color':'rgba(13, 110, 253, 0.1)', 'color':'#0D6EFD', 'border-radius':'10px', 'width':'40px'});
						} else if(approvalStr == 'W'){
							$approvalDiv = $('<div>').text('대기').css({'background-color':'rgba(0, 177, 89, 0.1)', 'color':'#00b159', 'border-radius':'10px', 'width':'40px'});
						}
						
						$approval.append($approvalDiv);
						$tr.append($type);
						$tr.append($date);
						$tr.append($approval);
						$tbody.append($tr);
					}
				}
				
			},
			error: function(data){
				console.log('실패');
			}
		});
	}
	
</script>
</body>
</html>