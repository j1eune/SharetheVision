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
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
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
<!-- 	            	 <div class="filebox"> -->
<!-- 	            	 	<label for="ex_file">업로드</label> -->
<!-- 	            	 	<input type="file" id="ex_file"> -->
<!-- 	            	 </div> -->
					<form action="leaveSetting.le" method="post" enctype="Multipart/form-data">
		            	<input type="file" name="uploadFile">
						<button type="submit" class="btn btn-primary">제출하기</button>
					</form>
	            </div>
				<div class="modal-footer">
<!-- 					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				</div>
			</div>
	    </div>
<!-- 	</div> -->

</body>
</html>