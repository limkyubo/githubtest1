<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html>
<html>
<head>
<title>������ �Ұ� ����Ʈ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <a href="url"><img src="�̹������" border="0"></a>   -->

<h3>�������Ұ�</h3>
<form method="post" action="search">
		<input type="text" name="tour_name" value="${tour_name}">
		 <input type="submit" value="�˻�">
</form>
<table border="1">
	<tr>
		<!-- varStatus="���¿� ����" -->
		<c:forEach var="row" items="${list}" varStatus="vs">
			<td>
				<c:choose>
					<c:when test="${row.FILENAME != '-'}">
						<img src="/storage/${row.FILENAME}" width="100px">
					</c:when>
					<c:otherwise>
						��ϵ� ���� ����!<br>
					</c:otherwise>
				</c:choose>
				<br>
				�������� : <a href="attractionDetail/${row.TOUR_CODE}">${row.TOUR_NAME}</a>
			
			<!-- ���̺� �� �ٿ� 5�྿ -->
			<c:if test="${vs.count mod 3 == 0}">
				<tr></tr>
			</c:if>
		</c:forEach>
	</tr>
	</table>





<button type="button" onclick="location.href='attractionForm'">���</button>



</body>
</html>