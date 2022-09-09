<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>


<div class="right">
  <div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户信息查看页面</span>
  </div>
  <div class="providerView">
      <p><strong>用户id：</strong>
        <span>${userId}</span></p>
    <p><strong>用户名称：</strong>
        <span>${userName}</span></p>
    <p><strong>用户密码：</strong>
        <span>${password}</span></p>
    <p><strong>用户角色：</strong>
        <span>${role}</span></p>
    <div class="providerAddBtn">
        <a class="search-button"  href="${pageContext.request.contextPath}/jsp/userList.jsp">返回</a>
    </div>
  </div>
</div>

