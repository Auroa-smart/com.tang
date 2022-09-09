<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
    <style>
        .providerAdd {
            border: 12px solid #9ac70f;
            padding: 20px;
            margin: 20px;
            width: 500px;
        }

        .providerAdd form {

        }

        .providerAdd div {
            margin-top: 12px;
            margin-bottom: 12px;
        }

        .providerAdd label {
            width: 200px;
            display: inline-block;
            text-align: right;
        }

        .providerAdd input ,.providerAdd select{
            width: 260px;
            height: 30px;
            line-height: 30px;
            border-radius: 4px;
            outline: none;
            padding-left: 10px;
            border: 1px solid #4987c0;
            box-shadow: 1px 1px 1px #99afc4;
        }

        .providerAdd input:focus,.providerAdd select:focus {
            border: 1px solid #0e56a8;
            background: rgba(238, 236, 240, 0.2);
            -webkit-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;
            -moz-box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;
            box-shadow: 0px 1px 4px 0px rgba(168, 168, 168, 0.9) inset;
        }

        .providerAdd span {
            margin-left: 20px;
            color: #faca0d;
        }
    </style>
<body>
<div class="right">
    <div class="location">
        <strong>你现在的位置是</strong>
        <span>用户管理页面 >> 用户添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath}/user.do">
        <input type="hidden" name="method" value="add">
<%--        div的class 为error为验证错误 ok为成功--%>
        <div>
            <label for="user_id">用户id</label>
            <input type="text" name="user_id" id="user_id" value="">
<%--            放置提示信息--%>
            <font color="red"></font>

        </div>
        <div>
            <label for="user_name">用户名</label>
            <input type="text" name="user_name" id="user_name" value="">
            <%--            放置提示信息--%>
            <font color="red"></font>
        </div>
            <div>
                <label for="user_name">用户角色</label>
                <input type="text" name="user_role" id="user_name" value="">
                <%--            放置提示信息--%>
                <font color="red"></font>
            </div>
        <div>
        <label for="password">用户密码</label>
        <input type="text" name="password" id="password" value="">
        <%--            放置提示信息--%>
        <font color="red"></font>
        </div>

        <div>
        <label for="rpassword">确认密码</label>
        <input type="text" name="rpassword" id="rpassword" value="">
        <%--            放置提示信息--%>
        <font color="red"></font>
        </div>
        <input type="submit" value="保存" style="width: 100px">
    </div>

  </div>
</form>
</body>
</html>
