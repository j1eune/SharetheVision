<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<title>SV Messenger</title>
<!-- Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="author" content="CodedThemes">
<!-- Messenger CSS -->
<link rel="stylesheet" type="text/css" href="resources/vendor/css/custom.css">
<!-- socket JS -->
<script src="https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js"></script>
</head>
<body>
<!-- 템플릿  공통 -->
<jsp:include page="/WEB-INF/views/common/common.jsp" />
<jsp:useBean id="now" class="java.util.Date" />
<!--  Messenger START  -->                    
<div class="container bootstrap snippets bootdey" id="toptop">
	<div class="row">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4> ${loginUser.name} 님의 SV Messenger </h4><br>
						<div class="portlet-widgets">
							<button class="listBtn text-c-white"><i class="ti-user"></i> 대화 목록 </button>
						</div>
						<div class="portlet-widgets">
							<select class="caret" id="toId" onchange="changeSelect()">
								<option value="" selected disabled>TO</option>
								<c:forEach items="${ tolist }" var= "to"> 
									<c:if test="${ to.name != loginUser.name}">  <!-- 본인은 제외시키기  -->
										<optgroup label="${ to.deptName } 팀 ">
											<c:if test="${ to.deptName eq '인사'}" >
												<option value="${ to.name }"> ${ to.jobName } ${ to.name }</option>	
											</c:if>
											<c:if test="${ to.deptName eq '마케팅' }" >
												<option value="${ to.name }"> ${ to.jobName } ${ to.name }</option>	
											</c:if>
											<c:if test="${ to.deptName eq '생산'}" >
												<option value="${ to.name }"> ${ to.jobName } ${ to.name }</option>	
											</c:if>
											<c:if test="${ to.deptName eq '영업'}" >
												<option value="${ to.name }"> ${ to.jobName } ${ to.name }</option>	
											</c:if>
											<c:if test="${ to.deptName eq '회계'}" >
												<option value="${ to.name }"> ${ to.jobName } ${ to.name }</option>	
											</c:if>
										</optgroup>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--    채팅창    -->
				<div id="data" class="chatContainer display-none panel-collapse">
					<div class="portlet-body chat-widget">
						<div class="msList" id="dataList"><!-- 이전의 대화 기록 --></div> 
						<div class="portlet-body">
							<hr>
							<div>
								<p class="text-center text-muted small">
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									Today is <c:out value="${today}"/> 
								</p>
							</div>
						</div>
						<div class="chattingNow"><!-- 현재 대화 데이터 --></div>
					</div>
					<div class="portlet-footer">
						<div class="row">
							<div>
								<textarea id="message" placeholder="메세지 입력"></textarea>
							</div>
							<div class="sendBtn">
								<button type="button" class="btn-mat bg-c-purple text-c-white" id="sendBtn">Talk</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 채팅 창 끝 -->
				 <!-- 채팅방 목록  시작-->
			    <div class="chatListContainer display-none">
			        <div class="chatTop">
			            <div style="padding: 10px; margin-left: 4px;"> - 대화 목록 -</div>
			        </div>
			        <div class="chatList">
						<div class="media enterRoomList"> <!-- 이전 대화목록 데이터 --></div> 
			        </div>
			    </div>
				<!-- 채팅방 목록 끝 -->
			</div>
	</div><!-- row -->
</div><!-- container -->  
<!--  Messenger END  -->          
<input type="hidden" id="hiddenRoomId"/> 
<input type="hidden" id="hiddenToId"/>  
<input type="hidden" id="readCount" value="1"/>  

