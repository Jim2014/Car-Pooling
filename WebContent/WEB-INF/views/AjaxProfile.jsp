<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<script>
		$(document).ready(function() {
			$(".likeButton${post.postId}").click(function() {
				let postId = $('#postId${post.postId}').attr('value');
				let userId = $('#userIdInPost${post.userId}').attr('value');
				let loggedInUserId = $('#loggedInUserId').attr('value');
			
				$.ajax({
					url : "like",
					type : "POST",
					data : {
						'userId' : userId,
						'postId' : postId,
						'loggedInUserId': loggedInUserId
					},
					success : ajaxSuccess,
					error : ajaxFailure
				});
				 function ajaxSuccess(responseText) {
						console.log('ajax success');
						$("#ajaxSuccessReturn${post.postId}").text(responseText);
						$(".likeButton${post.postId}").removeClass("glyphicon glyphicon-thumbs-up").addClass("glyphicon glyphicon-ok");
					}
			});
			
			$(".commentShowButton${post.postId}").click(function() {
				let postId = $('#postId${post.postId}').attr('value');
				let userId = $('#userIdInPost${post.userId}').attr('value');
				let loggedInUserId = $('#loggedInUserId').attr('value');
			
				$.ajax({
					url : "comment",
					type : "GET",
					data : {
						'userId' : userId,
						'postId' : postId,
						'loggedInUserId': loggedInUserId
					},
					success : ajaxSuccess3,
					error : ajaxFailure
				});
				function ajaxSuccess3(responseText) {
					//console.log('comment saved to database--> response txt->'+responseText);
					
					$(".ajaxshowComments${post.postId}").html(responseText);
					$("#commentCount${post.postId}").text(0);		
				}
			});
			
			$(".replyButton${post.postId}").click(function() {
				let replyBox = "<div class='replyBox input-group'><textarea id='commentArea${post.postId}' class='form-control custom-control' rows='3' style='resize:none'></textarea><span id='submitReplyButton${post.postId}' class='input-group-addon btn btn-primary'>Comment</span></div>";
				$("#ajaxSuccessReplyBox${post.postId}").html(replyBox);
			});
			}); // end of document- ready
	   
	    $(document).on("click", "#submitReplyButton${post.postId}", function () {
				let postId = $('#postId${post.postId}').attr('value');
				let userId = $('#userIdInPost${post.userId}').attr('value');
				let loggedInUserId = $('#loggedInUserId').attr('value');
				let comment = $('#commentArea${post.postId}').val();
				console.log(postId);
				console.log(userId);
				console.log(loggedInUserId);
				console.log(comment);
				
				$.ajax({
					url : "comment",
					type : "POST",
					data : {
						'userId' : userId,
						'postId' : postId,
						'loggedInUserId': loggedInUserId,
						'comment':comment
					},
					success : ajaxSuccess2,
					error : ajaxFailure
				});
				function ajaxSuccess2(responseText) {
					$("#commentCount${post.postId}").text(parseInt($("#commentCount${post.postId}").text()) + 1);
					$(".replyBox").hide();
				}
		});
	   function ajaxFailure(xhr, status, exception) {
			console.log(xhr, status, exception);
		}
		
	</script>
