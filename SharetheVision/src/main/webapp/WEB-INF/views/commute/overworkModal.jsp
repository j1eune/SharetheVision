<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	                <form>
	                    <div class="form-row">
	                        <div class="form-group col-md-5">
	                            <label for="overworkType">근무 구분</label>
	                            <select class="form-control" id="overworkType">
	                                <option value="1">연장</option>
	                                <option value="2">야간</option>
	                                <option value="3">휴일</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-5">
	                            <label for="leavePeriod">근무 일시</label>
	                            <input type="text" class="form-control datepicker" placeholder="시작일 년/월/일">
	                        </div>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-3">
	                            <label for="start">근무 시작 시간</label>
	                            <select class="form-control" id="start">
	                                <option value="am">오전</option>
	                                <option value="pm">오후</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control" id="startHour">
	                            <c:forEach var="i" begin="1" end="12">
	                            	<c:if test="${i == 1}">
	                            		<option value="${i}" selected>${i}</option>
	                            	</c:if>
	                            	<c:if test="${i != 1}">
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
	                            <select class="form-control" id="startMin">
	                            <c:forEach var="i" begin="0" end="59">
	                            	<c:if test="${i == 0}">
	                            		<option value="${i}" selected>${i}</option>
	                            	</c:if>
	                            	<c:if test="${i != 0}">
		                            	<option value="${i}">${i}</option>
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
	                            <label for="end">근무 종료 시간</label>
	                            <select class="form-control" id="end">
	                                <option value="am">오전</option>
	                                <option value="pm">오후</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control" id="endHour">
	                            <c:forEach var="i" begin="1" end="12">
	                            	<c:if test="${i == 1}">
	                            		<option value="${i}" selected>${i}</option>
	                            	</c:if>
	                            	<c:if test="${i != 1}">
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
	                            <select class="form-control" id="endMin">
	                            <c:forEach var="i" begin="0" end="59">
	                            	<c:if test="${i == 0}">
	                            		<option value="${i}" selected>${i}</option>
	                            	</c:if>
	                            	<c:if test="${i != 0}">
		                            	<option value="${i}">${i}</option>
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
		                        <input type="text" class="form-control" id="totalOverwork" readonly>
	                    	</div>
	                    </div>
	                    <div class="form-group">
	                        <label for="leaveContent">신청사유</label>
	                        <textarea class="form-control" id="overworkContent" rows="6" placeholder="사유를 입력해주세요." style="resize: none;"></textarea>
	                    </div>
	                    <div class="form-row mb-3">
	                        <div class="form-group col-md-6">
	                            <label>결재자</label>
	                            <select class="form-control">
	                                <option>선택해주세요.</option>
	                                <option>팀장</option>
	                                <option>부장</option>
	                            </select>
	                        </div>
	                    </div> 
	                    <div class="mb-4 text-center">
<!-- 	                        <button type="button" class="btn btn-block" style="background-color: #FFB64D; color:white">신청하기</button> -->
	                        <button type="button" class="btn btn-block" id="overworkSubmit" style="background-color: #FFB64D; color:white">신청하기</button>
	                        <!-- <button type="button" class="btn btn-primary">저장하기</button> -->
	                    </div>
	                </form>
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
			
			$('#totalOverwork').val(resultHour + '시간' + resultMin + '분');

			if(start == end){
				if(resultHour < 0){
					alert('시간을 다시 선택해주세요.');
					$('#totalOverwork').val('');
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
		
	</script>
</body>
</html>