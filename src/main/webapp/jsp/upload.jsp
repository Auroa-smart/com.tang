<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/header02.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--上传文件--%>
<div>
<form class="file" action="${pageContext.request.contextPath}/file.do" method="post" enctype="multipart/form-data">

<%--    <select name="type" id="">--%>
<%--        <option value="视频">视频</option>--%>
<%--        <option value="图片">图片</option>--%>
<%--        <option value="文档">文档</option>--%>
<%--    </select>--%>
    <input type="hidden" name="method" value="upload">
    <input type="file" name="uploadFile" /> <br/><br/>
    <input type="submit" value="上传" />
</form>
</div>
<%--<div>--%>
<%--    <video id="my-video" class="video-js vjs-big-play-centered" controls="controls" poster="">--%>
<%--        <source src="${pageContext.request.contextPath}/video.do" type='video/mp4'>--%>
<%--    </video>--%>
<%--    <video src="E:\1.mp4" width="300" height="240" type="video/mp4" controls="controls" ></video>--%>
<%--    <video loop="loop" controls="controls" poster="">--%>
<%--        <source src="D:\1.mp4" type="video/mp4">--%>
<%--    </video>--%>

<%--</div>--%>

</body>
</html>
