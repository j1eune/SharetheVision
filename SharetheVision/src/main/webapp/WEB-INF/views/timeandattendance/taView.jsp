<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="/WEB-INF/views/common/common.jsp" />
</head>
<body>
	<!--  topMenu  -->
    <jsp:include page="/WEB-INF/views/common/topMenu.jsp" />           
    <!--  sideMenu    -->        
    <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />

<!-- Bar Chart start -->
<div class="col-md-12 col-lg-6">
    <div class="card">
        <div class="card-header">
            <h5>Bar chart</h5>
            <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
            <div class="card-header-right">
            	<i class="icofont icofont-spinner-alt-5"></i>
            </div>
        </div>
        <div class="card-block">
            <div id="morris-bar-chart"></div>
        </div>
    </div>
</div>
</body>
</html>