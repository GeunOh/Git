<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<style>
body,html{
	margin: 0;
    padding: 0;
    font-size: 0.75em;
    font-family: 'Malgun Gothic',"맑은 고딕",AppleGothic,Dotum,"돋움", sans-serif;
    background: #f3f3f3;
    height: 100%;
    position: relative;
}
#wrapper{height: 100%;}
#container{
    margin-top: 100px;
    height: 90%;
    background: #fff;
    min-width: 1200px;
}
#container_title{
	position: fixed;
    top: 38px;
    left: 0;
    width: 100%;
    line-height: 50px;
    font-size: 18px;
    padding: 0 20px;
    padding-left: 70px;
    border-bottom: 1px solid #ddd;
    background: #fff;
    z-index: 99;
}
table{
	clear: both;
    width: 100%;
	border-collapse: collapse;
    border-spacing: 0;
    font-size: 15px;
}
table thead th{
	background: #749a6f;
    color: #fff;
    border: 1px solid #638b60;
    font-weight: normal;
    text-align: center;
    padding: 10px 5px;
    font-size: 0.92em;
}
tbody td{
	border: 1px solid #dde7d6;
    padding: 5px;
    text-align: center;
    line-height: 22px;
}
tbody tr:nth-child(even){background:#f3f9ef}

#container.container_small{padding-left: 250px;}
#container.container_small #container_title{padding-left: 280px;}
.container_content{padding: 20px;}
a:link, a:link{color: #000; text-decoration: none;}
a{cursor: pointer;}

.btn_01{
	display: inline-block;
    line-height: 30px;
    height: 30px;
    font-size: 0.92em;
    vertical-align: top;
}
.btn_01:nth-child(n+2){margin-left: 5px;}
.text{
	float: left;
    background: #9ec6a3;
    color: #fff;
    border-radius: 5px 0 0 5px;
    padding: 0 5px;
}
.num{
	float: left;
    background: #ededed;
    color: #666;
    border-radius: 0 5px 5px 0;
    padding: 0 5px;
}
#button{margin: 13px 0;}
#search{margin: 13px 0;}
#searchOption{
	height: 30px;
    margin-right: 3px;
    border: 1px solid #dcdcdc;
    vertical-align: top;
}
#searchText{
	height: 28px;
    border: 1px solid #dcdcdc;
    padding: 0 5px;
    background: url(resources/images/input.gif) top right no-repeat #fff !important;
    vertical-align: top;
}
textarea, select{    
	font-family: 'Malgun Gothic',"맑은 고딕",AppleGothic,Dotum,"돋움", sans-serif;
    font-size: 1em;
}
#btn_submit{
	width: 30px;
    height: 30px;
    border: 0;
    padding: 0;
    background: url(resources/images/sch_btn.png) no-repeat 50% 50% #eee;
    border: 1px solid #dcdcdc;
    text-indent: -999px;
    overflow: hidden;
    cursor: pointer;
    vertical-align: top;
    margin-left: 5px;
}
#pageBtn{
	clear: both;
    margin: 0 0 20px;
    padding: 60px 0 0;
    text-align: center;

}
.pg{display: inline-block;}

.pg_btn, .pg_current{
	color: black;
    display: inline-block;
    float: left;
    padding: 0 13px;
    line-height: 30px;
    text-decoration: none;
    border: 1px solid #ddd;
    margin-left: -1px;
    background: white;
}
.pg_current{display: inline-block;
    background: #2f9f6b;
    color: #fff;
    font-weight: normal;}
