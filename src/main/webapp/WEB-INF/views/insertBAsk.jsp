<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>문의등록(${role})</title>
<!-- <link rel="stylesheet" href="/css/basic.css"> -->
<%@ include file="/resources/css/basic.css" %>

<style>
h1 {
	font-family: 'MICEGothic Bold';
	font-size: 20px;
}
.commuarea{
  width : 100%;
  height : 20px;
  border : 2px solid #88b04b;
  border-radius: 2px;
  box-sizing: border-box;
}
textarea{
  width : 100%;
  border : 2px solid #88b04b;
  height : 500px;
  border-radius: 2px;
}

.buttonzone{
	text-align: center;
}

button{
	font-family: 'MICEGothic Bold';
	margin : 20px;
}

.searchbutton{
	padding: 12px 40px; 
	font-size: 22px;
	border : 1px solid #858C74;
	border-radius: 5px;
	background-color: #88b04b;
	font-family: 'MICEGothic Bold';
	color : #FFF;
}

#divBtns {
	display : flex;
	flex-driection : column;
	border: 2px solid #88b04b;
}

#Bbtn {
	width: 50%;
	margin : 0px;
	border-style : none;
	background-color : #ffffff;
	color : #88b04b;
}

#Pbtn {
	width: 50%;
	margin : 0px;
	border-style : none;
	background-color : #ffffff;
	color : #88b04b;
}

#divSelect {
	display : flex;
	padding-top : 10px;
}

#Bselect {
	width : 100%;
}

</style>

<script type="text/javascript">
	function Bbtn_click(obj) {
		if(document.getElementById('Bbtn') != null) {
			let Bbtn = document.getElementById('Bbtn');
			Bbtn.style.backgroundColor = "#88b04b";
			Bbtn.style.color = "#ffffff";
			Pbtn.style.backgroundColor = "#ffffff";
			Pbtn.style.color = "#88b04b";
		}
		
		if(document.getElementById('divSelect') != null) {
			let divSelect = document.getElementById('divSelect');
			divSelect.style.display = 'flex';
		}
		
		document.getElementById('a_pmm').value = '';
	}
	
	function Pbtn_click(obj) {
		let Pbtn = document.getElementById('Pbtn');
		Pbtn.style.backgroundColor = "#88b04b";
		Pbtn.style.color = "#ffffff";
		Bbtn.style.backgroundColor = "#ffffff";
		Bbtn.style.color = "#88b04b";
		
		let divSelect = document.getElementById('divSelect');
		divSelect.style.display = 'none';
		
		document.getElementById('a_pmm').value = '1';
	}
	
	function checkValue() {
		let a_title = document.getElementById('a_title');		// 제목
		let Bselect = document.getElementById('Bselect');		// 브랜드 선택창
		let a_content = document.getElementById('a_content');	// 내용
		let Bbtn = document.getElementById('Bbtn');				// 브랜드 버튼
		
		let val01;
		if(document.getElementById('divSelect') != null) {
			val01 = document.getElementById('divSelect').style.display;
		}
		
		// 미입력/미선택 확인
		if(a_title.value == '' || a_title.value === null || a_title.value === undefined) {
			alert('제목을 입력해주세요.');
			return false;
		}
		
		if(Bbtn != null) {
			if(val01 == 'flex' && (Bselect.value == '' || Bselect.value === null || Bselect.value === undefined)) {
				alert('브랜드를 선택하시거나 대상을 관리자로 변경해주세요');
				return false;
			}
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
		
		document.insertForm.submit();
	}
</script>

</head>
<body>

<header>
<%@ include file="/header.jsp" %>
</header>

<div class="outline">
	
	<div class="c_page">
		<div class="title">문의 등록(${role})</div>
	</div>
	
	<hr><br>
	
	<form name="insertForm" action="insertBAsk.zo" method="post">
		<c:if test="${role eq '회원'}">
			<input type="hidden" name="um_no" value="${userSeq}" />
		</c:if>
		<c:if test="${role eq '브랜드'}">
			<input type="hidden" name="bm_no" value="${userSeq}" />
			<input type="hidden" name="um_no" value="" />
		</c:if>
		
		<h1 class="commutitle">제목</h1>
		<input type="text" id="a_title" name="a_title" class="commuarea"/>
		<div class="container" style="height: 10px;"></div>
		
		<h1 class="commutitle">문의대상</h1><!-- (임시값)세션으로 들어갈 자리임. -->
		<c:if test="${role eq '회원'}">
			<input id="a_pmm" type="hidden" name="a_pmm" value="" />
			<div id="divBtns">
				<button type="button" id="Bbtn" onclick="Bbtn_click(this)" >브랜드</button>
				<button type="button" id="Pbtn" onclick="Pbtn_click(this)" >관리자</button>
			</div>
			<div id="divSelect">
				<select id="Bselect" name="bm_no">
					<option value="">선택</option>
					<c:forEach items="${BrandList}" var="Brand">
						<option value="${Brand.SEQ}">${Brand.NAME}</option>
					</c:forEach>
				</select>
			</div>
		</c:if>
		<c:if test="${role eq '브랜드'}">
			<input id="a_pmm" type="hidden" name="a_pmm" value="1" />
			<div id="divBtns">
				<button type="button" id="Pbtn" style="width: 100%;">관리자</button>
			</div>
		</c:if>
		<div class="container" style="height: 10px;"></div>
		
		<h1 class="commutitle">내용</h1>
		<textarea id="a_content" name="a_content" cols="40" rows="10"></textarea>
		<br><br>
		
	</form>
	<div class="buttonzone">
		<button id="insertBtn" class="searchbutton" onclick="checkValue()">새글 등록</button>
	</div>
	
	<button onclick="javascript:history.back();" class="backbutton">돌아가기</button>
	
	<br><br><br><br><br><br>
	
</div>

	<!-- 
	<center>
		<h1>문의 등록</h1>
		<a href="logout.do">Log-out</a>
		<hr>
		<form action="insertAsk.zo" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="a_title" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">작성자번호</td>
					<td align="left"><input type="text" name="um_no" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">브랜드번호</td>
					<td align="left"><input type="text" name="bm_no" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="a_content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange">문의상태</td>
					<td align="left"><input type="text" name="a_status" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">파일첨부</td>
					<td><input type="file" name="uploadFile"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value=" 새글 등록 " />
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="getAskList.zo">문의 목록 가기</a>
	</center> 
	-->
	
<footer>
<%@ include file="/footer.jsp" %>
</footer>
	
</body>
</html>