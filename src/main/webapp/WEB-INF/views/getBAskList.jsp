<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>문의글 목록(${role})</title>
<!-- <link rel="stylesheet" href="/css/basic.css"> -->
<%@ include file="/resources/css/basic.css" %>

<style>

th{
	padding-top: 10px;
	padding-bottom: 10px;
}

td{
	padding-top:5px;
	padding-bottom: 5px;
}

.writebuttonsecc{
	text-align: right;
/* 	padding-bottom: 10px; */
	
	display: flex;
    justify-content: space-between;
    align-items: center;
}

.writebutton{
	font-family: 'MICEGothic Bold';
	width : 100px;
	height : 40px;
	padding: 1px 8px; 
	background-color: #92bd51;
	border-radius: 5px;
	border : 2px solid #749641;
	font-size: 18px;
	color : white;
}

.search{
	text-align: center;
}

.search input{
	font-siae:16px;
	width : 325px;
	padding : 9px;
	border: 2px solid #749641;
	outline: none;

}

.search select{
	font-family: 'MICEGothic Bold';
	padding: 8px;
	border : 2px solid #749641;
}

.searchbutton{
	font-family: 'MICEGothic Bold';
	width : 100px;
	height : 40px;
	padding: 1px 8px; 
	background-color: #92bd51;
	border-radius: 5px;
	border : 2px solid #749641;
	font-size: 18px;
	color : white;
}

.tr_1:hover {
	background-color : #eaeaea;
}

.tdTitle {
	display : block;
	width : 350px;
	overflow : hidden;
	text-overflow : ellipsis;
	white-space : nowrap;
}

</style>

</head>
<body>

<header>
<%@ include file="/header.jsp" %>
</header>

<div class="outline">

<br><br>
	
<%-- 	<c:set var="listCnt" value="0"></c:set> --%>
	<!-- ◆공통페이지 타이틀 -->
	<div class="c_page">
		<div class="title">문의글 목록(${role})</div>
	</div>
	
	<hr>
	
		<div class="writebuttonsecc">
			<c:if test="${role eq '회원'}">
				<h3></h3>
				<button class="writebutton" onclick="location.href='insertBAsk.zo?a=${role}'" style="margin-bottom: 10px;">글쓰기</button>
			</c:if>
			<c:if test="${role eq '브랜드'}">
				<h3>작성한 문의글</h3>
				<button class="writebutton" onclick="location.href='insertBAsk.zo?a=${role}'">글쓰기</button>
			</c:if>
		</div>
	
	<!-- 회원, 관리자 대상 목록 출력 -->
	<c:if test="${role ne '브랜드'}">
		<table>
			<c:if test="${role eq '관리자'}">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>답변자</th>
					<th>등록일</th>
					<th>문의상태</th>
				</tr>
			</c:if>
			<c:if test="${role ne '관리자'}">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>문의상태</th>
				</tr>
			</c:if>
			<c:if test="${role eq '회원'}">
				<c:forEach items="${askList}" var="ask"> <!-- items : 데이터를 레코드 단위로 반환, var : 변수 선언할 수 있는 속성 -->
					<tr>
						<td align="center">${ask.a_no}</td>
						<td><a class="tdTitle" href="getAsk.zo?a_no=${ask.a_no}&um_no=${ask.um_no}&bm_no=${ask.bm_no}&a_pmm=${ask.a_pmm}">${ask.a_title}</a></td>
	<%-- 					<td align="center">${ask.um_no}</td> --%>
						<td align="center">${ask.name_1}</td>
						<td align="center">${ask.a_date}</td>
						<td align="center">${ask.a_status}</td><!-- null값일 때는 처리전, 0일 때는 수정됨, 1일 때는 답변완료(처리완료)의 조건에 따라 다르게 출력되어야 함. -->
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${role eq '관리자'}">
				<c:forEach items="${askList}" var="ask"> <!-- items : 데이터를 레코드 단위로 반환, var : 변수 선언할 수 있는 속성 -->
					<tr>
						<td align="center">${ask.a_no}</td>
						<td><a class="tdTitle" href="getAsk.zo?a_no=${ask.a_no}&um_no=${ask.um_no}&bm_no=${ask.bm_no}&a_pmm=${ask.a_pmm}">${ask.a_title}</a></td>
