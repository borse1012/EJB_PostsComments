<%@page import="com.presentation.entity.Comment"%>
<%@page import="com.presentation.entity.Posts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>


</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div style="margin-left: 20px">
				<a href="#" class="navbar-brand"> Member Page </a>
			</div>
			
			<button type="button" class="btn btn-default btn-sm" onclick="logout()">
				<span class="glyphicon glyphicon-log-out"></span> Log out
			</button>
		</nav>
	</header>
	<div class="container">

		<form action="MemberServlet" id="memberForm" method="POST">

			<button type="button" class="btn btn-info" onclick="getPosts()">Get
				Posts</button>
			<button type="button" class="btn btn-info" onclick="getComments()">Get
				Comments</button>

			<input type="hidden" name="queryType" id="queryType">
		</form>
		<%
			Boolean isResult = (Boolean) request.getAttribute("result");
		if (isResult != null && isResult) {

			if (request.getAttribute("postData") != null) {
				Posts posts = (Posts) request.getAttribute("postData");
		%>

		<fieldset>
			<legend>Post</legend>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>User Id</th>
						<th>Post Id</th>
						<th>Title</th>
						<th>Body</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=posts.getUserId()%></td>
						<td><%=posts.getId()%></td>
						<td><%=posts.getTitle()%></td>
						<td><%=posts.getBody()%></td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<%
			}

		if (request.getAttribute("commentsData") != null) {
			Comment[] comments = (Comment[]) request.getAttribute("commentsData");
		%>

		<fieldset>
			<legend>Comments</legend>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Post Id</th>
						<th>Comment Id</th>
						<th>Name</th>
						<th>Email</th>
						<th>Body</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Comment c : comments) {
					%>
					<tr>
						<td><%=c.getPostId()%></td>
						<td><%=c.getId()%></td>
						<td><%=c.getName()%></td>
						<td><%=c.getEmail()%></td>
						<td><%=c.getBody()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</fieldset>

		<%
			}
		%>
		<%
			}
		%>

	</div>

	<script type="text/javascript">
		function getPosts() {
			document.getElementById("queryType").value = "POSTS";
			document.getElementById("memberForm").submit();
		}

		function getComments() {
			document.getElementById("queryType").value = "COMMENTS";
			document.getElementById("memberForm").submit();
		}
		
		function logout() {
			document.getElementById("queryType").value = "LOGOUT";
			document.getElementById("memberForm").submit();
		}
	</script>
</body>

</html>