<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is the login page of our Web Application</title>
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
	<div class="container">
		<div class="row">
			<div>

				<%
					if (request.getAttribute("errors") != null) {
				%>

				<fieldset>
					<legend>Errors</legend>
					<ul>
						<%
							if (request.getAttribute("username-error") != null) {
						%>
						<li class="error">Username error!</li>
						<%
							}
						%>

						<%
							if (request.getAttribute("password-error") != null) {
						%>
						<li class="error">Password error!</li>
						<%
							}
						%>

					</ul>
				</fieldset>

				<%
					}
// 					request.removeAttribute("username-error");
				%>

				<form action="LoginServlet" method="POST">

					<div class="form-group">
						<h2>This is the login page of our Web Application...</h2>
					</div>

					<div class="form-group">
						<label>Username</label> <input type="text" id="usernameId" name="user"
							value="<%=request.getAttribute("user-name")%>"
							class="form-control" style="width: 20%;">
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password" id="passwordId"
							name="pass" class="form-control" style="width: 20%;">
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-success"
							style="margin-top: 10px;">Submit</button>
					</div>


					<a>${msg}</a>

				</form>
			</div>
		</div>
	</div>
</body>

</html>