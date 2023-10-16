<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<%@ include file = "/resources/css/header.css" %>
<script type="text/javascript">
	// 윈도우 로딩 함수
	window.onload = function() {
		let pageName = window.location.href;
		
		// getAsk.jsp 시작
		if(pageName.indexOf("getAsk") > -1) {
			// 권한 값 세션에서 받아오기
			let role = '${role}';				// 권한
			let userName = '${userName}';		// 유저명
			let name_1 = '${ask.name_1}';		// 작성자명
			let name_2 = '${ask.name_2}';		// 수신자명
			let ar = '${ar}';					// ar 객체
			let arViewYN = '${ar.ar_view_yn}';	// 답글 조회 여부
			
			// 권한 값 확인 후 관리자일 경우 readonlyCtrl 클래스를 가진 요소들을 찾아 readonly 속성 활성화
			let els = document.getElementsByClassName('readonlyCtrl');			// readonlyCtrl 클래스 부여받은 요소들
			let arBtnDiv = document.getElementById('arBtnDiv');					// 댓글 등록 버튼 둘러싸고 있는 부모 div
			let arInput = document.getElementById('arInput');					// 댓글 입력창
			let arSubmit = document.getElementById('arBtnDiv').childNodes[1];	// 댓글 등록 버튼
			let btnsDiv = document.getElementById('btnsDiv');					// 수정, 삭제 버튼 div
			
			if(role == '관리자') {
				for(let i = 0; i < els.length; i++) {
					els[i].readOnly = true;
					els[i].style.outline = 'none';
					els[i].style.resize = 'none';
				}
				
				// 관리자가 본인한테 작성된 글에만 답글 달 수 있도록
				if(name_2 != '관리자') {
					arBtnDiv.style.display = 'none';
					arInput.readOnly = true;
					arInput.style.outline = 'none';
					arInput.style.borderStyle = 'none';
					arInput.placeholder = '작성된 답글이 없습니다.';
				}
				
				// 본인이 작성한 답글이고 문의글의 작성자가 답글 확인 전에만 수정 가능
				if(name_2 == '관리자') {
					if(arViewYN == 'Y') {
						arBtnDiv.style.display = 'none';
						arInput.readOnly = true;
						arInput.style.outline = 'none';
						arInput.style.borderStyle = 'none';
					} else if(arViewYN == 'N') {
						arSubmit.value = ' 댓글 수정 ';
						document.arForm.action = 'updateAr.zo';
					}
				}
				
			// 관리자가 아닐 경우
			} else if(role != '관리자') {
				// 본인 글이 아니면 수정 불가
				if(userName != name_1) {
					for(let i = 0; i < els.length; i++) {
						els[i].readOnly = true;
						els[i].style.outline = 'none';
						els[i].style.resize = 'none';
					}
				}
				
				// 답글이 달리면 수정 불가
				if(!(ar == null || ar == '')) {
					for(let i = 0; i < els.length; i++) {
						els[i].readOnly = true;
						els[i].style.outline = 'none';
						els[i].style.resize = 'none';
					}
					btnsDiv.style.display = 'none';
				}
				
				// 본인이 작성한 글이면 답글 안보이게
				if(userName == name_1) {
					arBtnDiv.style.display = 'none';
					arInput.readOnly = true;
					arInput.style.outline = 'none';
					arInput.style.borderStyle = 'none';
					arInput.placeholder = '작성된 답글이 없습니다.';
				}
				
				// 본인이 작성한 답글이고 문의글의 작성자가 답글 확인 전에만 수정 가능
				if(userName == name_2) {
					if(arViewYN == 'Y') {
						arBtnDiv.style.display = 'none';
						arInput.readOnly = true;
						arInput.style.outline = 'none';
						arInput.style.borderStyle = 'none';
					} else if(arViewYN == 'N') {
						arSubmit.value = ' 댓글 수정 ';
						document.arForm.action = 'updateAr.zo';
					}
				}
			}
			
			resize(document.getElementById('a_content'));
		}
		// getAsk.jsp 끝
		
		
		// insertBAsk.jsp 시작
		if(pageName.indexOf("insertBAsk") > -1) {
			// 권한 값 세션에서 받아오기
			let role = '${role}';				// 권한
			
			if(role == '회원') {
				Bbtn_click();
			}
		}
		// insertBAsk.jsp 끝
	}
	
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>
</head>
<body>
<header>
<nav class="navbar">
    <h1 class="navbar_logo"><a href="main.jsp"><img class="logo" src="img/logo.png"></a></h1>
    <!-- 검색창 -->
      <div class="search-bar">
          <i class="fas fa-search"></i>
          <input class="search-bar__input" type="search" placeholder="브랜드명, 제품명을 검색하세요!" />
        </div>
      <!--  -->
      <div class="head_util">
      <ul class="navbar_menu">
      		<li class="nav_item"><a href="signIn.jsp"><img class="pictogram" src="img/signin.png"></a></li> 
      		<li class="dropdown"><a href="#"><img class="pictogram" src="img/mypage.png"></a>
      			<ul class="dropdown-content"> <!--제이쿼리로 로그인 상태에따라 다르게 보이기 설정 해야함 -->
      				<ul class= "userLogin"><a href="#">개인정보수정</a></ul>
      				<ul class= "userLogin"><a href="#">활동관리</a></ul>
      				<ul class= "userLogin"><a href="#">배송관리</a></ul>
      				<ul class= "userLogin"><a href="#">혜택관리</a></ul>
      				<ul class= "userLogin"><a href="#">장바구니</a></ul>
      				<ul class= "brandLogin"><a href="#">상품관리</a></ul>
      				<ul class= "brandLogin"><a href="#">web</a></ul>
      				<ul class= "brandLogin"><a href="#">주문관리</a></ul>
      				<ul class= "brandLogin"><a href="#">리뷰관리</a></ul>
      				<ul class= "brandLogin"><a href="#">1대1문의</a></ul>
      				<ul class= "pmmLogin"><a href="#">유저관리</a></ul>
      				<ul class= "pmmLogin"><a href="#">브랜드관리</a></ul>
      				<ul class= "pmmLogin"><a href="#">리뷰관리</a></ul>
      				<ul class= "pmmLogin"><a href="#">문의관리</a></ul>
      				<ul class= "pmmLogin"><a href="#">혜택관리</a></ul>
      			</ul>
      		</li>
      		<li class="nav_item"><a href="#"><img class="pictogram" src="img/cart.png"></a></li> 
      	</ul>
      </div>
</nav>
<div class="subnav">
    <ul class="navi">
      <li><a href="brandList.jsp" data-link-alt="브랜드"><span>브랜드</span></a></li>
      <li><a href="" data-link-alt="상품"><span>상품</span></a></li>
      <li><a href="" data-link-alt="Us"><span>Us</span></a></li>
      <li><a href="" data-link-alt="이벤트"><span>이벤트</span></a></li>
      <li><a href="" data-link-alt="놀이터"><span>놀이터</span></a></li>
    </ul>
  </div>	
</header>

</body>    