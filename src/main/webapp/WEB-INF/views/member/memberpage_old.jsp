<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문시작 -->
<div class="col-sm-4">
	<c:choose>
		<c:when
			test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1' || s_mlevel == 'F1')}">
			<div style="text-align: center;">
				<div style="text-align: center; padding-top: 20px; margin-top: 10px;">					
					<table style="text-align: center; border="1">
					
						<tr align="center">
							<td style="vertical-align: top;"><img
								src="../images/loggedin.png" style="width: 25%;"><br>
								<strong>${mname}</strong>님
							</td>
						</tr>										
						<tr align="center">
							<td style="vertical-align: top;"><a href="memberlogout.do">[로그아웃]</a><br>
							</td>
						</tr>
						<tr align="center">
							<td style="vertical-align: top;"><a href="memberModify">[회원정보
									수정]</a><br></td>
						</tr>
						<tr align="center">
							<td style="vertical-align: top;"><a href="memberWithdraw">[회원
									탈퇴]</a><br></td>
						</tr>
						<tr align="center">
							<td style="vertical-align: top;">[최근 예약내역]<br>
							</td>
						</tr>							
						
					</table>
				</div>
			</div>
		</c:when>
	</c:choose>




</div>

<div class="col-sm-8">
	<c:choose>
		<c:when test="${!(empty s_id || empty s_passwd || s_mlevel == 'E1' || s_mlevel == 'F1')}">
			<div style="text-align: center; padding-top: 30px; margin-top: 10px; ">
				<h3>회원 마이페이지</h3>
				<hr>
				<h3>회원 예약 내역</h3>
				<br>
				<table border="1" cellpadding="2" cellspacing="2" width="300px" align="center">
<tbody>
<tr>
<td style="vertical-align: top;">예약일<br>
</td>
<td style="vertical-align: top;">예약번호<br>
</td>
<td style="vertical-align: top;">예약내용<br>
</td>
<td style="vertical-align: top;">예약상황<br>
</td>
</tr>
<tr>
<td style="vertical-align: top;"><br>
</td>
<td style="vertical-align: top;"><br>
</td>
<td style="vertical-align: top;"><br>
</td>
<td style="vertical-align: top;"><br>
</td>
</tr>
</tbody>
</table>
				
				
			</div>
		</c:when>
	</c:choose>


</div>



<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
