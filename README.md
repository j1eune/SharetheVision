# SharetheVision

<views/common> : + 파일추가 
+ common.jsp : <head> CSS link, .js srcipt </head> 
+ sideMenu.jsp : 사이드바 묶음  <nav class="pcoded-navbar"> 부터 </nav> 까지
+ topMenu.jsp : 상단바 묶음  <nav class="navbar header-navbar pcoded-header"> 부터 </nav>까지

<views/home.jsp> : + include - 사이드바, 상단바, css, .js
+ <jsp:include page="/WEB-INF/views/common/common.jsp" />
+ <jsp:include page="/WEB-INF/views/common/topMenu.jsp" />     
+ <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />


#