.pg_start{
	border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    background: url(resources/images/page_1.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
.pg_end{
	border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    background: url(resources/images/page_4.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
.pg_prev{
    background: url(resources/images/page_2.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
.pg_next{
    background: url(resources/images/page_3.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }

</style>
</head>
<body>
	<jsp:include page="AdminMenubar.jsp"/>
	<div id="wrapper">
		<div id="container">
			<h1 id="container_title">전체 아파트 목록</h1>
			<div class="container_content">
				<section>
					<div><h2 style="margin: 10px 0;">전체 아파트 조회</h2></div>
					<div id="button">
						<a class="btn_01" onclick="textlist(1);">
							<span class="text">총 아파트</span>
							<span class="num">${aptall.allMember}명</span>
						</a>
						<a class="btn_01" onclick="textlist(2);">
							<span class="text">승인</span>
							<span class="num">${aptall.accept-aptall.delete}명</span>
						</a>
						<a class="btn_01" onclick="textlist(3);">
							<span class="text">미승인</span>
							<span class="num">${aptall.disaccept}명</span>
						</a>
						<a class="btn_01" onclick="textlist(4);">
							<span class="text">탈퇴</span>
							<span class="num">${aptall.delete}명</span>
						</a>
						
						<script>
						$(function(){
								var num = ${num};
								$(".text").css('background', '#9ec6a3');
								if(num==1){
									$(".btn_01:nth(0)").find('.text').css('background', '#2f9f6b');
								}else if(num==2){
									$(".btn_01:nth(1)").find('.text').css('background', '#2f9f6b');
								}else if(num==3){
									$(".btn_01:nth(2)").find('.text').css('background', '#2f9f6b');
								}else{
									$(".btn_01:nth(3)").find('.text').css('background', '#2f9f6b');
								}
						});
						function textlist(num){
							if(num==1){
								location.href="ApartList.adm";
							}else if(num==2){
								location.href="ApartList.adm?num=2";
							}else if(num==3){
								location.href="ApartList.adm?num=3";
							}else{
								location.href="ApartList.adm?num=4";
							}
						}
						</script>
					</div>
					
					<form id="search" action="searchApart.adm" onsubmit="return searchChk();">
							<select id="searchOption" name="searchOption">
								<option>아파트명</option>
								<option>전화번호</option>
							</select>
							<input type="text" id="searchText" name="searchText">
							<input type="submit" id="btn_submit" name="btn_submit">
							<script>
								function searchChk(){
									if($('#searchText').val()==''){
										alert('검색어를 입력해주세요');
										return false;
									}
									return true;
								}
							</script>
						</form>
						<table>
							<thead>
								<tr>
									<th scope="col" style="width: 10px;">번호</th>
							        <th scope="col" style="width: 200px;">아파트명</th>
							        <th scope="col" style="width: 300px;">주소</th>
							        <th scope="col" style="width: 30px;">동(수)</th>
							        <th scope="col" style="width: 100px;">가입일</th>
							        <th scope="col" style="width: 100px;">전화번호</th>
							        <th scope="col" style="width: 30px;">승인여부</th>
							        <th scope="col" style="width: 30px;">탈퇴여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty alist }">
									<tr>
										<td colspan="11" style="text-align: center; padding: 100px 0 !important;">
											자료가 없습니다.
										</td>
									</tr>
								</c:if>
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
					</section>
					<!--페이징-->	
					<div id="pageBtn">
						<!--맨 처음으로  -->
						<span class="pg">
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="start" value="${ loc }">
									<c:param name="page" value="1"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url>
								<a class="pg_btn pg_start" href="${ start }">처음</a>
							</c:if>
							<!--10개씩 전 페이징  -->
							<c:if test="${ pi.currentPage > 10 }">
								<c:url var="prev" value="${ loc }">
									<c:param name="page" value="${pi.startPage - 10}"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url>
								<a class="pg_btn pg_prev" href="${ prev }">처음</a>
							</c:if>
							<!-- 기본페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a class="pg_current">${ p }</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="${ loc }">
										<c:param name="page" value="${ p }"/>
										<c:param name="num" value="${num}"/>
										<c:if test="${ searchText ne null }">
											<c:param name="searchOption" value="${searchOption}"/>
											<c:param name="searchText" value="${searchText}"/>
										</c:if>
									</c:url>
									<a class="pg_btn" href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							<!--10개씩 다음 페이징  -->
							<c:if test="${ pi.currentPage > 1 and pi.maxPage > 10}">
								<c:url var="next" value="${ loc }">
									<c:param name="page" value="${pi.endPage + 1 }"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url>
								<a class="pg_btn pg_next" href="${ next }">처음</a>
							</c:if>
							<!--맨 끝으로 -->
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="end" value="${ loc }">
									<c:param name="page" value="${ pi.maxPage }"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url> 
								<a class="pg_btn pg_end" href="${ end }">마지막</a>
							</c:if>							
						</span>
					</div>	
			</div>
		</div>
		<jsp:include page="../common/Footer.jsp"></jsp:include>
	</div>
</body>
</html>