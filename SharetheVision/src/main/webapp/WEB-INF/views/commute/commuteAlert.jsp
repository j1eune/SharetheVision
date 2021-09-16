<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SV Company</title>
</head>
<body>
	<script>
		alert('${msg}');
	    
	    if('${qr}' == 'qr'){
		    window.opener.location.href = '<c:out value="${pageContext.request.contextPath}"/>/${url}';
		    window.close()
	    } else {
		    location.href = '<c:out value="${pageContext.request.contextPath}"/>/${url}';
	    }
	</script>
</body>
</html>