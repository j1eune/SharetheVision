var draggedEventIsAllDay=false;
var activeInactiveWeekends = false;
var calendar = $("#calendar").fullCalendar({

 /** ******************
   *  OPTIONS
   * *******************/
  locale                    : 'ko',    
  timezone                  : "local", 
  nextDayThreshold          : "09:00:00",
  allDaySlot                : true,
  displayEventTime          : true,
  displayEventEnd           : true,
  firstDay                  : 0, //월요일이 먼저 오게 하려면 1
  weekNumbers               : false,
  selectable                : true,
  weekNumberCalculation     : "ISO",
  eventLimit                : true,
  views                     : { 
                                month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
                              },
  eventLimitClick           : 'week', //popover
  navLinks                  : true,
  defaultDate               : moment('2021-09-01'), //실제 사용시 현재 날짜로 수정
  timeFormat                : 'HH:mm',
  defaultTimedEventDuration : '01:00:00',
  editable                  : true,
  minTime                   : '',
  maxTime                   : '',
  slotLabelFormat           : 'MM/DD',
  weekends                  : true,
  nowIndicator              : true,
  dayPopoverFormat          : 'MM/DD dddd',
  longPressDelay            : 0,
  eventLongPressDelay       : 0,
  selectLongPressDelay      : 0,  
  header                    : {
                                left   : '',
                                center : 'title',
                                right  : 'prev,today,next',
                              },
  views                     : {
                                month : {
                                  columnFormat : 'dddd'
                                },
                                agendaWeek : {
                                  columnFormat : 'M/D ddd',
                                  titleFormat  : 'YYYY년 M월 D일',
                                  eventLimit   : false
                                },
                                agendaDay : {
                                  columnFormat : 'dddd',
                                  eventLimit   : false
                                },
                                listWeek : {
                                  columnFormat : ''
                                }
                              },
  customButtons             : { //주말 숨기기 & 보이기 버튼
                                viewWeekends : {
                                  text  : '',
                                  click : function () {
                                    activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                                    $('#calendar').fullCalendar('option', { 
                                      weekends: activeInactiveWeekends
                                    });
                                  }
                                },
                              },

  eventRender: function (event, element, view) {
	  
	 var eventType = event.type;
	 var eNo = event.description;
	 var eId = event._id;
	 
	 if(eventType=='1'){
		 eventType = '부서일정';
	 }else if(eventType=='2'){
		 eventType = '개인일정';
	 }
	  
    //일정에 hover시 요약
    element.popover({
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: event.title
      }).css({
        'background': event.backgroundColor,
        'color': event.textColor
      }),
      content: $('<div />', {
          class: 'popoverInfoCalendar'
      }).append('<p><strong>구분 : </strong> ' + eventType + '</p>')
        .append('<p><strong>번호 : </strong> ' + eNo + '</p>')
        .append('<div class="popoverDescCalendar"><strong> 등록 ID : </strong> ' + eId + '</div>'),
      delay: {
        show: "800",
        hide: "50"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
    });

    return true;
    // return filtering(event);

  },

  /* ****************
   *  일정 받아옴 
   * ************** */
  events: function (start, end, timezone, callback) {

	var eventId = $('#e-id');
	var edept = $("#e-dept");
	  //로그인시 세션에서 아이디 가져오기 (임시아이디)  
	  
    $.ajax({
      type: "get",
      url: "listCal",
      dataType: 'json',
      data: {
    	  // 화면이 바뀌면 Date 객체인 start, end 가 들어옴
    	  'startDate' : moment(start).format('YYYY-MM-DD'), 
		  'endDate'   : moment(end).format('YYYY-MM-DD'),
		  'eventId'   : eventId.val(),
		  'edept'	  : edept.val()
      },
      success: function (cList) {
    	  var jsonArray = new Array();
    	  var count = 0;
	      for (var i=0; i<cList.length; i++){
	    	var obj = new Object();
			obj._id 	= cList[i].mCode;
			obj.description	= cList[i].no;
			obj.title 	= cList[i].title;
			obj.start	= moment(cList[i].sDate).format('YYYY-MM-DD');
			obj.end		= moment(cList[i].eDate).add(1,'days').format('YYYY-MM-DD');
			obj.type	= cList[i].code;
			obj.textColor = '#ffffff'
			if(obj.type=='1'){
				obj.backgroundColor = '#660099';
			}else if(obj.type=='2'){
				obj.backgroundColor = '#FFB64D';
			}
			jsonArray.push( obj );
	      }
	      callback(jsonArray);
	  },
      error: function(response){
    	  console.log("select list error");
      }
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") $(".fc-content").css('height', 'auto');
  },

  select: function (startDate, endDate, jsEvent, view) {
	  
    $(".fc-body").unbind('click');
    $(".fc-body").on('click', 'td', function (e) {
    	
	//클릭한 날짜의 td위치(좌표) 가져오기 
	var $item = $(".fc-highlight").offset();
	
	$("#contextMenu")
		.addClass("contextOpened")
		.css({
		  display: "block",
		      left: $item.left-230, 
		      top: $item.top-610
		    });
		  return false;
	});

    var today = moment();

    //일정 등록 창에서의 날짜
    if (view.name == "month") {

      startDate = moment(startDate).format('YYYY-MM-DD');
      endDate = moment(endDate).subtract(1, 'days').format('YYYY-MM-DD');

    } else {
      startDate = moment(startDate).format('YYYY-MM-DD');
      endDate = moment(endDate).add(1,'days').format('YYYY-MM-DD');
    }

    //날짜 클릭시 카테고리 선택메뉴
    var $contextMenu = $("#contextMenu");
    
    $contextMenu.on("click", "a", function (e) {
      e.preventDefault();

      //닫기 버튼이 아닐때
      if ($(this).data().role !== 'close') {
        newEvent(startDate, endDate, $(this).html());
      }
      
      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

    $('body').on('click', function () {
      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

  },

  //이벤트 클릭시 수정이벤트
  eventClick: function (event, jsEvent, view) {
	  editEvent(event);
  }	
});