<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title></decorator:title></title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<decorator:head></decorator:head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
body {
	min-height: 80vh;
	background: #edeafc54;
	
}
.container {
	display: flex;
	padding: 0;
	margin: 85px auto;
	max-width: 80vw;
	border: 2px solid #222;
	border-radius: 10px;
	background: #fff;
}
.container .nav_content {
	width: 20vw;
	border-radius: 10px 0 0 10px;
}
.container .nav_content .navbar {
	padding: 20px 0;
}
.container .nav_content .navbar .nav h6 {
	text-align: center;
	font-style: italic;
	color: #222;
	opacity: 0.5;
}
.container .nav_content .navbar .nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	width: 100%;
}
.container .nav_content .navbar .nav ul li {
	display: none;
	transition: 0.5s;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	line-height: 2;
}
.container .nav_content .navbar .nav ul li a {
	color: #337ab7;
	text-decoration: none;
	background: transparent;
}
.container .nav_content .navbar .nav ul li:hover {
	background: #8572EE;
	color: #fff;
}
.container .nav_content .navbar .nav ul li:hover a {
	color: #fff;
}
.container .nav_content .navbar .nav ul li:first-child {
	display: block;
	cursor: pointer;
}
.container .content {
	width: 60vw;
	border-left: 2px solid #222;
	border-radius: 0 10px 10px 0;
	min-height: 70vh;
}
.content h1 {
	text-align: center;
}
.content .board a {
	text-decoration: none;
	color: #000;
	font-size: 20px;
}
.content .board {
	padding: 0 20px;
	width: 400px;
	float: left;
	text-align: center;
}
.content .board table {
	width: 100%;
	border-collapse: collapse;
	border-top: 3px solid #000;
	border-bottom: 3px solid #000;
}
.content .board table td{
	border-collapse: collapse;
	border-top: 1px solid #000;
	text-align: center;
}
.content .board table td{
	text-align: center;
}
.content .member {
	width: 400px;
	padding: 0 0px 0 50px;
	float: right;
	text-align: center;
}
.content .member .memberlist {
}
.content .member .memberlist ul {
	list-style: none;
	padding: 0
}
.content .member .memberlist ul li {
	text-align: center;
}
.content .member a {
	text-decoration: none;
	color: #000;
	font-size: 20px;
}
.content .calendar {
	float: left;
	padding: 10px 50px;
}

.main .container .nav_content .navbar .nav{
	width: 100%;
}

