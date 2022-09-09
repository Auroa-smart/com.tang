<%@ page import="tang.Service.Student.StudentService" %>
<%@ page import="tang.Service.Student.StudentServiceImpl" %>
<%@ page import="tang.Entity.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="../pages/layui-v2.7.5/layui/css/layui.css">
    <title>chosen student</title>
</head>
<body>
<div style="text-align: center; width: auto; ">
    <%
    StudentService studentService =new StudentServiceImpl();%>
    <%Student student = new Student();%>
    <%student = studentService.RandomStudent();%>
    <%=student.toString()%>
</div>
<ul class="layui-nav layui-layout-right">
    <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
            tester
        </a>
        <dl class="layui-nav-child">
            <dd><a href="frame.jsp">返回首页</a></dd>
            <dd><a href="${pageContext.request.contextPath}/pick.do" >随机抽取</a></dd>

            <dd><a href="${pageContext.request.contextPath}/logout.do">Sign out</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a href="javascript:;">
            <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
    </li>
</ul>
<script src="../pages/layui-v2.7.5/layui/layui.js"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

    });
</script>
</body>
</html>
