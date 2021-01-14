<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동서남북 | 공지사항</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />

	<h1 style="font-size:30px;">공지사항 리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<c:if test="${sessionScope.loginAdmin!=null}">
				<th><input type="checkbox" class="allCheck"></th>
			</c:if>
			<th>공지사항 번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
		<c:forEach items="${list }" var ="n">
			<tr>
				<c:if test="${sessionScope.loginAdmin!=null}">
					<td><input type="checkbox" name="noticeCheck" value=${n.noticeNo }></td>
				</c:if>
				<td>${n.rNum }</td><td><a href="/notice/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle }</a></td><td>${n.noticeWriter }</td><td>${n.enrollDate }</td>			
			</tr>
		</c:forEach>
	</table>
	<p style="text-align:center">${pageNavi }</p>
	<c:if test="${sessionScope.loginAdmin!=null}">
		<button onclick="insertNotice();" class="btn btn-primary">추가</button>
		<button onclick="deleteNotice();" class="btn btn-danger">삭제</button>
	</c:if>
	
	<script>
		$(function(){
			$(".allCheck").click(function (){
				//전체 체크
				if($(".allCheck").is(":checked") == true){
					$("input:checkbox[name=noticeCheck]").prop("checked",true);
				}
				//전체 체크 해제
				if($(".allCheck").is(":checked") == false){
					$("input:checkbox[name=noticeCheck]").prop("checked", false);
				}
			});
		});
		function insertNotice(){
			location.href="/notice/noticeFrm.do";
		}
		
		function deleteNotice(){
			//몇 번째 체크박스가 체크되어 있는지 확인
			var arr = new Array();
			$("input:checkbox[name=noticeCheck]:checked").each(function(idx,item){
			    arr.push($("input:checkbox[name=noticeCheck]:checked").eq(idx).val());
			});
			if(arr.length != 0){
				location.href="/notice/deleteNotice.do?noticeNo="+arr;
			} else {
				alert("삭제할 게시글을 선택하세요.");
			}
		}
	</script>
</body>
</html>