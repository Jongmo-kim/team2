<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.fa-clipboard, .fa-bell {
	cursor: pointer;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 11pt;
}

.row {
	width: 100%;
	margin-right: 0;
}

.nav-wrap {
	width: 100%;
}

.row>* {
	z-index: 10;
}

.col-md-3, .col-md-6 {
	padding: 0;
	height: 120px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.nav>ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
}

.nav>ul>li {
	float: left;
}

.nav>ul>li>a {
	text-decoration: none;
	color: black;
	width: 150px;
	height: 80px;
	line-height: 80px;
	display: block;
	text-align: center;
	font-size: 28px;
	font-weight: 400;
}

.nav>ul>li>ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	position: absolute;
	display: none;
}

.nav>ul>li>ul>li>a {
	text-decoration: none;
	color: black;
	width: 150px;
	height: 30px;
	line-height: 30px;
	display: block;
	text-align: center;
}

.nav>ul>li>ul>li>a:hover {
	color: brown;
	text-decoration: underline;
}
.sub {
	width: 100%;
	height: 350px;
	background-color: white;
	display: none;
	z-index: 9;
	position: absolute;
	top: 0;
}

.sub-wrap {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 8;
	display: none;
	/*메인축*/
	justify-content: center;
	/*반대축*/
	align-items: center;
}
.nav{
padding-top:50px;}

.menu{
	padding-top:70px;
}
.menu>ul{
list-style-type: none;
padding:0;
margin:0;}
.menu>ul>li{
float:right;
margin-right:20px;
}
.menu>ul>li>a{
text-decoration: none;
color : black;
font-size: 20px;
}
</style>
<header>
	<div class="header">
		<div class="nav-wrap">
			<div class="row">
				<div class="col-md-3 logo">
					<div class="main-img">
						<a href="/"> <img src="../image/header/DongNeBook2nd.png">
						</a>
					</div>
				</div>
				<div class="col-md-6 nav">
					<ul>
						<li><a href="#">자료검색</a>
							<ul>
								<li><a href="#">자료 검색</a></li>
								<li><a href="#">새로 들어온 책</a></li>
								<li><a href="#">대출 베스트</a></li>
							</ul></li>
						<li><a href="#">열린공간</a>
							<ul>
								<li><a href="#">이 달의 도서관</a></li>
								<li><a href="#">공지사항</a></li>
							</ul></li>
						<li><a href="#">나의 도서관</a>
							<ul>
								<li><a href="#">내 서재</a></li>
								<li><a href="#">마이페이지</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="col-md-3 menu">
						<ul>
							<c:choose>
								<c:when test="${loginUser == null }">
									<c:choose>
										<c:when test="${loginAdmin == null }">
											<li><a href="/user/loginFrm.do">로그인</a></li>
											<li><a href="/user/signupFrm.do">회원가입</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="/aladin/searchInAladin.do">관리자</a></li>
											<li><a href="/admin/logout.do">로그아웃</a></li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<li><a href="/user/mypageFrm.do">마이페이지</a></li>
									<li>
										<!-- <i class="fas fa-clipboard"></i> --> <a href="#">도서
											추천</a>
									</li>
									<li><a href="/user/logout.do">로그아웃</a></li>
									<li><a onclick="openWindow()"> <!-- <i class="fas fa-bell"></i> -->
											<i class="fas fa-lg fa-bell"></i>
									</a></li>
									<%-- <li>
			                        	<a href="/user/delete.do?userNo=${loginUser.userNo }">Withdrawal</a>
			                        </li> --%>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
			</div>
			<div class="sub"></div>
			<div class="sub-wrap"></div>
			<div class="blank"></div>
		</div>

	</div>
	<div class="search-frame"></div>
	<script>
        $(function() {
            $(".col-md-6>ul").mouseover(function() {
                $(".sub-wrap").show();
                $(".sub").slideDown(500);
                $(".nav>ul>li>ul").slideDown(600);
                $(".logo>img").attr('src', 'img/logo2.png');

            });
            $(".col-md-6>ul").mouseleave(function() {
                $(".sub").slideUp(600);
                $(".sub-wrap").hide();
                //$(".nav>ul>li>ul").slideUp();
                $(".nav>ul>li>ul").hide();
                $(".logo>img").attr('src', 'img/logo3.png');
            });
        });

    </script>
</header>
