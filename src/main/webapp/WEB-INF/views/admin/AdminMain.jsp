<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
	margin: 0;
    padding: 0;
    font-size: 0.75em;
    font-family: 'Malgun Gothic',"맑은 고딕",AppleGothic,Dotum,"돋움", sans-serif;
    background: #f3f3f3;
    height: 100%;
    position: relative;
}

#icon{float: right; margin: 15px;}
#icon .fa-sign-out-alt{font-size: 20px; color: white;}
#pagename > a {
	vertical-align: -18px;
    font-size: 20px;
    color: white;
    text-decoration: none;
}
#wrapper{min-height: 480px;}
#container{
    margin-top: 100px;
    height: 100%;
    background: #fff;
    min-width: 1200px;
}
#container_title{
	position: fixed;
    top: 38px;
    left: 0;
    width: 100%;
    line-height: 50px;
    font-size: 1.5em;
    padding: 0 20px;
    padding-left: 70px;
    border-bottom: 1px solid #ddd;
    background: #fff;
    z-index: 99;
}
#container.container_small{padding-left: 250px;}
#container.container_small #container_title{padding-left: 280px;}
.container_content{padding: 20px;}
.userlist{text-align: right;}
.btnList{margin: 10px 0;}
.btnList a{display: inline-block;
		   padding: 0 15px;
		   height: 28px;
		   background: #617d46;
		   color: #fff;
	       text-decoration: none;
	       line-height: 2.4em;
		   vertical-align: middle;
}
.all_list2{   
			margin: 10px 0;
    		min-width: 960px;
}
.all_list {
		    background: #eaeaea;
		    padding: 10px 20px;
		    margin: 10px 0;
		    line-height: 1.5em;
}

table{
	clear: both;
    width: 100%;
	border-collapse: collapse;
    border-spacing: 0;
}
table thead th{
	background: #749a6f;
    color: #fff;
    border: 1px solid #638b60;
    font-weight: normal;
    text-align: center;
    padding: 8px 5px;
    font-size: 0.92em;
}
tbody td{
	border: 1px solid #dde7d6;
    padding: 5px;
    text-align: center;
    line-height: 22px;
}
tbody tr:nth-child(even){background:#f3f9ef}
h2{    
	font-size: 1.083em;
    font-weight: bold;
    margin: 10px 0;
}
marquee {
	background: #4e905f; 
	color: white;
	margin-top: 15px;
	height: 30px;
	font-size: 16px;
	
}
marquee>b{font-size: 20px;}
</style>
</head>
<body>
	<jsp:include page="AdminMenubar.jsp"/>
		<div id="wrapper">
		<div id="container">
			<h1 id="container_title">관리자 페이지</h1>
				<div>
					<c:choose>
						<c:when test="${newCount[0] ne 0 or newCount[1] ne 0}">
						<marquee behavior=alternate>총 신청건수 <b>${newCount[0]+newCount[1]}</b>건 ( 회원가입 : <b>${newCount[0]}</b>건, 아파트 신청 : <b>${newCount[1]}</b>건) </marquee>
						</c:when>
						<c:when test="${newCount[0] eq 0 and newCount[1] eq 0}">
						<marquee behavior=alternate>신청한 회원이나 아파트가 없습니다.</marquee>
						</c:when>
					</c:choose>
				</div>
				<div class="container_content">
					<section>
						<h2>전체가입회원 목록</h2>
						<div class="all_list2 all_list">총 회원 ${mall.allMember}명 중 승인회원 ${mall.accept-mall.delete}명, 미승인회원 ${mall.disaccept}명, 탈퇴 ${mall.delete}명</div>
						<table>
							<thead>
								<tr>
									 <th style="width: 100px;">회원아이디</th>
							         <th style="width: 100px;">이름</th>
							         <th style="width: 100px;">닉네임</th>
							         <th style="width: 60px;">전화번호</th>
							         <th style="width: 60px;">이메일</th>
							         <th style="width: 400px;">아파트</th>
							         <th style="width: 70px;">동/호수</th>
							         <th style="width: 50px;">권한</th>
							         <th style="width: 100px;">가입일</th>
							         <th style="width: 50px;">승인현황</th>
							         <th style="width: 50px;">탈퇴여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="m" items="${mlist}">
									<tr>
										<td>${m.userId}</td>
										<td>${m.userName}</td>
										<td>${m.nickName}</td>
										<td>${m.phone}</td>
										<td>${m.email}</td>
										<td>${m.aptName}</td>
										<td>${m.aptDong}/${m.aptHosu}</td>
										<c:if test="${m.userLevel eq 1}">
											<td>입주민</td>
										</c:if>
										<c:if test="${m.userLevel eq 2}">
											<td>관리사무소</td>
										</c:if>
										<td>${m.createDate}</td>
										<td>${m.ACCEPT}</td>
										<td>${m.status}</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<div class="userlist btnList"><a>전체 회원 목록</a></div>
					</section>
				</div>
			
			
				<div class="container_content">
					<section>
						<h2>전체 아파트 목록</h2>
						<div class="all_list2 all_list">전체아파트 ${aall.allMember}개 중 승인회원 ${aall.accept-aall.delete}개, 미승인회원 ${aall.disaccept}개, 탈퇴 ${aall.delete}개</div>
						<table>
							<thead>
								<tr>
									 <th scope="col" style="width: 10px;">번호</th>
							         <th scope="col" style="width: 100px;">아파트명</th>
							         <th scope="col" style="width: 400px;">주소</th>
							         <th scope="col" style="width: 30px;">동(수)</th>
							         <th scope="col" style="width: 100px;">가입일</th>
							         <th scope="col" style="width: 100px;">전화번호</th>
							         <th scope="col" style="width: 30px;">승인여부</th>
							         <th scope="col" style="width: 30px;">탈퇴여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${alist}">
									<tr>
										<td>${a.id}</td>
										<td>${a.name}</td>
										<td>${a.address}</td>
										<td>
											<c:set var="dongs" value="${fn:split(a.dong, ',')}" />
											${fn:length(dongs)}
										</td>
										<td>${a.createdate}</td>
										<td>${a.tel}</td>
										<td>${a.accept}</td>
										<td>${a.delete}</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="userlist btnList"><a>전체 아파트 목록</a></div>
					</section>
				</div>
				
			<jsp:include page="../common/Footer.jsp"/>
		</div>
	</div>
</body>
</html>