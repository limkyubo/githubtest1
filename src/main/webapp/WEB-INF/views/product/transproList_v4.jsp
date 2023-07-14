<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
<!-- 본문시작 -->

<style>
	table {
		border-collapse: separate;
		border-spacing: 0 1rem;
	}
	
	th, td {
		padding-top: 10px;
		padding-right: 20px;
	}
</style>

<script>
	function updateDepartureCode(){
		const departureCodeElem = document.getElementById('departure_code'); //select 요소 가져오기
		const departureCode = departureCodeElem.value; //선택된 값 가져오기
		document.getElementById('departure_code_hidden').value = departureCode; //hidden input 값 업데이트
	}//updateDepartureCode() end
</script>

<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	 <br>
	 <h3><strong>항공/기차상품 선택</strong></h3>
	</div>
	
	<div class="container" style="padding-top: 20px">
		<input type="button" class="btn btn-success" value="상품등록" onclick="location.href='/product/transinfoList'">
	</div>
	
	<div class="container" style="align:center; padding-top: 10px"> 
	 <table>
	  <tr>
		<th style="text-align: center">출발일</th>		
		<td>
			<input type="text" name="departure_Date" id="departure_Date" size="10" maxlength="10" value="${departure_Date}">
		</td>
	  </tr>
	  <tr>
		<th style="text-align: center">출발지</th>
		<td>
			<select name="departure_code" id="departure_code" onchange="updateDepartureCode()">
				<option value="0">선택</option>
				<option value="G0001">제주</option>
				<option value="G0002">서울</option>
				<option value="G0003">인천</option>
				<option value="G0004">수원</option>
				<option value="G0005">가평</option>
				<option value="G0006">강릉</option>
				<option value="G0007">춘천</option>
				<option value="G0008">제천</option>
				<option value="G0009">대전</option>
				<option value="G0010">남원</option>
				<option value="G0011">군산</option>
				<option value="G0012">영월</option>
				<option value="G0013">부산</option>
				<option value="G0014">경주</option>
				<option value="G0015">포항</option>
				<option value="G0016">통영거제</option>
				<option value="G0017">목포</option>
				<option value="G0018">여수</option>
				<option value="G0019">전주</option>
			</select>
		</td>
		<th style="text-align: center">도착지</th>		
		<td>
			<c:choose>
				<c:when test="${arrival_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${arrival_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${arrival_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${arrival_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${arrival_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${arrival_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${arrival_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${arrival_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${arrival_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${arrival_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${arrival_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${arrival_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${arrival_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${arrival_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${arrival_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${arrival_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${arrival_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${arrival_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${arrival_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${arrival_code}
				</c:otherwise>	
			</c:choose>
			<!--<input type="text" name="arrival_code" id="arrival_code" size="10" maxlength="10" value="${city}">-->
		</td>
		<th style="text-align: center">
			<input type="hidden" name="departure_code_hidden" id="departure_code_hidden" value="${departure_code}"> <!-- 추가할 hidden input -->
			<input type="button" class="btn btn-primary" value="검색" onclick="location.href='depCodeSelect?departure_Date=${departure_Date}&arrival_code=${arrival_code}&departure_code=${departure_code_hidden.value}'" >
		</th>
	  </tr>	
	 </table>
	</div>
	
	<div class="container" style="padding-top: 20px">
	 <table class="table">
	  <thead>
	   <tr>
		<th class="text-center">항공/기차편명</th>
		<th class="text-center">항공/기차이름</th>
		<th class="text-center">출발일</th>
		<th class="text-center">출발지</th>
		<th class="text-center">도착지</th>
		<th class="text-center">출발시간</th>
		<th class="text-center">도착시간</th>		
		<th class="text-center">가격</th>
		<th class="text-center">잔여좌석</th>
		<th class="text-center">상품선택</th>		
		<th class="text-center">삭제</th>
	   </tr>
	  </thead>
	  
	  <tbody>
	   <c:forEach var="transpro" items="${transproList}">
	   <c:if test="${transpro.seat>0}"> <!-- seat이 0인 경우 상품이 뜨지 않도록 함 -->
	   <tr class="text-center">		
		<td>${transpro.trans_code}</td>
		<td>${transpro.trans_name}</td>
		<td>${transpro.departure_Date}</td>
		
		<td>
			<c:choose>
				<c:when test="${transpro.departure_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${transpro.departure_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${transpro.departure_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${transpro.departure_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${transpro.departure_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${transpro.departure_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${transpro.departure_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${transpro.departure_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${transpro.departure_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${transpro.departure_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${transpro.departure_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${transpro.departure_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${transpro.departure_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${transpro.departure_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${transpro.departure_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${transpro.departure_code}
				</c:otherwise>
			</c:choose>
		</td>		
		<td>
			<c:choose>
				<c:when test="${transpro.arrival_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${transpro.arrival_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${transpro.arrival_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${transpro.arrival_code}
				</c:otherwise>
			</c:choose>		
		</td>		
		<td>${transpro.departure_Time}</td>
		<td>${transpro.arrival_Time}</td>
		<td>${transpro.Price}</td>
		<td>${transpro.seat}</td>
		<td>
			<!--<input type="button" class="btn btn-warning" value="선택" onclick="location.href='transRsvInsert?transpro_code=${transpro.transpro_code}'">-->
			<input type="button" class="btn btn-warning" value="선택" onclick="transSelect('${transpro.transpro_code}','${departure_Date}','${arrival_code}','${arrival_Date}')">
		</td>
		<td>
			<!-- 삭제버튼은 판매자에게만 노출될 수 있게 해야함! -->
			<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${transpro.transpro_code}')">
		</td>		
	   </tr>
	   </c:if>
	   </c:forEach>
	  </tbody> 	
	 </table>	
	</div>		
</div>

<script>
	function confirmDelete(transpro_code){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='transproDelete?transpro_code='+transpro_code;
		}//if end
	}//confirmDelete() end
</script>

<script>
 function transSelect(transpro_code,departure_Date,arrival_code,arrival_Date){
	 //alert(transpro_code);
	 //alert(departure_Date);
	 //alert(arrival_code);
	 alert(arrival_date);
	 
	 let params="transpro_code=" + transpro_code +"&departure_Date=" + departure_Date + "&arrival_code=" + arrival_code + "&arrival_Date=" + arrival_Date;
	 alert(params);
	 
	 $.ajax({
		 url : "/product/transRsvInsert" //요청명령어
		 ,type : "get"
		 ,dataType : "text"
		 ,data: params
	 	 ,error : function(error){
	 		 alert("장바구니에 담을 수 없습니다" + error);
	 	 }//error callback함수
	 	 ,success : function(result){
	 		 alert(result);
	 	 }//success callback함수
	 });//ajax() end
	 
	 //hotelList 페이지로 이동
	 window.location.href = '/hotel/hotelList';
 }
</script>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>