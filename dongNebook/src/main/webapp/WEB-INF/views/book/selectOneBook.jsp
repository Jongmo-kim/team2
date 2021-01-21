<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세정보</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/css/book/selectOneBook.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<jsp:include page="/views/common/userSide.jsp" />
	<div class="content-wrap">
		<h1 style="font-size:30px;">도서등록</h1>
		<hr>
		<div class="content">
			<div class="content-top">
				<div class="BookInfo">
					<div id="selectBookImg">
						<img alt="${b.bookName }Image" src="${b.imageurl}" width="100%" height="100%">
					</div>
					<div id="bookTable">
						<table border="0" width="700" style="table-layout:fixed;">
							<tr id="title">
								<th>제목</th><td>${b.bookName}</td>
							</tr>
							<tr id="title">
								<th>저자</th><td>${b.bookWriter}</td>
							</tr>
							<tr id="title">
								<th>카테고리</th><td>${b.bookKind}</td>
							</tr>
							<tr id="title">
								<th>출판사</th><td>${b.bookPublisher}</td>
							</tr>
							<tr id="title">
								<th>표준부호</th><td>${b.ISBN}</td>
							</tr>
							<tr id="introduce">
								<th style="padding-bottom: 50px;">책소개</th><td style="word-break:break-all;">${b.bookIntroduce}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="content-middle">
				<ul class="status">
					<li><strong>표준부호(ISBN)</strong></li>
					<li><strong>반납 예정일</strong></li>
					<li><strong>대출상태</strong></li>
					<li>${b.ISBN}</li>
					<c:if test="${b.bookCount!=0}"> 
					<li></li>
					<li style="line-height: normal;">대출 가능</li>
					</c:if>
					<c:if test="${b.bookCount==0}"> 
					<li>${returnDate}</li>
					<li style="line-height: normal; color: blue;">대출불가상태(다른 사용자 대출중 ${returnDate} 반납예정)</li>
					</c:if>
				</ul>
			</div>
			<div class="content-bottom">
				<c:if test="${loginUser!=null }">
					<c:if test="${b.bookCount!=0}"> 
						<a href="/bookRental.do?bookNo=${b.bookNo}">대출신청</a><a href="/book/searchBookFrm.do">이전으로</a>
					</c:if>
					<c:if test="${b.bookCount==0}"> 
						<a href="/bookReserve.do?bookNo=${b.bookNo}">예약신청</a><a href="/book/searchBookFrm.do">이전으로</a>
					</c:if>
 				</c:if>
 				<c:if test="${loginUser==null }">
					<a id="notLogin" href="/user/loginFrm.do">대출신청</a><a href="/book/searchBookFrm.do">이전으로</a>
				</c:if>
			</div>
		</div>
	</div>
		
	<!-- 
	<table border=1>
		<tr>
			<th>책이름</th><th>이미지</th><th>카테고리</th><th>저자</th><th>출판사</th><th>소개</th><th>대출</th>
		</tr>
		<tr>
			<td>${b.bookName }</td><td><img alt="${b.bookName }Image" src="${b.imageurl }"></td><td>${b.bookKind }</td><td>${b.bookWriter }</td><td>${b.bookPublisher}</td><td>${b.bookIntroduce }</td>
			<td>
				<c:if test="${loginUser!=null }">
					<a href="/bookRental.do?bookNo=${b.bookNo}">대출신청</a>
	 			</c:if>
	 			<c:if test="${loginUser==null }">
				<a>대출신청</a>
				</c:if>
			</td>
		</tr>
	</table>
	 -->
</body>
<script>
	$('#notLogin').click(function () {
		alert('로그인 후 이용가능합니다');
	});
</script>
</html>