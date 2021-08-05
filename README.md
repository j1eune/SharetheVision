# SharetheVision

<views/home.jsp> 
++<jsp:include> 추가
- <jsp:include page="/WEB-INF/views/common/common.jsp" />
- <jsp:include page="/WEB-INF/views/common/topMenu.jsp" />     
- <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />

<views/common>
++.jsp 파일 추가
- common.jsp : <head> CSS link, .js srcipt </head> 
- sideMenu.jsp : 사이드바 묶음  <nav class="pcoded-navbar"> 부터 </nav> 까지
- topMenu.jsp : 상단바 묶음  <nav class="navbar header-navbar pcoded-header"> 부터 </nav>까지
