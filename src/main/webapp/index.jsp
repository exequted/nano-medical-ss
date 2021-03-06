<%@ page import="entity.IUser" %>
<%@ page import="entity.Role" %>
<%@ page import="entity.Client" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" xmlns:fb="http://www.w3.org/1999/xhtml" xmlns:g="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport"    content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">

    <title>Nano Medical - Progressive Medical Center</title>

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

<body class="home">
<jsp:include page="wrapper/nav-bar.jsp"/>
<!-- Header -->
<header id="head">
    <div class="container">
        <div class="row">
            <h1 class="lead">EFFECTIVE, CAREFUL, PROFESSIONAL</h1>
            <form method="get" class="probootstrap-form-appointment">
                <p>
                    <input formaction="${pageContext.request.contextPath}/about.jsp" class="btn btn-default btn-lg" role="button" type="submit" name = "More" value="MORE INFO">
                    <% if (session.getAttribute("user") != null) {
                    %> <input formaction="${pageContext.request.contextPath}/nano-medical/<%= (((Role) session.getAttribute("role")) == Role.CLIENT) ? "client-profile" : "doctor-profile"%>" class="btn btn-action btn-lg" role="button" type="submit" name = "Download" value="Profile">  <%
                       } else {
                    %> <input formaction="${pageContext.request.contextPath}/signup.jsp" class="btn btn-action btn-lg" role="button" type="submit" name = "Download" value="Register"> <%
                    }%>
                </p>
            </form>
        </div>
    </div>
</header>
<!-- /Header -->

<!-- Intro -->
<div class="container text-center">
    <br> <br>
    <h2 class="thin">The best medical center</h2>
    <p class="text-muted">
        Was nominated as one of the gratest clinics in the World
    </p>
</div>
<!-- /Intro-->
<!-- Highlights - jumbotron -->
<div class="jumbotron top-space">
    <div class="container">
        <h3 class="text-center thin">Reasons to visit Nano Medical</h3>

        <div class="row">
            <div class="col-md-3 col-sm-6 highlight">
                <div class="h-caption"><h4><i class="fa fa-cogs fa-5"></i>Friendly doctors</h4></div>
                <div class="h-body text-center">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque aliquid adipisci aspernatur. Soluta quisquam dignissimos earum quasi voluptate. Amet, dignissimos, tenetur vitae dolor quam iusto assumenda hic reprehenderit?</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 highlight">
                <div class="h-caption"><h4><i class="fa fa-flash fa-5"></i>Fastest service</h4></div>
                <div class="h-body text-center">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, commodi, sequi quis ad fugit omnis cumque a libero error nesciunt molestiae repellat quos perferendis numquam quibusdam rerum repellendus laboriosam reprehenderit! </p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 highlight">
                <div class="h-caption"><h4><i class="fa fa-heart fa-5"></i>Healthy alimentation</h4></div>
                <div class="h-body text-center">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, vitae, perferendis, perspiciatis nobis voluptate quod illum soluta minima ipsam ratione quia numquam eveniet eum reprehenderit dolorem dicta nesciunt corporis?</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 highlight">
                <div class="h-caption"><h4><i class="fa fa-smile-o fa-5"></i>Satisfaction</h4></div>
                <div class="h-body text-center">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, excepturi, maiores, dolorem quasi reprehenderit illo accusamus nulla minima repudiandae quas ducimus reiciendis odio sequi atque temporibus facere corporis eos expedita? </p>
                </div>
            </div>
        </div> <!-- /row  -->

    </div>
</div>
<!-- /Highlights -->

<!-- container -->
<div class="container">

    <h2 class="text-center top-space">Try and you'll love it!</h2>
    <div class="jumbotron top-space">
        <h4>Dicta, nostrum nemo soluta sapiente sit dolor quae voluptas quidem doloribus recusandae facere magni ullam suscipit sunt atque rerum eaque iusto facilis esse nam veniam incidunt officia perspiciatis at voluptatibus. Libero, aliquid illum possimus numquam fuga.</h4>

    </div>

</div>	<!-- /container -->

<!-- Social links. @TODO: replace by link/instructions in template -->
<section id="social">
    <div class="container">
        <div class="wrapper clearfix">
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style">
                <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                <a class="addthis_button_tweet"></a>
                <a class="addthis_button_linkedin_counter"></a>
                <a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
            </div>
            <!-- AddThis Button END -->
        </div>
    </div>
</section>
<!-- /social links -->

<jsp:include page="wrapper/footer.jsp"/>

<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/headroom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jQuery.headroom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
</body>
</html>
