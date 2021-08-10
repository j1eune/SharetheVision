# SharetheVision

<DB.sql> : + 테이블, 시퀀스 create 


<views/common> : + 파일추가 
+ common.jsp : CSS link, .js srcipt 분리 (script/Favicon icon) 부터 (concat.min.js/script)까지
+ sideMenu.jsp : 사이드바 분리 (nav class="pcoded-navbar") 부터 (/nav) 까지
+ topMenu.jsp : 상단바 분리  (nav class="navbar header-navbar pcoded-header") 부터 (/nav)까지

<views/home.jsp> : + include /  - 사이드바, 상단바, 스크립트
+ <jsp:include page="/WEB-INF/views/common/common.jsp" />
+ <jsp:include page="/WEB-INF/views/common/topMenu.jsp" />     
+ <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />


#
