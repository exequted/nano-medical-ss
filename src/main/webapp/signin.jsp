<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>Sign in - Progressus Bootstrap template</title>

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/gt_favicon.png">
	
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<!-- Fixed navbar -->
	<jsp:include page="wrapper/nav-bar.jsp"/>
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
			<li class="active">User access</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Sign in</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Sign in to your account</h3>
							<p class="text-center text-muted">Feel free to <a href="signup.jsp">Register</a> in case you forgot some credentials or just want a new account. </p>
							<hr>
							
							<form action="${pageContext.request.contextPath}/nano-medical/signin.jsp" method="post">
								<div class="top-margin">
									<label>Username <span class="text-danger">*</span></label>
									<input type="text" name="username" class="form-control">
								</div>
								<div class="top-margin">
									<label>Password <span class="text-danger">*</span></label>
									<input type="password" name="password" class="form-control">
								</div>
								<div>
									<% if (request.getAttribute("errorMessage") != null){
									    %> <label style="color: darkred"><%= request.getAttribute("errorMessage") %></label> <%
									}%>
								</div>

								<hr>

								<div class="row">

									<div class="col-lg-4 text-right">
										<button class="btn btn-action" type="submit">Sign in</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	

	<jsp:include page="wrapper/footer.jsp"/>
		

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/headroom.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jQuery.headroom.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
</body>
</html>