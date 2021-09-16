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

	<!-- 표준 외 근무 요청 모달 -->
<!-- 	<div class="modal fade" id="overworkModal" tabindex="-1" role="dialog" aria-labelledby="overworkModalLabel" aria-hidden="true"> -->
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title mx-auto" id="overworkModalLabel">표준 외 근무 신청</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body mx-4">
<!-- 	                <form action="owInsert.co" method="post"> -->
<!-- 	                <form> -->
	                    <div class="form-row">
	                        <div class="form-group col-md-5">
	                            <label for="overworkType">근무 구분</label>
	                            <select class="form-control" id="overworkType" name="type">
	                                <option value="1">연장</option>
	                                <option value="2">야간</option>
	                                <option value="3">휴일</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-5">
	                            <label for="leavePeriod">근무 일시</label>
	                            <input type="text" id="overworkDate" name="overworkDate" class="form-control datepicker" placeholder="시작일 년/월/일">
	                        </div>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-3">
	                            <label>근무 시작 시간</label>
	                            <select class="form-control" id="startHour" name="startHour">
                            		<c:forEach var="i" begin="1" end="24">
	                            	<c:if test="${i == 18}">
	                            		<option value="18" selected>18</option>
	                            	</c:if>
	                            	<c:if test="${i != 18}">
		                            	<option value="${i}">${i}</option>
	                            	</c:if>
	                           	 	</c:forEach>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">시</div>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control" id="startMin" name="startMin">
	                         	<c:forEach var="i" begin="0" end="59">
	                            	<c:if test="${i == 0}">
	                            		<option value="00" selected>00</option>
	                            	</c:if>
	                            	<c:if test="${i != 0}">
		                            	<c:if test="${ i > 0 && i < 10 }">
		                            		<option value="0${i}">0${i}</option>
		                            	</c:if>
		                            	<c:if test="${ i >= 10 }">
		                            		<option value="${i}">${i}</option>
		                            	</c:if>
	                            	</c:if>
	                            </c:forEach>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">분</div>
	                        </div>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-3">
	                            <label>근무 종료 시간</label>
	                            <select class="form-control" id="endHour" name="endHour">
	                            <c:forEach var="i" begin="1" end="24">
	                            	<c:if test="${i == 18}">
	                            		<option value="18" selected>18</option>
	                            	</c:if>
	                            	<c:if test="${i != 18}">
		                            	<option value="${i}">${i}</option>
	                            	</c:if>
	                            </c:forEach>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">시</div>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control" id="endMin" name="endMin">
	                            <c:forEach var="i" begin="0" end="59">
	                            	<c:if test="${i == 0}">
	                            		<option value="00" selected>00</option>
	                            	</c:if>
	                            	<c:if test="${i != 0}">
		                            	<c:if test="${ i > 0 && i < 10 }">
		                            		<option value="0${i}">0${i}</option>
		                            	</c:if>
		                            	<c:if test="${ i >= 10 }">
		                            		<option value="${i}">${i}</option>
		                            	</c:if>
	                            	</c:if>
	                            </c:forEach>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">분</div>
	                        </div>
	                    </div>
	                    <div class="form-row">
	                    	<div class="form-group col-md-5">
								<label for="overworkHour">총 근무 시간</label>
