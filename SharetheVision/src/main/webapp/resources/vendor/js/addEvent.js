var eventModal = $('#eventModal');
var eventId = $('#e-id');
var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');
var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


///* ****************
// *  context 클릭 이벤트, 카테고리 연계
// * ************** */
//$('#sccode li').on('click',function(){
//	var sccode = $(this).val(); 		
//	var sccolor = $('#edit-type option:selected').val();
//});



/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {
    if(eventType=='부서일정'){
    	eventType = '1';
    }else if(eventType=='개인일정'){
    	eventType = '2';
    }
    
    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    
    //카테고리 선택에 따라 selected 자동 선택
    var eType= $('#edit-type option:selected');
    var sccode= editType.val();
    	console.log("etypeval:",eType.val());
    if(eType.val()==1){
    	$('#edit-color option:eq(0)').attr('selected',true);
    }else if(eType.val()==2){
    	$('#edit-color option:eq(1)').attr('selected',true);
    }
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {
        
    	/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    	// var eventId = 1 + Math.floor(Math.random() * 1000);
    	/******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
	    console.log("id:",eventId.val());    
    	   	
        var eventData = {
            _id: eventId.val(),
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            type: editType.val(),
            // loginUser.getName() 넣을것 임시용 *************
            username: '테스트1',
            description: editDesc.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: true
        };
        
        var eventParam = {
        		"code"	: editType.val(),
//        		"no"    : editDesc.val(),
        		"title"	: editTitle.val(),
        		"sDate"	: editStart.val(),
        		"eDate"	: editEnd.val(),
        		"mCode" : eventId.val()
        }
        

        if (eventData.start > eventData.end) {
        	 alert('시작일과 종료일을 확인하세요.');
            return false;
        }

        if (eventData.title === '') {
        	alert('일정명을 작성해 주세요.');
            return false;
        }

        var realEndDay;

        if (event.end !== null) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).subtract(1, 'days').format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', true);
        eventModal.modal('hide');

        console.log("eData:",eventParam);
        //새로운 일정 저장
        $.ajax({
        	type : 'POST',
        	url: 'addCal',
        	data: JSON.stringify(eventParam),
            contentType: "application/json",
            success: function (data) {
            	alert('일정이 등록 되었습니다.');
            	console.log(data); 
            	location.reload();
            },error: function(data){
            	alert('일정 등록에 실패했습니다.');
				console.log(data);
				console.log("add error");
			}
        });
    });
};