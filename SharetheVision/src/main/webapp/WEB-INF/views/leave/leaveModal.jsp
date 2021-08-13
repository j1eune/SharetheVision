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
	                <form>
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
	                        사용가능한 휴가 : 10 일 &nbsp;&nbsp;&nbsp;&nbsp; 신청한 휴가 : 2일
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-5">
	                            <label for="leavePeriod">휴가 기간</label>
	                            <input type="text" class="form-control datepicker" placeholder="시작일 년/월/일">
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="text-center my-auto">~</div>
	                        </div>
	                        <div class="form-group col-md-5">
	                            <label>&nbsp;</label>
	                            <input type="text" class="form-control datepicker" placeholder="시작일 년/월/일">
	                        </div>
	                    </div>
	                    <div class="form-group" id="half">
	                        <label>오전 / 오후</label>
	                        <div id="leaveTime">
	                            <input type="radio" name="leaveTime" id="am" checked />
	                            <label for="am">오전</label>
	                            
	                            <input type="radio" name="leaveTime" id="pm"/>
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
	                        <button type="submit" class="btn btn-block" style="background-color: #FFB64D; color:white">신청하기</button>
	                        <!-- <button type="button" class="btn btn-primary">저장하기</button> -->
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
<!-- 	</div> -->
</body>
</html>