<!-- 								<div id="overworkTotalSpan"></div> -->
		                        <input type="text" id="overworkTotalSpan" name="overworkTotalSpan" class="form-control" readonly>
		                        <input type="hidden" id="overworkTotal" name="overworkTotal" class="form-control">
	                    	</div>
	                    </div>
	                    <div class="form-group">
	                        <label for="leaveContent">신청사유</label>
	                        <textarea class="form-control" name="overworkContent" id="overworkContent" rows="6" placeholder="사유를 입력해주세요." style="resize: none;"></textarea>
	                    </div>
	                    <div class="form-row mb-3">
	                        <div class="form-group col-md-6">
	                            <label>결재자</label>
	                            <select class="form-control" id="approval">
	                                <option>선택해주세요.</option>
									<c:forEach items="${mlist}" var="m">
										<c:if test="${m.mCode != loginUser.mCode}">
										
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
										</c:if>
									</c:forEach>
                            	</select>
	                        </div>
	                    </div> 
	                    <div class="mb-4 text-center">
	                        <button type="button" class="btn" style="border: 1px solid #FFB64D; color: #FFB64D; background-color: white">저장하기</button>
	                        <button type="button" class="btn" id="overworkSubmit" style="background-color: #FFB64D; color: white">신청하기</button>
	                    </div>
<!-- 	                </form> -->
	            </div>
	        </div>
	    </div>
<!-- 	</div> -->

<script>

	function overworkHour(){
		var start = $('#start option:selected').val();
		var startHour = parseInt($('#startHour option:selected').val());
		var startMin = parseInt($('#startMin option:selected').val());
		var end = $('#end option:selected').val();
		var endHour = parseInt($('#endHour option:selected').val());
		var endMin = parseInt($('#endMin option:selected').val());
		
		var resultHour;
		var resultMin;
		
		if((start=='pm' && end=='am') || (start == 'am' && end == 'pm')){
			endHour = 12 + endHour;
		}
		
		if(startMin > endMin){
			resultHour = (endHour-startHour-1);
			resultMin = (60 - (startMin-endMin));
		} else {
			resultHour = (endHour-startHour);
			resultMin = (endMin-startMin);
		}
		
		$('#overworkTotalSpan').val(resultHour + '시간' + resultMin + '분');
		$('#overworkTotal').val(resultHour + (resultMin/100));
		console.log(resultHour + (resultMin/100))

		if(start == end){
			if(resultHour < 0){
				alert('시간을 다시 선택해주세요.');
				$('#overworkTotalSpan').val('');
			}			
		}
		console.log(resultHour + '시간' + resultMin + '분');
	}
	
	$('#endMin').on('blur', function(){
		overworkHour();
		
		$('#start, #startHour, #startMin, #end, #endHour').on('blur', function(){
			overworkHour();
		});
	});
	
	$('#overworkContent').on('click', function(){
		overworkHour();
	});
	
	$('#overworkSubmit').on('click', function(){
		var startHour = $('#startHour').val();
		var startMin = $('#startMin').val();
		var endHour = $('#endHour').val();
		var endMin = $('#endMin').val();
		
		var start = startHour + ":" + startMin;
		var end = endHour + ":" + endMin;
		var type = $('#overworkType').val();
		var date = $('#overworkDate').val();
		var overworktime = $('#overworkTotal').val();
		var overworkContent = $('#overworkContent').val();
		var approval = $('#approval option:selected').val();
		
		var overwork = {"type":type, "overworkStart":start, "overworkEnd":end, "overworktime":overworktime, "overworkDate":date, "overworkContent":overworkContent, "approval":approval}
		
		$.ajax({
			url: 'owInsert.co',
			type: 'POST',
			data: overwork,
			async: false,
			success: function(data){
				console.log('성공');
				
	            $('#overworkModal').modal('hide');
	            getOverworkList();
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	function getOverworkList(){
		$.ajax({
			url: 'overworkList.co',
			success: function(data){
				console.log('성공');
				console.log(data);
				
				if(data != null){
					var $tbody = $('#overworkTable').find('tbody');
					$tbody.html('');
					
					var length = data.list.length-1;
					
					for(var i = length; i > length-5; i--){
						$tr = $('<tr>');
						$date = $('<td>').text(data.list[i].overworkDate);
						$time = $('<td>').text(data.list[i].overworkStart + ' ~ ' + data.list[i].overworkEnd);
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
						$tr.append($date);
						$tr.append($time);
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
	
	$(function(){
		getOverworkList();
	});
	
	
</script>
</body>
</html>