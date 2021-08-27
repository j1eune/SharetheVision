<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	color: #FFB64D;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
 	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #FFB64D;
/* 	border: 1px solid #ebebeb; */
/* 	border-bottom-color: #e2e2e2; */
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */ 
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

</style>
</head>
<body>

<!-- 	<div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="leaveModalLabel" aria-hidden="true"> -->
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title mx-auto" id="settingModalLabel">연차 설정</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                	<span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body mx-4">
					<div class="form-group row">
						<label for="uploadFile" class="col-sm-6 col-form-label">초기 설정 파일 등록</label>
						<div class="col-sm-6 filebox">
							<label for="uploadFile">
								<i class="icofont icofont-upload-alt"></i>
								업로드
							</label>
	            			<input type="file" name="uploadFile" id="uploadFile">
						</div>
					</div>
					<div class="form-group row">
						<label for="download" class="col-sm-6 col-form-label">샘플 양식 다운로드</label>
						<div class="col-sm-6 filebox">
							<label for="download">
								<i class="icofont icofont-download-alt"></i>
								다운로드
							</label>
	            			<input type="file" name="download" id="download">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12">
							<div class="mb-2">
								<i class="icofont icofont-info-circle"></i>
								<span>CSV파일 등록 시 주의 사항</span><br>
							</div>
							<span> - 사원ID : 각 사원의 사원 아이디를 입력</span><br>
							<span> - 입사일 : yyyy-mm-dd 형식으로 입사일을 입력</span><br>
							<span> - 총 연차 개수 : 현재까지 생성된 연차 개수를 입력</span><br>
							<span> - 사용 연차 개수 : 생성된 연차 개수 중 사용한 연차 개수를 입력</span>
						</div>
					</div>
					<div class="form-group row float-right">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-sm btn-primary">제출하기</button>
						</div>
					</div>
				</div>
				<div class="modal-footer">
<!-- 					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				</div>
			</div>
	    </div>
<!-- 	</div> -->

</body>
</html>