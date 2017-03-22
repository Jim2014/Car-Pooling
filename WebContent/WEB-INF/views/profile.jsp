<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Profile</title>
<link href="car.jpg"  type="image/jpg" rel="shortcut icon"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" />
<style>
.btn-circle-like {
	width: 50px;
	height: 50px;
	text-align: center;
	padding: 13px 0;
	font-size: 20px;
	line-height: 2.00;
	border-radius: 45px;
}

.media-body>.well {
	margin-left: 206px;
}

.btn-default2 {
	color: #ffffff;
	background-color: #2cbfc8;
	border-color: #2adce8;
}

b {
	font-weight: 700;
	font-size: 20px;
}
</style>
<!-- weather include file -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgQZB1ebGaBuUrgmkPaj-SxdkHm_TXtx8"></script>
	<script src="weatherMap.js"></script>
	<script src="directionMap.js"></script>
	<link rel="stylesheet" type="text/css" href="weatherMap.css"/>

<!-- weather include file end -->
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<%@include file="FormProfile.jsp"%>
		<c:forEach var="post" items="${postList}">

			<div class="row">
				<div class="media-body">
					<div class="well well-lg">
						<h4 class="media-heading text-uppercase reviews">${post.username}</h4>
						<ul class="media-date text-uppercase reviews list-inline">
							<li class="dd">${post.dateUpdated}</li>
							<br	/>
							<li class="dd">${post.cityFrom}<a>to</a> ${post.cityTo}
							</li>
						</ul>
						<input type="text" id="postId${post.postId}"
							value="${post.postId}" hidden> <input type="text"
							id="userIdInPost${post.userId}" value="${post.userId}" hidden>

						<p class="media-comment">${post.post}</p>


						<p>
							<!-- LIKE-BUTTON--------- -->
							<i class="likeButton${post.postId}"><a
								class="btn btn-default btn-circle-like"> <span
									class="glyphicon glyphicon-thumbs-up"> </span>
							</a></i>

							<!--REPLY--BUTTON-------- -->
							<a
								class="replyButton${post.postId} btn btn-success btn-circle text-uppercase">
								<span class="glyphicon glyphicon-share-alt"></span>Reply
							</a>

							<!-- COMMENTS--BUTTON--------- -->
							<a class="commentShowButton${post.postId} btn btn-warning btn-circle text-uppercase" 
								data-toggle="collapse"> <span class="glyphicon glyphicon-comment"></span> <em id="commentCount${post.postId}">0</em> new comments
							</a> 

							<!--display route map--BUTTON-------- -->
							<button type="button" onclick="displayDirectionMapWindow('${post.cityFrom}','${post.cityTo}')" class="btn btn-info">Route</button>
						</p>

						<p id="ajaxSuccessReturn${post.postId}"></p>
						<p id="ajaxSuccessReplyBox${post.postId}"></p>
						<p class="ajaxshowComments${post.postId}"></p>
						
					</div>

				</div>
			</div>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
			<%@include file="AjaxProfile.jsp"%>	
		</c:forEach>

	</div>
	<%@include file="footer.jsp"%>
</body>
</html>