<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                            <select class="form-control">
	                                <option>오전</option>
	                                <option>오후</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control">
	                                <option>1</option>
	                                <option>2</option>
	                                <option>3</option>
	                                <option>4</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">시</div>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control">
	                                <option>00</option>
	                                <option>01</option>
	                                <option>02</option>
	                                <option>03</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">분</div>
	                        </div>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-3">
	                            <label for="start">근무 종료 시간</label>
	                            <select class="form-control">
	                                <option>오전</option>
	                                <option>오후</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control">
	                                <option>1</option>
	                                <option>2</option>
	                                <option>3</option>
	                                <option>4</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">시</div>
	                        </div>
	                        <div class="form-group col-md-3">
	                            <label>&nbsp;</label>
	                            <select class="form-control">
	                                <option>00</option>
	                                <option>01</option>
	                                <option>02</option>
	                                <option>03</option>
	                            </select>
	                        </div>
	                        <div class="form-group col-md-1">
	                            <label>&nbsp;</label>
	                            <div class="mt-2">분</div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        총 근무 시간 : 2시간
	                    </div>
	                    <div class="form-group">
	                        <label for="leaveContent">신청사유</label>
	                        <textarea class="form-control" rows="6" placeholder="사유를 입력해주세요." style="resize: none;"></textarea>
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