<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="../pages/html/css/style.css" type="text/css" media="all"/>
</head>
<body style="width: 400px; margin:100px 500px ">
<div>
<form action="${pageContext.request.contextPath}/user.do" method="post">
    <input type="hidden" name="method" value="pwdmodify">
    <div>

        <div class="input-group">
            <span><i class="fas fa-user" aria-hidden="true"></i></span>
            <input type="text" name="user_id" placeholder="用户ID" required="">
        </div>
        <div class="input-group">
            <span><i class="fas fa-user" aria-hidden="true"></i></span>
            <input type="text" name="user_name" placeholder="用户名" required="">
        </div>
        <div class="input-group">
            <span><i class="fas fa-user" aria-hidden="true"></i></span>
            <input type="text" name="oldpassword" placeholder="旧密码" required="">
        </div>
        <div class="input-group">
            <span><i class="fas fa-key" aria-hidden="true"></i></span>
            <input type="text" name="newpassword" placeholder="新密码" required="">
        </div>
        <div class="form-row bottom">
        </div>
        <button class="btn btn-primary btn-block" type="submit">修改</button>
    </div>
</form>
    <a href="${pageContext.request.contextPath}/jsp/home.jsp">
    <button class="btn btn-primary btn-block" type="button">返回</button>
    </a>
</div>
</body>
</html>
