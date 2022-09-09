<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
        <style>
            body{

            }
            .top-bar{
                display: flex;
                width: 100%;
                height: 50px;
                background-color: lightskyblue;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            li{
                margin: 20px;
                list-style: none;
                color: white;
            }
            li:hover{
                font-size: 16px;
                text-decoration:  deepskyblue underline 5px;
            }
            .article{
                margin: 30px;
                text-align: center;
                border: #0c89de 5px;
                /*去掉圆点*/
                font-size: 14px;
            }
            .button{
                background-color: dodgerblue;
                width: 50px;
                height: 30px;
                border-radius: 10px;
            }
            div{
                width: 800px;
                height: 500px;
                background-color: lightblue;
                opacity: 0.5;
                border-radius: 20px;
                margin:20px 0px 30px 300px;
                text-align: center;
            }
            input{
                font-size: 30px;
                width: 300px;
                height: 100px;
                /*line-height: ;*/
                margin-top:50px;
                border-radius: 15px;
            }

        </style>

</head>
<body>
<!--//上方导航栏-->
<%--<ul class="top-bar">--%>
<%--    <li><a href="${pageContext.request.contextPath}"></a>插入图片</li>--%>
<%--    <li><a href="${pageContext.request.contextPath}"></a>上传视频</li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/jsp/upload.jsp"></a>上传文件</li>--%>
<%--</ul>--%>
</body>
</html>