<%-- 						<td align="center">${ask.bm_no}</td> --%>
						<td align="center">${ask.name_1}</td>
						<td align="center">${ask.name_2}</td>
						<td align="center">${ask.a_date}</td>
						<td align="center">${ask.a_status}</td><!-- null값일 때는 처리전, 0일 때는 수정됨, 1일 때는 답변완료(처리완료)의 조건에 따라 다르게 출력되어야 함. -->
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</c:if>
	
	<!-- 브랜드 대상 목록 출력 -->
	<c:if test="${role eq '브랜드'}">
		<!-- 브랜드가 쓴 글 -->
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>문의상태</th>
			</tr>
			
			<c:forEach items="${askList}" var="ask"> <!-- items : 데이터를 레코드 단위로 반환, var : 변수 선언할 수 있는 속성 -->
				<c:if test="${ask.a_pmm ne null}">
					<tr class="tr_1">
						<td align="center">${ask.a_no}</td>
						<td><a class="tdTitle" href="getAsk.zo?a_no=${ask.a_no}&um_no=${ask.um_no}&bm_no=${ask.bm_no}&a_pmm=${ask.a_pmm}">${ask.a_title}</a></td>
<%-- 						<td align="center">${ask.bm_no}</td> --%>
						<td align="center">${ask.name_1}</td>
						<td align="center">${ask.a_date}</td>
						<td align="center">${ask.a_status}</td><!-- null값일 때는 처리전, 0일 때는 수정됨, 1일 때는 답변완료(처리완료)의 조건에 따라 다르게 출력되어야 함. -->
					</tr>
<%-- 					<c:set var="listCnt" value="${listCnt + 1}"></c:set> --%>
				</c:if>
			</c:forEach>
<%-- 			<c:if test="${listCnt < 1}"> --%>
<!-- 				<tr class="tr_1"> -->
<!-- 					<td colspan="5" align="center">등록된 글이 없습니다.</td> -->
<!-- 				</tr> -->
<%-- 				<c:set var="listCnt" value="0"></c:set> --%>
<%-- 			</c:if> --%>
		</table>
		
		<!-- 브랜드가 받은 글 -->
		<h3>받은 문의글</h3>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>문의상태</th>
			</tr>
			<c:forEach items="${askList}" var="ask"> <!-- items : 데이터를 레코드 단위로 반환, var : 변수 선언할 수 있는 속성 -->
				<c:if test="${ask.um_no ne null}">
					<tr>
						<td align="center">${ask.a_no}</td>
						<td><a class="tdTitle" href="getAsk.zo?a_no=${ask.a_no}&um_no=${ask.um_no}&bm_no=${ask.bm_no}&a_pmm=${ask.a_pmm}">${ask.a_title}</a></td>
<%-- 						<td align="center">${ask.um_no}</td> --%>
						<td align="center">${ask.name_1}</td>
						<td align="center">${ask.a_date}</td>
						<td align="center">${ask.a_status}</td><!-- null값일 때는 처리전, 0일 때는 수정됨, 1일 때는 답변완료(처리완료)의 조건에 따라 다르게 출력되어야 함. -->
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</c:if>
	
	<br><br>
	
	<!-- 검색 기능 -->
	<form action="getBAskList.zo" method="post">
		<div class="search">
			<select name="searchCondition">
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit" class="searchbutton">검색</button>
		</div>
	</form>
	
	<br><br><br><br><br><br><br>

</div>

	<%-- 
	<center>
		<h1>문의글 목록</h1>
		<h3>${userName}님! 게시판에 오신 것을 환영합니다.. :) <a href="logout.me">로그아웃</a></h3>
		
		<!-- 검색 시작 -->
		<form action="getAskList.zo" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key}</option>
							</c:forEach>
						</select>
						<input type="text" name="searchKeyword">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->
		
		<!-- 목록 출력 -->
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">문의상태</th>
			</tr>
			<c:forEach items="${askList}" var="ask"> <!-- items : 데이터를 레코드 단위로 반환, var : 변수 선언할 수 있는 속성 -->
				<tr>
					<td align="center">${ask.a_no}</td>
					<td><a href="getAsk.zo?a_no=${ask.a_no}">${ask.a_title}</a></td>
					<td align="center">${ask.um_no}</td>
					<td align="center">${ask.a_date}</td>
					<td align="center">${ask.a_status}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		
		
		<a href="insertAsk.zo">문의쓰기</a>
		
	</center> 
	--%>
	
<footer>
<%@ include file="/footer.jsp" %>
</footer>
	
</body>
</html>