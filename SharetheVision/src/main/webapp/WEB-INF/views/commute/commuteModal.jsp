<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SV Company</title>
<style>
	#commuteType input[type="radio"] {
		visibility: hidden;
		height: 0;
		width: 0;
	}
	
	#commuteType label {
		vertical-align: middle;
		text-align: center;
		cursor: pointer;
		background-color: white;
		color: #FFB64D;;
		border: 1px solid #FFB64D;;
		padding: 5px 10px;
		border-radius: 3px;
	}
	
	#commuteType input[type="radio"]:checked + label {
		background-color: #FFB64D;
		color: white;
	}
</style>
</head>
<body>

	<!-- 근태 수정요청 모달 -->
<!-- 	<div class="modal fade" id="overworkModal" tabindex="-1" role="dialog" aria-labelledby="overworkModalLabel" aria-hidden="true"> -->
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title mx-auto" id="commuteModalLabel">근태 변경 신청</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body mx-4">
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="commuteDate">근무 일시</label>
                            <input type="text" id="commuteDate" name="commuteDate" class="form-control datepicker" placeholder="시작일 년/월/일">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-5">
                            <label for="radio">근무 구분</label>
                            <div id="commuteType">
	                            <input type="radio" name="commuteType" id="late" value="1"/>
	                            <label for="late">지각</label>
	                            <input type="radio" name="commuteType" id="early" value="2"/>
	                            <label for="early">조퇴</label>
                        	</div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label>출근 시간</label>
                            <select class="form-control" id="coStartHour" name="coStartHour">
                           		<c:forEach var="i" begin="1" end="24">
	                            	<c:if test="${i == 9}">
	                            		<option value="09" selected>09</option>
	                            	</c:if>
	                            	<c:if test="${i != 9 && i < 10}">
		                            	<option value="0${i}">0${i}</option>
	                            	</c:if>
	                            	<c:if test="${i != 9 && i >= 10}">
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
                            <select class="form-control" id="coStartMin" name="coStartMin">
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
                            <label>퇴근 시간</label>
                            <select class="form-control" id="coEndHour" name="coEndHour">
	                            <c:forEach var="i" begin="1" end="24">
	                            	<c:if test="${i == 9}">
	                            		<option value="09" selected>09</option>
	                            	</c:if>
	                            	<c:if test="${i != 9 && i < 10}">
		                            	<option value="0${i}">0${i}</option>
	                            	</c:if>
	                            	<c:if test="${i != 9 && i >= 10}">
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
                            <select class="form-control" id="coEndMin" name="coEndMin">
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
                    <div class="form-group">
                        <label for="commuteContent">신청사유</label>
                        <textarea class="form-control" name="commuteContent" id="commuteContent" rows="6" placeholder="사유를 입력해주세요." style="resize: none;"></textarea>
                    </div>
                    <div class="form-row mb-3">
                        <div class="form-group col-md-6">
                            <label>결재자</label>
<!--                             <select class="form-control" id="coApproval"> -->
<!--                                 <option>선택해주세요.</option> -->
<!--                                 <option value="3">과장</option> -->
<!--                                 <option value="4">차장</option> -->
<!--                                 <option value="5">부장</option> -->
<!--                            </select> -->
                            <select class="form-control" id="coApproval">
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
                        <button type="button" class="btn" id="commuteSubmit" style="background-color: #FFB64D; color: white">신청하기</button>
                    </div>
	            </div>
	        </div>
	    </div>
<!-- 	</div> -->

<script>

	$('#commuteSubmit').on('click', function(){
		var startHour = $('#coStartHour').val();
		var startMin = $('#coStartMin').val();
		var endHour = $('#coEndHour').val();
		var endMin = $('#coEndMin').val();
		
		var start = startHour + ":" + startMin;
		var end = endHour + ":" + endMin;
		var status = $('input:radio[name=commuteType]:checked').val();
		var commuteDate = $('#commuteDate').val();
		var commuteContent = $('#commuteContent').val();
		var approval = $('#coApproval option:selected').val();
		
		var commute = {"status":status, "commuteStart":start, "commuteEnd":end, "enrollDate":commuteDate, "commuteContent":commuteContent, "approval":approval}
		
		$.ajax({
			url: 'commuteRequest.co',
			type: 'POST',
			data: commute,
			async: false,
			success: function(data){
				console.log('commute 요청 성공');
				
	            $('#commuteModal').modal('hide');
	            getCommuteList();
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	function getCommuteList(){
		$.ajax({
			url: 'selectApproval.ap',
			data: {type: "근태변경"},
			success: function(data){
				console.log('commute 리스트 성공');
				console.log(data);
				
				if(data != null){
					var $tbody = $('#coRequestTable').find('tbody');
					$tbody.html('');
					
					for(var i = 0; i < data.length; i++){
						if(i == 5){
							break;
						}
						
						$tr = $('<tr>');
						var arr = data[i].comment.split("\n");
						
						$type = $('<td>').text(afterSubstring(arr[0]));
						$date = $('<td>').text(afterSubstring(arr[1]));
												
						$approval = $('<td>');
						var approvalStr = data[i].apvStatus;
						if(approvalStr == 'D'){
							$approvalDiv = $('<div>').text('반려').css({'background-color':'rgba(226, 54, 54, 0.1)', 'color':'#E23636', 'border-radius':'10px', 'width':'40px', 'margin':'auto'});
						} else if(approvalStr == 'C'){
							$approvalDiv = $('<div>').text('승인').css({'background-color':'rgba(13, 110, 253, 0.1)', 'color':'#0D6EFD', 'border-radius':'10px', 'width':'40px', 'margin':'auto'});
						} else if(approvalStr == 'A'){
							$approvalDiv = $('<div>').text('대기').css({'background-color':'rgba(0, 177, 89, 0.1)', 'color':'#00b159', 'border-radius':'10px', 'width':'40px', 'margin':'auto'});
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
	
	function afterSubstring(str){
		var index = str.indexOf(":");
		var resultStr = str.substring(index+2);
		return resultStr;
	}
	
	$(function(){
		getCommuteList();
	});
	
	
</script>
</body>
</html>