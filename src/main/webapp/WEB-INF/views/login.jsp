<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<style type="text/css">
	body {
		margin : 0px;
		padding : 0px;
		overflow : hidden;
	}
	
	#lFrameDiv {
		display : flex;
		justify-content : center;
		align-items : center;
		flex-direction : column;
		position : absolute;
		height : 100%;
		width : 100%;
	}
	
	#logo {
		margin-bottom : 30px;
	}
	
	#lFrame {
		width : 250px;
		display : flex;
		justify-content : center;
		align-items : center;
		flex-direction : column;
		border : 1px solid lightgrey;
		border-radius : 10px;
		padding : 20px;
	}
	
	#lFrameTitle {
		display : block;
		font-size : 24px;
		font-weight : bold;
		margin-bottom : 20px;
	}
	
	#loginDiv {
		width : 100%;
	}
	
	#id {
		display : block;
		width : 100%;
		padding: 10px;
		margin-bottom : 10px;
		box-sizing : border-box;
		border: solid 2px #88B04B;
		border-radius : 10px;
		font-size : 16px;
		
	}
	
	#password {
		display : block;
		width : 100%;
		padding: 10px;
		box-sizing : border-box;
		border: solid 2px #88B04B;
		border-radius : 10px;
		font-size : 16px;
		margin-bottom : 20px;
	}
	
	#loginBtn {
		width : 100%;
		box-sizing : border-box;
		border-radius : 10px;
		border-style : none;
		background-color : #88B04B;
		padding : 10px;
		font-size : 16px;
		color : #ffffff;
	}
</style>
</head>
<body>

<!-- 	<h1 align="center">로그인</h1> -->
<!-- 	<hr> -->
<!-- 	<form action="login.me" method="post"> -->
<!-- 		<table border="1" cellpadding="0" cellspacing="0" align="center"> -->
<!-- 			<tr> -->
<!-- 				<td><label for="id">아이디</label></td> -->
<%-- 				<td><input type="text" name="id" value="${usr.id}"/></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>비밀번호</td> -->
<%-- 				<td><input type="password" name="password" value="${usr.password}"/></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" align="center"><input type="submit" value="로그인"/></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
		<form action="login.me" method="post">
			<div id="lFrameDiv">
				<div id="logo">
					<img id="logoImage" alt="로고" src="img/logo.png" width="500">
				</div>
				<div id="lFrame">
					<div id="lFrameTitle">
						로그인
					</div>
					<div id="loginDiv">
							<input id="id" type="text" name="id" value="${usr.id}" placeholder="아이디"/>
							<input id="password" type="password" name="password" value="${usr.password}" placeholder="비밀번호"/>
					</div>
					<input id="loginBtn" type="submit" value="로그인">
				</div>
			</div>
		</form>
	
</body>
</html>