<script>
$(document).ready(function() {
	var sock; //웹소켓 전역변수 설정
	
    // 채팅목록 버튼 누르면 열리기 / 채팅창 가리기
	$(".listBtn").on('click', function(){
		//채팅창
		if($('.chatContainer').hasClass("display-none")){
	    }else{             
	        $('.chatContainer').toggleClass("display-none");  
	         onClose();
	         $("#toId").val(""); //선택되어 있는 사람 있으면 null값 세팅
			 window.location.reload();
	    }
		//채팅목록(목록 열려있는 상태에서 목록 버튼)
	    if(!$('.chatListContainer').hasClass('display-none')){  
	    	getRoomList(); 
	    }else{
	    	$('.chatListContainer').toggleClass("display-none");
	    	getRoomList(); 
	    }
	});  
	
	$("#sendBtn").click(function() {
		sendMessage();
	});
	$('#message').keydown(function(key) {
		// 엔터키 입력시 메세지 전송
		if (key.keyCode == 13) {
			sendMessage(); 
		}
	});

	// 5초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
    setInterval(function(){
	    // 방 목록 불러오기 (업데이트)
	    getRoomList();
	    
    },5000); 
});
//document ready End/
	
	function connect() { 
		sock = new SockJS("<c:url value='/chat'/>");
		sock.onopen = onOpen; //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		sock.onmessage = onMessage; //메세지 수신시 출력 메소드
		sock.onclose = onClose; //웹소켓 연결 종료시  메소드
	}
	function onOpen() {
		console.log("sock open");
	}
	function onClose() {
		console.log("sock close");
	}
	
	//메세지 전송
	function sendMessage() {
		if($("#message").val() !='') {
			var data = {};
				data.userName = "${loginUser.name}";
				data.userId = "${loginUser.mId}";
				data.toId = $('#hiddenToId').val();
				data.roomId = $('#hiddenRoomId').val();
				data.isFirst = false;
				data.message = $("#message").val();
				
				sock.send(JSON.stringify(data));
				$("#message").val("");
		}else{
			$("#message").val('보내실 메세지를 입력 하세요');
		}
		window.scrollTo(0,document.body.scrollHeight);
	}
	//메세지 수신( evt:웹소켓 통해  들어온 메세지)
	function onMessage(evt) {
		var data = evt.data;
		$(".chattingNow").append(data);
		window.scrollTo(0,document.body.scrollHeight+10);
	}

	// select로 1:1 연결 -> toId 방 있는지 조회후 없으면 생성, 있으면 기록 불러오기
	function changeSelect(){
		if( $('.chatListContainer').hasClass("display-none")){
		}else{                                    
		     $('.chatListContainer').toggleClass('display-none');   
		}
		if(!$('.chatContainer').hasClass('display-none')){  
			onClose();
			window.location.reload();
		}else{
			 $('.chatContainer').toggleClass('display-none');  
		}
		
		var toId = $("#toId option:selected").val();
		var userName = "${ loginUser.name }";
		$.ajax({
				url: "createChat",
				data:{
					  "userName": userName,
					  "toId"  : toId
				},
				dataType: "json",
				success:function(data){
					    if(data!=null){
							console.log("새로운 메세지 CH 생성 성공");
					 		enterRoom(data);
						}else{
							alert("대화 연결에 실패했습니다.");
						}
				},
				error:function(data){
						console.log("exist room:",data);
			       		enterRoom(data);
				}	
		 });
	  }; 

	var roomId;
	var toId;
	//방번호 찾아서 들어간뒤 웹소켓 연결
	function enterRoom(obj){
		//List에서 들어왔을때
		if($('#toId option:selected').val()==''){
		       roomId = obj.getAttribute("rno");
		       toId = obj.getAttribute("tid");
		}else{
		//slectbox로 들어왔을때
		       roomId = obj.rno;
		       toId = obj.tid;
		}
		$("#hiddenRoomId").val(roomId);
		$("#hiddenToId").val(toId);

		// 현재 html에 추가되었던 동적 태그 전부 지우기
		$(".msList").html("");

		// 해당 채팅 방의 메세지 목록 불러오기
		$.ajax({
			url: "rno_"+roomId,
			data:{
			    "userName": "${loginUser.name}",
			    "toId"	  : toId,
			},
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success:function(data){
		    		$msList = $(".msList");
	                $msList.html("");
	              
	                if(data.length > 0){
	                // 읽지 않은 메세지 초기화
	                   countAll = 0;
		                for(var i in data){
		                // 태그 동적 추가
		                    if( "${loginUser.name}" == data[i].m_code){ //보낸 사람이 '나'이면 오른쪽에 표시
		                    	  
		                    	$li = $([
		                            '<li class="media right">'
		                            ,'    <div class="msj macro pull-right">'
		                            ,'        <div class="text text-r">'
		                            ,'            <p class="mychatp">fgg</p>'
		                            ,'            <p><small class="msToDate">21-08-27 오후08:59:23</small></p>'
		                            ,'        </div>'
		                            ,'    </div>'
		                            ,'</li>'
		                        ].join(''));   
		                      
		                    	$li.find(".mychatp").text(data[i].ms_content);
		                    	$li.find(".msToDate").text(data[i].ms_time);
		                      
		                    }else{ //보낸사람이 상대방이면 왼쪽에 표시
		                    	$li = $([
	                                '<li class="media">'
	                                ,'  <a class="pull-left" >'
	                                ,'      <img class="media-object img-circle img-chat" src="resources/assets/images/dp.png">'
	                                ,'  	<h4 class="media-heading"></h4>'
	                                ,'  </a>'
	                                ,'  <div class="media-body">'
	                                ,'        <div class="text text-r">'
	                                ,'            <p class="otherchatp">fgg</p>'
	                                ,'            <p><small class="msSendDate">21-08-27 오후08:59:23</small></p>'
	                                ,'        </div>'
	                                ,'  </div>'
	                                ,'</li>'
	                            ].join(''));
		                    
		                        $li.find(".otherchatp").text(data[i].ms_content);
		                        $li.find(".msSendDate").text(data[i].ms_time);
		                        $li.find(".media-heading").text(data[i].m_code);
	                        }
		                    $msList.append($li);
	  	                   }
		              }
		          window.scrollTo(0,document.body.scrollHeight);
				},
		error: function(data){
			console.log("enterRoom error");
		}
	});//ajax end( 채팅 데이터 로딩)
      // 웹소켓 연결 (소켓 서버 연결 시작)
      connect();
	}
   
	//채팅 방 열어주기
 	$(document).on("click", ".enterRoomList",function(){
        $(this).parent().parent().toggleClass("display-none");
        $(".chatContainer").toggleClass("display-none");
	}); 
  
	var countAll;	
	var readCount= $('#readCount').val();
	function getRoomList(){
	    // 채팅 방 목록 가져오기
	     $.ajax({
	        url:"chatRoomList",
	        data:{
	            "userName":"${loginUser.name}",
	            "readCount": readCount
	        },
	        dataType:"json",
	        contentType: "application/json; charset=utf-8",
	        success:function(data){
	            $chatList = $(".chatList");
	            $chatList.html("");
	            var $div;     // enterRoomList div 연결
	            var $img;     // 유저 프로필이미지
	            var $h4;      // 유저 아이디
	            var $divs;    // close label
	            var $new;    // new label
	            var $hr;
	            
	            if(data.length > 0){
					// 읽지 않은 메세지 초기화
					countAll = 0;
					// 태그 동적 추가
					for(var i in data){
						//로그인 상태일떄 (loginUser.name!=null)
						if(true){
							$div = $("<div class='enterRoomList' onclick='enterRoom(this);'>")
									.attr("rno", data[i].roomId).attr("tid",data[i].toId);
						}else{
						    $div = $("<div class='enterRoomList' onclick='enterRoom(this);'>")
						    		.attr("rno", data[i].roomId).attr("tid",data[i].toId);
						}
						$img = $("<img class='media-object img-circle img-chat' style='float:left'>").attr("src", "resources/assets/images/dp.png");
						$h4 = $("<h4 class='media-bottom'>").text(data[i].toId);
						$hr = $("<hr>");
						
						// 읽지 않은 메세지가  있을때!
						if(data[i].count != 0){
						    $new = $("<label class='label media-body label-warning'>").text("NEW ["+data[i].count +"]");
						}else{
							$new = $("<label class='label media-body label-default'>");
						}
						countAll += parseInt(data[i].count);
						
						//그룹톡방은 close 감추기
						if('900'+'${loginUser.deptNo}' != data[i].roomId){ 
							$divs = $("<input type='button' class='label media-body label-purple' id='closeLabel' value='X'>");
						}
						
						$div.append($img);
						$div.append($h4);
						$div.append($new);
						$div.append($divs);
						$div.append($hr);
						$chatList.append($div);
	                }
	            }
	            $("#readCount").val(countAll);
	        },
	        error: function(data){
	        	console.log("data",data);
	        }
	    });
	}

	$(document).on("click","#closeLabel",function(){
		if(confirm("선택한 대화 기록을 삭제하시겠습니까?")){
			$('.enterRoomList').off('click');
			$.ajax({
				url: "deleteRoom",
				data:{
				    "roomId": roomId
				},
				success:function(data){
					if(data=='success'){
						alert('기록 삭제 성공');
					}else{
						alert('기록 삭제 실패');
					}
				},
				error:function(data){
					console.log("기록 삭제 에러");
				}
			});
		}
		location.reload(true);
	});
	window.onunload = function() {
		$.ajax({
			type : "POST",
			url : "chatstatus"  
			,
			data : {
					"chatstat" : 0
			},
			async : false,
			success : function() {
						console.log("${chatstat}",chatstat);
						opener.location.reload();
			},
			error : function(xhr, status, error) {
						alert(error);
			}
		});
	}
</script> 
</body>
</html>