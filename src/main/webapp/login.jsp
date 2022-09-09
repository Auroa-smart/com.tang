<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <title>Kpop World</title>
    <!-- Meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>

<%--    <!-- Google fonts -->--%>
<%--    <link href="//fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;700&display=swap" rel="stylesheet">--%>

    <!-- CSS Stylesheet -->
    <link rel="stylesheet" href="pages/html/css/style.css" type="text/css" media="all" />

</head>

<body>
<div class="signinform">
    <h1>Service Login Form</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>登录</h2>
                <form action="${pageContext.request.contextPath}/login.do" method="get">
                    <div>${error}
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input type="text" name="user_id" placeholder="用户ID" required="">
                    </div>
                    <div class="input-group">
                        <span><i class="fas fa-key" aria-hidden="true"></i></span>
                        <input type="text" name="password" placeholder="密码" required="">
                    </div>
                    <div class="form-row bottom">
                    </div>
                    <button class="btn btn-primary btn-block" type="submit">Login</button>
                    </div>
                </form>
                <div class="social-login">
                </div>
                <p class="account">Don't have an account? <a href="register.jsp">Register</a></p>
            </div>
        </div>
        <!-- //main content -->
    </div>
    <!-- //container -->
    <!-- footer -->
    <div class="footer">
        <%--    <p>&copy; 2022 Service login form. All Rights Reserved | Design by <a href="https://w3layouts.com/"--%>
        <%--                                                                          target="blank">W3layouts</a></p>--%>
    </div>
    <!-- footer -->



</div>
</body>

</html>
