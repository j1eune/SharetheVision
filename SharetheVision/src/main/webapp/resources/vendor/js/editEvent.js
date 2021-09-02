var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
    $('#updateEvent').data('id', event.description); //클릭한 이벤트의  ID
    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.end === null) {
        event.end = event.start;
    }
    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD'));
    }
    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');
    
    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD'));
    editType.val(event.type);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {
        if (editStart.val() > editEnd.val()) {
            alert('시작일과 종료일을 확인해 주세요.');
            return false;
        }
        if (editTitle.val() === '') {
            alert('일정 이름을 입력하세요.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;
        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');
        event.title = editTitle.val();
        event.start = startDate;
        event.end = endDate;
        event.type = editType.val();
        event.description;

        var eventParam = {
        		"code"	: event.type,
        		"no"	: event.description,
        		"title"	: event.title,
        		"sDate"	: event.start,
        		"eDate"	: event.end,
        		"mCode" : event._id
        }
        
        if (event.start > event.end) {
            alert('시작일과 종료일을 확인하세요.');
            return false;
        }

        if (event.title === '') {
            alert('일정명을 작성해 주세요.');
            return false;
        }
        
        //일정 업데이트
        $.ajax({
        	type : 'POST',
            url: "updateCal",
            data: JSON.stringify(eventParam),
            contentType: "application/json",
            success: function (data) {
	            	 if(data=='success'){
		             alert('일정이 수정 되었습니다.');
		             location.reload();
	            	}
            },error: function(data){
            		 alert('일정을 등록한 사람만 수정할 수 있습니다.');
					 console.log(data);
            }
        });

    });
    
// 삭제버튼
    $('#deleteEvent').data('id', event.description); //클릭한 이벤트의  ID
    $('#deleteEvent').on('click', function () {
    	if(confirm('일정을 삭제하시겠습니까?')){
	    	var id = event.description;
	    	$('#deleteEvent').unbind();
	    	$("#calendar").fullCalendar('removeEvents', $(this).data('id'));
	    	eventModal.modal('hide');
	    	//삭제
	    	$.ajax({
	    		url: "deleteCal",
	    		data: { 'id': id },
	    		success: function (data) {
	    				if(data=='success'){
		    			alert('일정이 삭제되었습니다.');
	    				}
	    		}, error: function(data){
	    				alert('일정을 등록한 사람만 삭제할 수 있습니다.');
		    			console.log(data);
	    		}
	    	});
    	}
    	location.reload();
    });
};