<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<style>
	#prev, #next{cursor:pointer}
</style>

<jsp:include page="../common/common.jsp" />
</head>
<body>

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
	<div class="pcoded-container navbar-wrapper">    
		
		<!--  topMenu  -->
	    <jsp:include page="../common/topMenu.jsp" />           
	    <!--  sideMenu    -->        
	    <jsp:include page="../common/sideMenu.jsp" />
	
		<!-- main start -->
		<div class="pcoded-main-container">
		    <div class="pcoded-wrapper">
		        <div class="pcoded-content">
		            <div class="pcoded-inner-content">
		                <div class="main-body">
		                    <div class="page-wrapper">
		                       <!-- Page-body start -->
		                       <div class="page-body">
		                           <!-- Multiple Open Accordion start -->
		                           <div class="card">
		                               <div class="card-header">
		                                   <h5 class="card-header-text">주차별 출퇴근현황</h5>
		                               </div>
		                               <div class="card-block accordion-block">
	                                       <div id="accordion" role="tablist" aria-multiselectable="true">
	                                           <div class="panel">
	                                               <div class="accordion-heading" role="tab" id="headingOne">
	                                                   <h3 class="card-title accordion-title">
	                                                       <a class="accordion-msg" data-toggle="collapse"
	                                                       data-parent="#accordion" href="#collapseOne"
	                                                       aria-expanded="true" aria-controls="collapseOne">
	                                                       Lorem Message 1
	                                                       </a>
	                                                   </h3>
	                                               </div>
	                                               <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	                                                   <div class="accordion-content accordion-desc">
	                                                       <p>
	                                                           Lorem Ipsum is simply dummy text of the printing
	                                                           and typesetting industry. Lorem Ipsum has been
	                                                           the industry's standard dummy text ever since
	                                                           the 1500s, when an unknown printer took a galley
	                                                           of type and scrambled it to make a type specimen
	                                                           book. It has survived not only five centuries,
	                                                           but also the leap into electronic typesetting,
	                                                           remaining essentially unchanged. It was
	                                                           popularised in the 1960s with the release of
	                                                           Letraset sheets containing Lorem Ipsum passages,
	                                                           and more recently with desktop publishing
	                                                           software like Aldus PageMaker including versions
	                                                           of Lorem Ipsum.
	                                                       </p>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                           <div class="panel">
	                                               <div class="accordion-heading" role="tab" id="headingTwo">
	                                                   <h3 class="card-title accordion-title">
	                                                       <a class="accordion-msg" data-toggle="collapse"
	                                                       data-parent="#accordion" href="#collapseTwo"
	                                                       aria-expanded="false"
	                                                       aria-controls="collapseTwo">
	                                                       Lorem Message 2
	                                                       </a>
	                                                   </h3>
	                                               </div>
	                                               <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	                                                   <div class="accordion-content accordion-desc">
	                                                       <p>
	                                                           Lorem Ipsum is simply dummy text of the printing
	                                                           and typesetting industry. Lorem Ipsum has been
	                                                           the industry's standard dummy text ever since
	                                                           the 1500s, when an unknown printer took a galley
	                                                           of type and scrambled it to make a type specimen
	                                                           book. It has survived not only five centuries,
	                                                           but also the leap into electronic typesetting,
	                                                           remaining essentially unchanged. It was
	                                                           popularised in the 1960s with the release of
	                                                           Letraset sheets containing Lorem Ipsum passages,
	                                                           and more recently with desktop publishing
	                                                           software like Aldus PageMaker including versions
	                                                           of Lorem Ipsum.
	                                                       </p>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                           <div class="panel">
	                                               <div class=" accordion-heading" role="tab" id="headingThree">
	                                                   <h3 class="card-title accordion-title">
	                                                       <a class="accordion-msg" data-toggle="collapse"
	                                                       data-parent="#accordion" href="#collapseThree"
	                                                       aria-expanded="false"
	                                                       aria-controls="collapseThree">
	                                                       Lorem Message 3
	                                                       </a>
	                                                   </h3>
	                                               </div>
	                                               <div id="collapseThree" class="panel-collapse collapse show" role="tabpanel" aria-labelledby="headingThree">
	                                                   <div class="accordion-content accordion-desc">
	                                                       <p>
	                                                           Lorem Ipsum is simply dummy text of the printing
	                                                           and typesetting industry. Lorem Ipsum has been
	                                                           the industry's standard dummy text ever since
	                                                           the 1500s, when an unknown printer took a galley
	                                                           of type and scrambled it to make a type specimen
	                                                           book. It has survived not only five centuries,
	                                                           but also the leap into electronic typesetting,
	                                                           remaining essentially unchanged. It was
	                                                           popularised in the 1960s with the release of
	                                                           Letraset sheets containing Lorem Ipsum passages,
	                                                           and more recently with desktop publishing
	                                                           software like Aldus PageMaker including versions
	                                                           of Lorem Ipsum.
	                                                       </p>
	                                                   </div>
	                                               </div>
	                                           </div>
	                                       </div>
                                   		</div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>

<script>

	
</script>
	
</body>
</html>