</style>
</head>
<body>
<header>
		<div class="logo"><a href="${path}/main/home.dev"><img src="${path}/img/logo.png"></a></div>
		<nav class="nav1">
			<ul>
			<c:if test="${loginUser == null}">
				<li><a href="${path}/user/login.dev"><i class="fa fa-sign-in"></i></a></li>
			</c:if>
			<c:if test="${loginUser != null}">
				<c:if test="${!sessionScope.loginUser.id.equals('admin')}">
					<li><a href="${path}/user/message.dev?id=${sessionScope.loginUser.id}"><i class="fa fa-envelope"></i></a></li>
					<li><a href="#"><i class="fa fa-bell"></i></a></li>
				</c:if>
				<li class="sub-menu"><a href="#"><i class="fa fa-user-circle"></i></a>
					<ul id="final">
						<c:if test="${sessionScope.loginUser.id.equals('admin')}">
				        	<li><a href="${path}/admin/adminpage.dev">관리자 페이지</a></li>
				        </c:if>
				        <c:if test="${!sessionScope.loginUser.id.equals('admin')}">
							<li><a href="${path}/user/mypage.dev">회원정보 수정</a></li>
							<li><a href="${path}/portfolio/portfolio.dev?name=${sessionScope.loginUser.name}">My Portfolio</a></li>
							<li><a href="${path}/til/mytil.dev">TIL</a></li>
						</c:if>
						<li><a href="${path}/user/logout.dev">로그아웃</a></li>
					</ul>
				</li>
			</c:if>
			</ul>
		</nav>
		<nav class="nav2">
			<ul class="nav-menu">
				<li class="menu-li"><a href="${path}/til/main.dev">TIL</a>
				<ul>
						<li><a href="${path}/til/main.dev?no=3">TIL 페이지 목록</a></li>
						<li><a href="${path}/til/list.dev?no=5">구독한 사용자 목록</a></li>
				</ul></li>
				<li class="sub-menu menu-li"><a href="#">Community</a>
					<ul>
						<li><a href="${path}/board/list.dev?no=4">Q&A게시판</a></li>
						<li><a href="${path}/board/list.dev?no=5">자유게시판</a></li>
					</ul></li>
				<li class="sub-menu menu-li"><a href="#">Co-Working</a>
					<ul>
						<li><a href="${path}/coworking/main.dev">Study/Project</a></li>
						<li><a href="${path}/group/main.dev">My Group</a></li>
					</ul>
				</li>
				<li><a href="${path}/board/list.dev?no=10">건의게시판</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="main">
	<div class="container">
		<div class="nav_content">
			<div class="navbar">
				<div class="nav">
						<c:if test="${empty group }"><h6>참여중인 그룹이 없습니다.</h6></c:if>
					<ul>
						<c:if test="${!empty study}"><li>스터디 <i class="fa fa-caret-down"></i></li></c:if>
							<c:forEach items="${study}" var="st">
								<li>
									<c:if test="${loginUser.name != st.name}">
										<a href="${path}/group/main.dev?gno=${st.gno}">${st.title}</a>
									</c:if>
									<c:if test="${loginUser.name == st.name}">
										<a href="${path}/group/main.dev?gno=${st.gno}" style="color:#FFBF00">${st.title}</a>
									</c:if>
								</li>
							</c:forEach>
					</ul>
					<ul>
						<c:if test="${!empty contest}"><li>공모전 <i class="fa fa-caret-down"></i></li></c:if>
							<c:forEach items="${contest}" var="co">
								<li>
									<c:if test="${loginUser.name != co.name}">	
										<a href="${path}/group/main.dev?gno=${co.gno}">${co.title}</a>
									</c:if>
									<c:if test="${loginUser.name == co.name}">
										<a href="${path}/group/main.dev?gno=${co.gno}" style="color:#FFBF00">${co.title}</a>
									</c:if>
								</li>
							</c:forEach>
					</ul>
					<ul>
						<c:if test="${!empty project}"><li>프로젝트 <i class="fa fa-caret-down"></i></li></c:if>
							<c:forEach items="${project}" var="pr">
								<li>
									<c:if test="${loginUser.name != pr.name}">	
										<a href="${path}/group/main.dev?gno=${pr.gno}">${pr.title}</a>
									</c:if>
									<c:if test="${loginUser.name == pr.name}">
										<a href="${path}/group/main.dev?gno=${pr.gno}" style="color:#FFBF00">${pr.title}</a>
									</c:if>
								</li>
							</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
		<decorator:body></decorator:body>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".container .nav_content .navbar .nav ul li:first-child").on("click", function() {
				$(this).siblings().toggle();
				$(this).toggleClass("checked");
				if($(this).hasClass("checked")) {
					$(this).children("i").removeClass("fa-caret-down");
					$(this).children("i").addClass("fa-caret-up");
				}else {
					$(this).children("i").addClass("fa-caret-down");
					$(this).children("i").removeClass("fa-caret-up");
				}
				
			})
		})
	</script>
	
	<%-- 이하 모달 관련 소스 --%>
	<script>
		/* 모달 관련 스크립트 */
		$(function(){
			//프로필 모달
			$(".open-profileInfoModal").on("click",function(){
				var username = $(this).data('name');
				$("#profile-modal-title").text(username);
				$("#openMessageModalATag").attr("data-username",username);
				$("#openReportModalATag").attr("data-username",username);
				$("#goToPortfolioATag").attr("href","${path}/portfolio/portfolio.dev?name=" + username)
				$("#goToTILATag").attr("href","${path}/til/mytil.dev?name=" + username)
				
			})
			
			//쪽지 보내는 모달 
			$('#sendMessage').on('show.bs.modal', function (event) {
			  var aTag = $(event.relatedTarget)
			  var recipient = aTag.data('username')
			  var modal = $(this)
			  modal.find('.modal-title').text(recipient + '에게 쪽지보내기')
			  modal.find('#recipient-name').val(recipient)
			})
			$('#sendMessageBtn').on("click",function(){
				$.ajax({
					url : "${path}/ajax/sendMessage.dev",
					type: "post",
					data : {
						me_from : "${sessionScope.loginUser.name}",
						me_to : $('#recipient-name').val(),
						title : $('#message-title').val(),
						content : $('#message-text').val()
					},
					success : function(s) {
						alert(s);
						$('#message-title').val("");
						$('#message-text').val("");
						$('#sendMessage').modal("hide");
						location.reload();
						
					},
					error : function(e) {
						alert("오류발생")
					}
				})
			})
			
			//신고하기 모달
			$('#report').on('show.bs.modal', function (event) {
			  var aTag = $(event.relatedTarget)
			  var reportedName = aTag.data('username')
			  var modal = $(this)
			  modal.find('#reported-name').attr("value",reportedName)
			})
			$('#reportBtn').on("click",function(){
				$.ajax({
					url : "${path}/ajax/report.dev",
					type : "post",
					data : {
						content : $('input[name=radiogGroup]:checked').val(),
						reportedName : $('#reported-name').val(),
						no : $('#no').val()
					},
					success : function(s){
						alert(s)
						$('#report').modal('hide');
						location.reload();
					},
					error : function(e){
						alert("오류발생")
					}
				})
			})
			
			//종료 버튼
			$(".modal-close").on("click",function(){
				$('#message-title').val("");
				$('#message-text').val("");
			})
		})
	</script>
	<%-- 프로필 모달 --%>
	<div class="modal fade" id="profileInfo" data-keyboard="true"
		tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="profile-modal-title"></h3>
				</div>
				<div class="modal-body" id="findid-modalbody">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3" style="text-align:center;">
								<a href="#" id="goToPortfolioATag"> <span
									style="color: #5A3FEE"><i class="fa fa-user fa-2x"
										aria-hidden="true"></i></span><br>
								<span class="modal-font" style="font-size:13px; font-weight:bold; color:black;">포트폴리오</span>
								</a>
							</div>
							<div class="col-md-3" style="text-align:center;">
								<a href="#" id="goToTILATag"> <span
									style="color: #8572EE"><i class="fa fa-code fa-2x"
										aria-hidden="true"></i></span><br>
								<span class="modal-font" style="font-size:13px; font-weight:bold; color:black;">TIL</span>
								</a>
							</div>
							<div class="col-md-3" style="text-align:center;">
								<a href="#sendMessage" data-toggle="modal"
									id="openMessageModalATag"> <span style="color: green"><i
										class="fa fa-envelope fa-2x" aria-hidden="true"></i></span><br>
								<span class="modal-font" style="font-size:13px; font-weight:bold; color:black;">쪽지보내기</span>
								</a>
							</div>
							<div class="col-md-3" style="text-align:center;">
								<a href="#report" data-toggle="modal" id="openReportModalATag">
									<span style="color: red"><i
										class="fa fa-exclamation-circle fa-2x" aria-hidden="true"></i></span><br>
								<span class="modal-font" style="font-size:13px; font-weight:bold; color:black;">신고하기</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 쪽지 보내는 모달 --%>
	<div class="modal fade" id="sendMessage" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">쪽지 보내기</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">받는 사람:</label>
							<input type="text" class="form-control" id="recipient-name"
								readonly>
						</div>
						<div class="form-group">
							<label for="message-title" class="col-form-label">제목:</label> <input
								type="text" class="form-control" id="message-title">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">내용:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary modal-close"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success" id="sendMessageBtn">발송하기</button>
				</div>
			</div>
		</div>
	</div>

	<%-- 신고하기 모달 --%>
	<div class="modal fade" id="report" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">신고하기</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					허위 신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 신중하게 신고해주세요 <br>
					<br> <input type="hidden" value="5" id="no"> <input
						type="hidden" id="reported-name"> <input type="radio"
						name="radiogGroup" value="광고/음란성 댓글" checked>&nbsp;&nbsp;광고/음란성
					댓글<br> <input type="radio" name="radiogGroup"
						value="욕설/반말/부적절한 언어">&nbsp;&nbsp;욕설/반말/부적절한 언어<br> <input
						type="radio" name="radiogGroup" value="회원 분란 유도">&nbsp;&nbsp;회원
					분란 유도<br> <input type="radio" name="radiogGroup" value="회원 비방">&nbsp;&nbsp;회원
					비방<br> <input type="radio" name="radiogGroup"
						value="지나친 정치/종교 논쟁">&nbsp;&nbsp;지나친 정치/종교 논쟁<br> <input
						type="radio" name="radiogGroup" value="도배성 댓글">&nbsp;&nbsp;도배성
					댓글
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary modal-close"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-warning" id="reportBtn">신고하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>