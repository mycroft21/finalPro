<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function setpakageStatus(name){
	
	var myselect= "mySelect"+name;
	
	if(confirm("수정하시겠습니까?")==true){
	
		document.getElementById(name).status.value=document.getElementById(myselect).value;

		
		 document.forms(name).submit();
	}else{		return false;		}
	}
</script>
<title>Menu3</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			
			<table>
			<tr><th>제공자 id</th>
			<th>주소</th>
			<th>건물 사진</th>
			<th>일당 대여비</th>
			<th>대여 가능한 날짜 시작일</th>
			<th>대여 가능한 날짜 종료일</th>
			<th>제목</th>
			<th>내용</th>
			<th>수정</th>
			<th>상태</th>
			</tr>
			<c:forEach items="${ list}" var="vo">
		<tr><td>${vo.registerId }</td>
	<td>${vo.adress }</td>
	<td><img href="${vo.img }"></td>
	<td>${vo.bill }</td>
	<td>${vo.startDate }</td>
	<td>${vo.endDate }</td>
	<td>${vo.title }</td>
	<td>${vo.contents }</td>
	<td>${vo.packageStatus }</td>
		<td>
		<c:if test="${vo.packageStatus == '대여가능' }">
		<form action="myModifyRRB" method="post">
		<input type="hidden" name="codeNum" value="${vo.codeNum }">
		<input type="submit" name="mody" value="수정"></form>
		</c:if></td>
</tr>
</c:forEach>
		</table>		
			
			
			
			
			
			
			
			
			
		</div>
	</div>
</body>
</html>