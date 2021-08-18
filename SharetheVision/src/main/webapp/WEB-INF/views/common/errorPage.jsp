<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<div style="text-align: center; padding: 15em 20em 20em 20em; ">
		<h1>Error Page</h1>
		<br>
		<hr>
		<h2 style="color:red;">[ ${message} ] </h2><br>
		<h2 style="color:gray;"> ${ requestScope['javax.servlet.error.message']}</h2>
	</div>
</body>
</html>