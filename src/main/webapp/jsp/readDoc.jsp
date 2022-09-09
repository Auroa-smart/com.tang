<%@ page import="java.util.ArrayList" %>
<%@ page import="tang.Entity.File" %>
<%@ page import="java.util.List" %>
<%@ page import="tang.Service.File.FileService" %>
<%@ page import="tang.Service.File.FileServiceImpl" %>
<%@ page import="tang.Dao.File.FileDao" %>
<%@ page import="tang.Dao.File.FileDaoImpl" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="tang.util.BaseDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有文档</title>
        <style>
            body{
                background: beige;
            }
            p{
                font-size: 16px ;
                font-family: "微软雅黑", "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei", "Hiragino Sans GB", "Heiti SC", "WenQuanYi Micro Hei";
            }
            div{
                margin: 100px;
                text-align: center;
                line-height: 30px;
            }
            #news-content{

            }
        </style>
</head>

<body>
<%--//翻页查询所有文档--%>
<div>
    <% List<File> fileList = new ArrayList<>();%>
    <% FileDao fileDao = new FileDaoImpl();%>
    <%FileService fileread = new FileServiceImpl();%>
    <% Connection con = BaseDao.getConnection();%>

    <%fileList = fileDao.fileRead(con);%>
    <%for(File file:fileList){%>
    <%String text = fileread.FileRead(file.getFilepath());%>
    <article><%=text%></article>
    <br>
    <br>
    <br>
    <%}%>
    <%BaseDao.closeResource(con,null,null);%>
</div>

</body>
</html>

