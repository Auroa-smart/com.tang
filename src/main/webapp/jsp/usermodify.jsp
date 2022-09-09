<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<style>
    .providerView {
        margin: 20px 0;
        font-size: 18px;
        line-height: 30px;
        padding-top: 30px;
        border: 1px dashed #3d4f1b;
    }

    .providerView strong {
        display: inline-block;
        width: 200px;
        text-align: right;
    }

    .providerView span {
        color: #bd644e;
    }

    .providerView a {
        margin-left: 520px;
        position: relative;
        top: 60px;
    }

    /*供应商管理页面-->供应商添加页面*/
    .providerAdd {
        border: 1px solid #9ac70f;
        padding: 20px;
        margin: 20px;
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

    /*验证错误*/
    .providerAdd .error span {
        color: red;
    }

    .providerAdd .error input {
        border: 1px solid red;
    }

    /*验证成功*/
    .providerAdd .ok span {
        color: green;
    }

    .providerAdd .ok input {
        border: 1px solid green;
    }

    .providerAddBtn {
        margin-left: 240px;
        padding-top: 20px;
    }

    .providerAddBtn a ,
    .providerAddBtn input[type='submit'],
    .providerAddBtn input[type='button'] {
        display: inline-block;
        width: 100px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        border-radius: 4px;
        border: transparent;
        background: linear-gradient(to bottom, #85c0ec, #6aa7d6, #508dc6, #306fb4, #17559e);
        color: #fff;
        cursor: pointer;
        font-weight: bold;
        font-size: 14px;
        vertical-align: top;
    }

    .providerAddBtn a:active,
    .providerAddBtn a:focus,
    .providerAddBtn a:hover,
    .providerAddBtn input[type='submit']:hover,
    .providerAddBtn input[type='submit']:focus{
        background: linear-gradient(to bottom, #7aaed4, #578bb4, #406e99, #225792, #0d2d54);
    }

    .providerAdd input[type='radio']{
        width: 20px;
        height: 14px;
        line-height:12px;
        border-radius: 4px;
        outline: none;
        padding-left: 10px;
        border: none;
        box-shadow: none;
    }
    #userName,#userOP,#userNP,#userId{
        font-size: 12px;

    }

</style>
<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户修改页面</span>
  </div>
  <div class="providerAdd">
    <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user.do">
      <input type="hidden" name="method" value="pwdmodify">
        <label for="userName">用户id：</label>
       <input type="text" name="user_id" id="userId">
      <div>
        <label for="userName">用户名称：</label>
        <input type="text" name="user_name" id="userName">
      </div>
      <div>
          <label for="userName">旧密码：</label>
          <input type="text" name="oldpassword" id="userOP" >
      </div>
      <div>
          <label for="userName">新密码：</label>
          <input type="text" name="newpassword" id="userNP" >
        <font color="red"></font>
      </div>
<%--      </div>--%>
<%--      <div>--%>
<%--        <label >用户性别：</label>--%>
<%--        <select name="gender" id="gender">--%>
<%--          <c:choose>--%>
<%--            <c:when test="${user.gender == 1 }">--%>
<%--              <option value="1" selected="selected">男</option>--%>
<%--              <option value="2">女</option>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--              <option value="1">男</option>--%>
<%--              <option value="2" selected="selected">女</option>--%>
<%--            </c:otherwise>--%>
<%--          </c:choose>--%>
<%--        </select>--%>
<%--      </div>--%>
<%--      <div>--%>
<%--      <div>--%>
<%--        <label >用户角色：</label>--%>
<%--        <!-- 列出所有的角色分类 -->--%>
<%--        <input type="hidden" value="${user.userRole }" id="rid" />--%>
<%--        <select name="userRole" id="userRole"></select>--%>
<%--        <font color="red"></font>--%>
<%--      </div>--%>
      <div class="providerAddBtn">
        <input type="submit" name="save" id="save" value="保存" />
        <input type="button" id="back" name="back" value="返回"/>
      </div>
    </form>
  </div>
</div>

<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/usermodify.js"></script>--%>