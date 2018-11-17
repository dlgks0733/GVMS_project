<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: macbookpro
  Date: 2017. 2. 6.
  Time: PM 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--이 DTD는 모든 HTML 요소와 속성을 포함하며 프레젠테이션 및 비추천 요소 (예 : 글꼴)를 포함합니다. 프레임 세트는 허용되지 않습니다.
http://www.w3schools.com/TAgs/tag_doctype.asp --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
<title>Error_Common</title>
</head>
<body>
	<h4>${exception.getMessage()}</h4>

	<ul>
		<c:forEach items="${exception.getStackTrace()}" var="stack">
			<li>${stack.toString()}</li>
		</c:forEach>
	</ul>
</body>
</html>