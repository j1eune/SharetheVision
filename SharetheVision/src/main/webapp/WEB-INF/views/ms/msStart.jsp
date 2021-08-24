<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title> SV Messenger </title>
 <!-- Meta -->
 <script src="https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
 <meta name="author" content="CodedThemes">
<!-- Messenger CSS -->
<link rel="stylesheet" type="text/css" href="resources/vendor/css/custom.css">
</head>
<body>
<!-- 템플릿  공통 -->
<jsp:include page="/WEB-INF/views/common/common.jsp" />
<!--  Messenger START  -->                    
<div class="container bootstrap snippets bootdey" id="toptop">
	<div class="row">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4> ${loginUser.name} 님의 SV Messenger </h4><br>
					</div>
					<div class="portlet-widgets">
						<button class="chatIcon btn-mini bg-c-dblue text-c-white">LIST</button>
					</div>
					<div class="portlet-widgets">
						<select class="caret" id="toId" name="toId">
							<option selected disabled>-- 수신인 --</option>
							<c:forEach items="${ tolist }" var= "to"> 
								<c:if test="${ to.name != loginUser.name}">  <!-- 본인은 제외시키기  -->
									<optgroup label="${ to.deptName } 팀 ">
										<c:if test="${ to.deptName eq '인사'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '마케팅' }" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '생산'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '영업'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
										<c:if test="${ to.deptName eq '회계'}" >
											<option value="${ to.mId }"> ${ to.jobName } ${ to.name }</option>	
										</c:if>
									</optgroup>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--    채팅창    -->
				<div id="data" class="chatContainer panel-collapse">
					<div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: auto;">
						<div class="row">
							<div class="col-lg-12">
								<p class="text-center text-muted small">January 1, 2014 at 12:23 PM</p>
							</div>
						</div>
						<div class="msList">
						
							
							
						</div> 
						<hr>
					</div>
					<hr>
					<div class="portlet-footer">
						<div class="row" style="height: 100px !important;">
							<div class="col-sm-10">
								<textarea id="message" style="width:17em; resize:none;"rows=4 placeholder="메세지 입력"></textarea>
							</div>
							<div class="col-sm-2" style="margin-bottom: 3px;">
								<button class="btn-mat bg-c-dblue text-c-white" onclick="" id="">File</button><br>
								<button type="button" class="btn-mat bg-c-purple text-c-white" id="sendBtn">Send</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 채팅 창 끝 -->
				 <!-- 채팅방 목록  시작-->
			    <div class="chatListContainer " style="display:none;">
			        <div class="chatTop">
			            <div style="padding: 10px; margin-left: 4px;"> - 대화 목록 -</div>
			        </div>
			        <div class="chatList">
						<div class="media enterRoomList"></div> 
			        </div>
			    </div>
				<!-- 채팅방 목록 끝 -->
			</div>
	</div><!-- row -->
</div><!-- container -->    
<!--  Messenger END  -->          

<script>
$(document).ready(function() {
    // 채팅목록 버튼 누르면 열리기 / 채팅창 가리기
	$(".chatIcon").on('click', function(){                	     
    	if($('.chatContainer').css("display") == "none"){       
    	 	$('.chatListContainer').toggle();  
        }else{                                                   
            //$('.chatContainer').toggleClass('display-none');   
            websocket.close();
        }
        if(!$('.chatListContainer').hasClass('display-none')){  
            getRoomList();                                       
        }
     });  
     
	$("#sendBtn").click(function() {
		sendMessage();
	});
	$('#message').keydown(function(key) {
		if (key.keyCode == 13) {
			sendMessage();
		}
	});
	// 2초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
	      setInterval(function(){
	          // 방 목록 불러오기
	          getRoomList();
	          
	          // 읽지 않은 메세지 총 갯수가 0개가 아니면
	          if(countAll != 0){
	              // 채팅 icon 깜빡거리기
	              $('.chatIcon').addClass('iconBlink');
	              //play();
	          }else{
	              // 깜빡거림 없애기
	              $('.chatIcon').removeClass('iconBlink');
	          }
	      },6400000);//잠깐 늦춰놓음
	      
});//document ready end
	
