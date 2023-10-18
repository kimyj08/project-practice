<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의글 상세</title>
<!-- <link rel="stylesheet" href="/css/basic.css"> -->
<%@ include file="/resources/css/basic.css" %>

<style>
.img-back{
	width : 40px;
	height: 40px;
	float: left;
	margin-right: 10px;
}

.Commudetailtitle{
	font-family: 'KoPubWorldDotum';
	font-size : 23px;
	border: 0px;
	font-weight: bold;
	padding-top : 5px;
	padding-bottom : 10px;
	width : 100%
}

a, p{
	font-family: 'KoPubWorldDotum';
	font-size: 13px;
/* 	padding-right: 30px; */
}

.Commudetailproperty{
	padding-bottom: 10px;
	text-align : right;
}

.Commudetailproperty > a {
	padding : 0px 5px;
}

textarea{
	width: 100%;
	border: 0px;
	font-family: 'KoPubWorldDotum';
}

.updatebu{
	padding: 12px 20px; 
	font-size: 17px;
	border : 1px solid black;
	border-radius: 5px;
	background-color: black;
	color : #FFFFFF;
	font-family: 'MICEGothic Bold';
}

.deletebu{
	padding: 12px 20px; 
	font-size: 17px;
	border : 1px solid black;
	border-radius: 5px;
	background-color: black;
	color : #FFFFFF;
	font-family: 'MICEGothic Bold';
}

.butarea{
	float: right;
}

.replybox{
	width: 100%;
	height: 70px;
	box-sizing : border-box;
	margin-bottom : 10px;
}

.backbutton {
	cursor : pointer;
}

#a_content {
	resize : none;
}

</style>
<script>
	function checkAskValue() {
		let a_title = document.getElementById('a_title');		// 제목
		let a_content = document.getElementById('a_content');	// 내용
		
		// 미입력 확인
		if(a_title.value == '' || a_title.value === null || a_title.value === undefined) {
			alert('제목을 입력해주세요.');
			return false;
		}
		
		if(a_content.value == '' || a_content.value === null || a_content.value === undefined) {
			alert('내용을 입력해주세요.');
			return false;
		}
		
		// 길이 확인
		if(a_title.value.length > 50) {
			alert('제목은 50자 내로 입력해주세요.');
			return false;
		}
		
		// 길이 확인
		if(a_content.value.length > 500) {
			alert('내용은 500자 내로 입력해주세요.');
			return false;
		}
		
		document.updateForm.submit();
	}
	
	function checkArValue() {
		let a_content = document.getElementById('arInput');	// 내용
		
		// 미입력 확인
		if(a_content.value == '' || a_content.value === null || a_content.value === undefined) {
			alert('댓글을 입력해주세요.');
			return false;
		}
		
		// 길이 확인
		if(a_content.value.length > 500) {
			alert('댓글은 500자 내로 입력해주세요.');
			return false;
		}
		
		document.arForm.submit();
	}
</script>
</head>
<body>

<header>
<%@ include file="/header.jsp" %>
</header>

	<!-- 본문 -->
	
<div class="outline">

<br><br>

	<div class="c_page">
<!-- 		<a href="getAskList.zo"> -->
<!-- 			<img class="img-back" src="img/back.png"/> -->
<!-- 		</a> -->
		<div class="title">문의글 상세</div>
	</div>
	
	<hr><br>
	
	<form name="updateForm" action="updateAsk.zo" method="post">
		<input name="a_no" type="hidden" value="${ask.a_no}" />
		<input type="hidden" name="um_no" value="${param.um_no}" />
		<input type="hidden" name="bm_no" value="${param.bm_no}" />
		<input type="hidden" name="a_pmm" value="${param.a_pmm}" />
		<input id="a_title" name="a_title" type="text" value="${ask.a_title}" class="Commudetailtitle readonlyCtrl" autocomplete="off"/>
		<hr>
		<div class="Commudetailproperty">
			<a>작성자 : ${ask.name_1}</a><a>ㅣ</a><a>수신자 : ${ask.name_2}</a><a>ㅣ</a><a>${ask.a_date}</a><a>ㅣ</a><a>문의 상태 : ${ask.a_status}ㅣ</a><a>조회수 : ${ask.a_cnt}</a>
		</div>
		<br>
		
		<textarea id="a_content" name="a_content" class="readonlyCtrl" onload="resize(this)" onkeydown="resize(this)" onkeyup="resize(this)">${ask.a_content}</textarea>
		
		<hr><br>
		
	</form>
	<!-- 수정버튼 넣고 페이지 이동 -->
	<div id="btnsDiv">
		<c:if test="${role ne '관리자' && ask.a_pmm ne null}">
			<button class="updatebu" onclick="checkAskValue()">글 수정</button>
			<a  class="deletebu" href="deleteAsk.zo?a_no=${ask.a_no}">글 삭제</a>
		</c:if>
	</div>
	
	<br>
	
	<h1>댓글</h1>
	
	<hr>
	
	<form name="arForm" action="insertAr.zo" method="post">
		<c:if test="${ar ne null}">
			<div class="Commudetailproperty">
				<a>작성자 : ${ar.name}</a><a>ㅣ</a><a>${ar.ar_date}</a><a>ㅣ</a><a>문의 상태 : ${ar.ar_status}</a>
			</div>
		</c:if>
		<div id="commentDiv">
			<div>
				<input type="hidden" name="ar_no" value="${ask.a_no}" />
				<input type="hidden" name="ar_id" value="${userSeq}"/>
				<input type="hidden" name="um_no" value="${param.um_no}" />
				<input type="hidden" name="bm_no" value="${param.bm_no}" />
				<input type="hidden" name="a_pmm" value="${param.a_pmm}" />
				<c:if test="${ar ne null}">
					<input id="arInput" type="search" name="ar_content" class="replybox" value="${ar.ar_content}" autocomplete="off"/>
				</c:if>
				<c:if test="${ar eq null}">
					<input id="arInput" type="search" name="ar_content" class="replybox" value="" autocomplete="off"/>
				</c:if>
			</div>
		</div>
	</form>
	<div style="text-align : center;" id="arBtnDiv">
		<button class="updatebu" onclick="checkArValue()"> 댓글 등록 </button>
	</div>
	
	<hr>
	
