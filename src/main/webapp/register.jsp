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
    <h1>Service Register Form</h1>
    <!-- container -->
    <div class="container">
        <!-- main content -->
        <div class="w3l-form-info">
            <div class="w3_info">
                <h2>注册</h2>
                <form action="${pageContext.request.contextPath}/register.do" method="get">
                    <div class="input-group">
                        <span><i class="fas fa-user" aria-hidden="true"></i></span>
                        <input type="text" name="uid" placeholder="用户id" required="">
                    </div>
                        <div class="input-group">
                            <span><i class="fas fa-user" aria-hidden="true"></i></span>
                            <input type="text" name="uname" placeholder="用户名" required="">
                        </div>
                        <div class="input-group">
                            <span><i class="fas fa-key" aria-hidden="true"></i></span>
                            <input type="text" name="upassword" placeholder="密码" required="">
                        </div>
                    <input type="hidden" name="urole" value="1">
<%--                        <div class="input-group">--%>
<%--                            <span><i class="fas fa-key" aria-hidden="true"></i></span>--%>
<%--                            <input type="text" name="role" placeholder="用户角色" required="">--%>
<%--                        </div>--%>
                        <div class="form-row bottom">
                        </div>
                        <button class="btn btn-primary btn-block" type="submit">Login</button>
                </form>
                <div class="social-login">
                </div>
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