/* 	//웸소켓을 지정한 url로 연결
	sock = new SockJS("<c:url value='/chat'/>");
	//데이터가 나한테 수신시 호출 메소드
	sock.onmessage = onMessage;
	//웹소켓 연결시  메소드
	sock.onopen = onOpen; */
	
	var sock; //웹소켓 전역변수 설정
    function connect() { //입장 버튼을 눌렀을 때 호출되는 함수
       	sock = new SockJS("<c:url value='/chat'/>");  // 웹소켓 주소
        sock.onopen = onOpen; //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
        sock.onmessage = onMessage;
    	sock.onclose = onClose; //웹소켓 연결 종료시  메소드
    	
       // sock.log(websocket.send);
    }
	
	function onOpen() {		
	};
	
	//메세지 전송
	function sendMessage() {
		if ($("#message").val() != '') {
			var data = {};
			data.userId = "${loginUser.name}";
			data.roomId = "${roomId}";
			data.isFirst = false;
			data.message = $("#message").val();
			
			sock.send(JSON.stringify(data));
			
			$("#message").val("");
		}
	}
	//메세지 수신( evt:웹소켓 통해  들어온 메세지)
	function onMessage(evt) {
		var data = evt.data;
		$("#data").append(data);
		autoScroll();
	}
	function onClose(evt) {
		//sock.send('${loginUser.mId} 님이 퇴장하셨습니다');
	}

	window.onunload = function() {
		$.ajax({
			type : "POST",
			url : "chatstatus.ms"  
			,
			data : {
				"chatstat" : 0
			},
			async : false,
			success : function() {
				console.log("${chatstatus }");
				opener.location.reload();
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	}
	
	<!-- 채팅 방 관련 -->
    var roomId;
    // 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
    function enterRoom(obj){
        // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
        var roomId = obj.getAttribute("id");

        // 현재 html에 추가되었던 동적 태그 전부 지우기
        $('.msList').html("");
        
        // 해당 채팅 방의 메세지 목록 불러오기
        $.ajax({
			url: roomId + ".ms",
			data:{
			    userEmail:"${loginUser.mId}"
			},
			async:false,
			dataType:"json",
			success:function(data){
			    	$msList = $(".msList");
	                $msList.html("");
	                console.log("enterRoom data>>>>>", data)
	                var $div;     	// 상단 div 연결
	                var $divm;	  	// media 태그
	                var $aa;	  	// a 태그
	                var $img;    	// 프로필이미지
	                var $h4;	 	// 유저 이름
	                var $span;		// 보낸시간
	                var $pp;		// 메세지
	                var $hr;		// 한줄 태그
	                
	                if(data.length > 0){
	                    // 읽지 않은 메세지 초기화
	                    countAll = 0;
	                    
	                    // 태그 동적 추가
	                    for(var i in data){
	                    	
	                    	$div = $("<div class='row'>");
	                    	$divm = $("<div class='media'>");
	                    	$aa = $('<a class="pull-left">');
	                        $img = $("<img class='media-object img-circle img-chat'>").attr("src", "resources/assets/images/dp.png");
	                        $h4 = $("<h4 class='media-heading'> ").text(data[i].m_code2);
	                        $span = $('<span class="small pull-right">').text(data[i].ms_time);
	                        $pp = $('<p>').text(data[i].ms_content);
	                        $hr = $("<hr>");
	                        
	                        $div.append($divm);
	                        $div.append($aa);
	                        $div.append($img);
	                        $div.append($h4);
	                        $div.append($span);
	                        $div.append($pp);
	                        $div.append($hr);
	                        
	                        $msList.append($div);
	                        
	                        console.log(">>>",$msList);
	                    }
	              }
			    
			},
			error: function(data){
				console.log('enterRoom error');
			}
        });
         
         // 웹소켓 연결
         connect();
         console.log("enterRoom");
    }
    
    // 채팅 방 열어주기
    $(document).on("click", ".enterRoomList",function(){
         $(".chatContainer").toggle();
         $(this).parent().parent().toggle();
         // 이름 추가
         $("#setName").html($(this).children('div').html());
         // 사진 추가
         $("#setPic").attr("src",$(this).children('img').attr('src'));
         // 스크롤바 아래 고정
        $('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
       
    });

	<!-- 채팅 목록 관련 -->
    // 총 읽지 않은 갯수
    let countAll = 0;
    
    function getRoomList(){
        // 채팅 방 목록 가져오기
         $.ajax({
            url:"chatRoomList.ms",
            data:{
                userId:"${loginUser.mId}"
            },
            dataType:"json",
            async:false, // async : 비동기를 동기로 처리 
            success:function(data){
            	
                $chatList = $(".chatList");
                $chatList.html("");
                
                var $div;     // enterRoomList div 연결
                var $img;     // 유저 프로필이미지
                var $divs;    // header div
                var $h4;    // 유저 아이디
                var $hr;
                //var $span;    // 시간
                
                if(data.length > 0){
                    // 읽지 않은 메세지 초기화
                    countAll = 0;
                    
                    // 태그 동적 추가
                    for(var i in data){
                    	
                    	//로그인 상태일떄 (loginUser.name!=null)
                    	if(true){
	                    	console.log("true");
                            $div = $("<div class='enterRoomList' onclick='enterRoom(this);'>").attr("id",data[i].rno).attr("userId",data[i].tid);
                        }else{
                            $div = $("<div class='enterRoomList' onclick='enterRoom(this);'>").attr("id",data[i].rno).attr("userId",data[i].tid);
                        }
                    	
                        $img = $("<img class='media-object img-circle img-chat'>").attr("src", "resources/assets/images/dp.png");
                        $divs = $("<div class='media-body'>");
                        $h4 = $("<h4 class='media-heading'> ").text(data[i].tid);
                        $hr = $("<hr>");
                        // 읽지 않은 메세지가  있을때!
                       /*  if(data[i].count != 0){
                            $span = $("<span class='notRead'>").text(data[i].count);
                        }else{
                            $span = $("<span>");
                        } */
                        // String을 int로 바꿔주고 더해준다.
                        //countAll += parseInt(data[i].count);
                        
                        $div.append($img);
                        $div.append($divs);
                        $div.append($h4);
                        //$div.append($span);
                        $div.append($hr);
                        $chatList.append($div);
                        
                        console.log(">>>",$chatList);
                    }
                }
            },
            error: function(data){
            	console.log("채팅목록 가져오기 ajax 실패");
            	console.log("data",data);
            }
        });
    }
    
/*     function CheckLR(data) {
        // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
        const LR = (data.email != "${ loginUser.email }") ? "left" : "right";
         // 메세지 추가
        appendMessageTag(LR, data.email, data.message, data.name);
    }     
               
    // 메세지 태그 추가
    function appendMessageTag(LR_className, email, message, name) {
        
        const chatLi = createMessageTag(LR_className, email, message, name);
     
        $('div.chatMiddle:not(.format) ul').append(chatLi);
     
        // 스크롤바 아래 고정
        $('div.chatMiddle').scrollTop($('div.chatMiddle').prop('scrollHeight'));
    }
     
    // 메세지 태그 생성
    function createMessageTag(LR_className, email, message, name) {
     
         // 형식 가져오기
         let chatLi = $('div.chatMiddle.format ul li').clone();
     
         chatLi.addClass(LR_className);              // left : right 클래스 추가
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.sender span').text(name);      // 이름 추가
         chatLi.find('.message span').text(message); // 메세지 추가
     
         return chatLi;
    } */
    
    
	// 자동스크롤 내리기
	function autoScroll() {
		$(document).scrollTop($('#data').height());
	}
	
</script>
  

  
</body>
</html>