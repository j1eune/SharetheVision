<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                        <div class="form-group col-md-5">
                            <label for="leavePeriod">휴가 기간</label>
                            <input type="text" id="startDate" class="form-control datepicker" placeholder="시작일 년/월/일">
                        </div>
                        <div class="form-group col-md-1">
                            <label>&nbsp;</label>
                            <div class="text-center my-auto">~</div>
                        </div>
                        <div class="form-group col-md-5">
                            <label>&nbsp;</label>
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
                            <select class="form-control">
                                <option>선택해주세요.</option>
                                <option>팀장</option>
                                <option>부장</option>
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
		
		console.log(type + " : 타입");
		console.log(startStr + " : 시작");
		console.log(endStr + " : 끝");
		console.log(startDate + " : 시작날짜");
		console.log(endDate + " : 끝날짜");
		console.log(btDay + " : 며칠");
		
		var leave = {"type":type, "startDate":startStr, "endDate":endStr, "days":btDay, "content":content};
		
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
				console.log('성공');
				console.log(data);
				
				var $tbody = $('#leaveTable').find('tbody');
				$tbody.html('');
				
				var length = data.list.length-1;
				
				for(var i = length; i > length-5; i--){
					console.log('반복');
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
					
					$date = $('<td>').text(data.list[i].startDate + ' ~ ' + data.list[i].endDate);
					
					var approvalStr = data.list[i].approval;
					if(approvalStr == 'N'){
						$approval = $('<td>').text('반려');
					} else if(approvalStr == 'Y'){
						$approval = $('<td>').text('승인');
					} else if(approvalStr == 'W'){
						$approval = $('<td>').text('대기');
					}
					
					$tr.append($type);
					$tr.append($date);
					$tr.append($approval);
					$tbody.append($tr);
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