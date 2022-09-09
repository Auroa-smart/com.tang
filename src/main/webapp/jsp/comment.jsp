<%@ page import="tang.Service.Comment.CommentService" %>
<%@ page import="tang.Service.Comment.CommentServiceImpl" %>
<%@ page import="tang.Entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<head>
    <title>Comment</title>
    <style>
        body{
            position: static;
            background: gray;
            color: white;
            margin-left: 400px;
            width: 500px;
        }
        .comment-button{
            width: 40px;
            height: 20px;
            background: dodgerblue;
            font-size: 10px;
            border-radius: 20px;
            border-color: whitesmoke;
            margin: 6px;
            text-align: center;
            z-index: 1000;
        }
        div{
            margin: 50px 100px;
            border: 5px solid deepskyblue;
            border-radius: 10px;
        }

    </style>
</head>
<body>
<%--//写一级评论--%>
<div>
<form action="${pageContext.request.contextPath}/comment.do" method="get">
    <input type="hidden" name="method" value="writeComment">
    <input type="hidden" name="parent" value="0">
    <details class="comment-button">
        <summary >评论</summary>
        <textarea name="content" class="text" cols="30" rows="10" placeholder="请输入评论"></textarea>
        <button  class="comment-button" type="submit" >提交</button>
        <button  class="comment-button" type="reset">清空</button>
    </details>
</form>
</div>


<%--    <table>--%>
                <%CommentService commentService = new CommentServiceImpl();%>
                <%List<Comment> firstcomments = new ArrayList<>();%>
                <% firstcomments = commentService.readFirstComment();%>
                <%for(Comment firstcomment:firstcomments){%>
                <%int firstcomment_id = firstcomment.getComment_id();%>
<%--            <td>--%>
<%--                <tr>--%>
              <div><%=firstcomment.getComment_name()+":"+firstcomment.getContent()%>
<%--                </tr>--%>
<%--                <tr>--%>
                <form action="${pageContext.request.contextPath}/comment.do" method="get">
                    <input type="hidden" name="method" value="writeComment">
<%--                    回复评论的姓名--%>
                    <input type="hidden" name="parentid" value="<%=firstcomment_id%>">

                    <details class="comment-button">
                        <summary >回复</summary>
                        <textarea name="content" class="text" cols="30" rows="10" placeholder="请输入评论"></textarea>
                        <button  class="comment-button" type="submit" >提交</button>
                        <button  class="comment-button" type="reset">清空</button>
                    </details>
                </form>
              </div>
<%--                </tr>--%>
<%--            </td>--%>
<%--        <br>--%>

                <% List<Comment> secondcomments = new ArrayList<>();%>
                <% secondcomments = commentService.readSecondComment(firstcomment.getComment_id());%>
                <%for(Comment secondcomment:secondcomments){%>
<%--        <td colspan="2">--%>
<%--            <tr>--%>
             <div>&nbsp;&nbsp;&nbsp;&nbsp;<%=secondcomment.getComment_name()+"@"+firstcomment.getComment_name()+":"+secondcomment.getContent()%></div>
<%--            </tr>--%>
<%--        </td>--%>
<%--        <br>--%>
                <%}%>
                <%}%>
<%--    </table>--%>


<%--第一版--%>
<%--<form action="${pageContext.request.contextPath}/comment.do" method="get">--%>
<%--    <input type="hidden" name="method" value="readFirstComment">--%>
<%--    <input type="submit" value="查看一级评论" class="button">--%>
<%--</form>--%>

<%--&lt;%&ndash;        //评论展示&ndash;%&gt;--%>

<%--        <c:if test="${firstcomments!=null}">--%>
<%--            <c:forEach var="firstcomment" items="${firstcomments}">--%>
<%--                <table class="firstcomment">--%>
<%--                    <td>--%>
<%--                        <tr>--%>
<%--                            <span>${firstcomment.comment_name}:</span>--%>
<%--                        </tr>--%>
<%--                        <tr>&nbsp;&nbsp;&nbsp;${firstcomment.content}--%>
<%--        &lt;%&ndash;      一级评论&ndash;%&gt;--%>

<%--
<%--                        </tr>--%>
<%--                    </td>--%>
<%--&lt;%&ndash;                    二级评论&ndash;%&gt;--%>
<%--                    <td>--%>
<%--                        <tr>--%>

<%--                        </tr>--%>
<%--                    </td>--%>
<%--                </table>--%>
<%--            </c:forEach>--%>
<%--            </c:if>--%>

</body>
</html>

<%--<script>--%>
<%--    function sout() {--%>
<%--        let parentid = document.getElementById('firstcomment_id').value--%>
<%--        console.log(parentid)--%>
<%--    }--%>
<%--</script>--%>