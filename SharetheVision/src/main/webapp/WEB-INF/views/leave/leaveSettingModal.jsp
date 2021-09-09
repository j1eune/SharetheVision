<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SV Company</title>
<style>
	.filebox label{
		display: inline-block;
		padding: .5em .75em;
/* 		color: #999; */
		color: #FFB64D;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: white;
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
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	
	#downloadLabel a{
		text-decoration: none;
		color: #FFB64D;
	}

</style>
</head>
<body>
	
<!-- 	<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="settingModalLabel" aria-hidden="true"> -->
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title mx-auto" id="settingModalLabel">전사 초기 연차 설정</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body mx-4">
					<form action="leaveSetting.le" method="post" enctype="Multipart/form-data">
						<div class="form-group row mt-2">
							<label for="uploadFile" class="col-sm-6 col-form-label">초기 설정 파일 등록</label>
							<div class="col-sm-6 filebox">
								<label for="uploadFile">
									<i class="icofont icofont-upload-alt"></i>
									<span>업로드</span>
								</label>
		            			<input type="file" name="uploadFile" id="uploadFile">
							</div>
						</div>
						<div class="form-group row">
							<label for="download" class="col-sm-6 col-form-label">샘플 양식 다운로드</label>
							<div class="col-sm-6 filebox">
								<label for="download" id="downloadLabel" >
									<i class="icofont icofont-download-alt"></i>
									<a href="<c:url value="/resources/leaveSetting/sample/sampleFile.xlsx"/>">다운로드</a>
								</label>
							</div>
						</div>
						<div class="form-group row mt-4">
							<div class="col-sm-12">
								<div class="mb-3">
									<i class="icofont icofont-info-circle"></i>
									<span>CSV파일 등록 시 주의 사항</span><br>
								</div>
								<span> - 사원ID : 각 사원의 사원 아이디를 입력</span><br>
								<span> - 입사일 : yyyy-mm-dd 형식으로 입사일을 입력</span><br>
								<span> - 총 연차 개수 : 현재까지 생성된 연차 개수를 입력</span><br>
								<span> - 내용 : 연차 등록에 대한 코멘트 입력</span>
								<span> - 연차종류 : [발생연차, 조정연차] 중 해당하는 한 가지를 입력</span>
								<span> 발생연차 : 근로기준법에 따른 연차</span>
								<span> 조정연차 : 1년미만의 연차, 특별휴가 등 추가로 발생하는 연차</span>
								<div class="mt-3">
									<i class="icofont icofont-mega-phone"></i>
									엑셀 파일을 꼭 <b>CSV(쉼표로 분리)</b> 형식으로 저장 후 업로드 해주세요
								</div>
							</div>
						</div>
						<div class="form-group row float-right mt-3">
							<div class="col-sm-10">
								<button type="submit" class="btn btn-sm" style="background-color : #FFB64D; color: white; font-size: 15px;">제출하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
	    </div>
<!-- 	</div> -->
	
</body>
</html>