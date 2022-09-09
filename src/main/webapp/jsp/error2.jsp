
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        a{
            font-size: 20px;
        }
    </style>
</head>
<body>
<p style="font-size: 20px;">您当前不是管理员，不能进入管理界面！</p>
<a href="${pageContext.request.contextPath}/jsp/home.jsp">返回</a>
</body>
</html>