<%-- 	<c:forEach items="${arList}" var="ar"> --%>
<!-- 		<div class="replyarea"> -->
<%-- 			<a class="replyw">${ar.ar_no}</a> --%>
<%-- 			<a class="replyc">${ar.ar_content}</a> --%>
<%-- 			<a class="replyc">${ar.ar_status}</a> --%>
<%-- 			<a>${ar.ar_date}</a> --%>
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
	
<br><br>

	<c:if test="${role eq '관리자'}">
		<button onclick="location.href='getPAskList.zo'" class="backbutton">돌아가기</button>
	</c:if>
	<c:if test="${role eq '브랜드'}">
		<button onclick="location.href='getBAskList.zo'" class="backbutton">돌아가기</button>
	</c:if>
	<c:if test="${role eq '회원'}">
		<button onclick="location.href='getUAskList.zo'" class="backbutton">돌아가기</button>
	</c:if>
	
<%-- 	<c:choose> --%>
<%-- 		<c:when test=""> --%>
		
<%-- 		</c:when> --%>
<%-- 		<c:when test=""> --%>
		
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
		
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	
	<br><br><br><br><br><br>

</div>

	<%-- 
	<center>
		<h1>문의글 상세</h1>
		<a href="logout.do">Log-out</a>
		<hr>
		<form action="updateAsk.zo" method="post">
			<input name="a_no" type="hidden" value="${ask.a_no}" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left">
						<input name="a_title" type="text" value="${ask.a_title}" />
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자번호</td>
					<td align="left">${ask.um_no}</td>
				</tr>
				<tr>
					<td bgcolor="orange">브랜드번호</td>
					<td align="left">${ask.bm_no}</td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left">
						<textarea name="a_content" cols="40" rows="10">${ask.a_content}</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left">${ask.a_date}</td>
				</tr>
				<tr>
					<td bgcolor="orange">문의상태</td>
					<td align="left">${ask.a_status}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 수정" />
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<form action="insertAr.zo" method="post">
			<input name="a_no" type="hidden" value="${ask.a_no}" />
			<table>
				<tr>
					<th>댓글달기</th>
				</tr>
				<tr>
					<td bgcolor="orange">작성자번호</td>
					<td><input type="text" name="um_no" value="${ask.um_no}" readonly="readonly"/></td>
					<td bgcolor="orange">브랜드번호</td>
					<td><input type="text" name="bm_no" value="${ask.bm_no}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td><input type="text" name="ar_content" size="50"/></td>
					<td>상담상태<input type="text" name="ar_status" size="10"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value=" 댓글 등록 " />
						<input type="reset" value="취소" onclick="reset()">
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<table border="1" cellpadding="0" cellspacing="0" width="800">
			<tr>
				<th bgcolor="orange" width="50">번호</th>
				<th bgcolor="orange" width="50">상담상태</th>
				<th bgcolor="orange" width="600">댓글내용</th>
				<th bgcolor="orange" width="100">날짜</th>
			</tr>
			<c:forEach items="${arList}" var="ar"> <!-- items : 데이터를 레코드 단위로 반환, var : 변수 선언할 수 있는 속성 -->
				<tr>
					<td align="center">${ar.ar_no}</td>
					<td align="center">${ar.ar_status}</td>
					<td align="center">
						<form action="updateAr.zo" name="up" method="post">
							<input name="a_no" type="hidden" value="${ar.a_no}">
							<input name="ar_no" type="hidden" value="${ar.ar_no}">
							<input name="ar_status" type="hidden" value="2">
							<textarea rows="" cols="" name="ar_content">${ar.ar_content}</textarea>
							<input type="submit" value="수정">
						</form>
					</td>
					<td align="center">${ar.ar_date}<a href="javascript:void(0)" onclick="document.up.submit()">수정</a>&nbsp;<a href="deleteAr.zo?ar_no=${ar.ar_no}&a_no=${ar.a_no}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<hr>
		<a href="insertAsk.zo">문의글등록</a>&nbsp;&nbsp;&nbsp; 
		<a href="deleteAsk.zo?a_no=${ ask.a_no }">문의글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getAskList.zo">문의글목록</a>
	</center> 
	--%>
	
<footer>
<%@ include file="/footer.jsp" %>
</footer>
	
</body>
</html>
