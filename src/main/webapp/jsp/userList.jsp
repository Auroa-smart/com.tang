<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<html lang="zh">
<head>
    <title>Title</title>
</head>
<body>
<!--主体内容-->
<section class="publicMain ">
<div class="right">
    <div class="location">
        <strong>你现在的位置是:</strong>
        <span>用户管理页面 </span>
    </div>
<div class="search">
    <form method="get" action="${pageContext.request.contextPath}/user.do">
        <input name="method" value="query" class="input-text" type="hidden" >
        <span>用户名</span>
        <input name="queryname" class="input-text" type="text" value="${queryUserName}">
        <span>用户角色</span>
        <select name="queryUserRole" >
            <c:if test="${roleList!=null}">
              <option value="0">--请选择--</option>
              <c:forEach var="role" items="${roleList}">
                <option <c:if test="${role.roleId== queryUserRole}">selected="selected"</c:if>
                value="${role.roleId}">${role.roleName}</option>
              </c:forEach>
            </c:if>
        </select>

        <input type="hidden" name="pageIndex" value="1">
        <input type="submit" value="查 询" class="search-button">
        <a href="${pageContext.request.contextPath}/jsp/useradd.jsp">添加用户</a>
    </form>

</div>

<section>
   <table class="providerTable" >
       <tr class="firstTr">
           <th width="20%">用户id</th>
           <th width="20%">用户名</th>
           <th width="20%">用户密码</th>
           <th width="30%">用户角色</th>
           <th colspan="3" >操作</th>

       </tr>
       <c:forEach var="user" items="${userList}" varStatus="status">
           <tr>
               <td>
                   <span>${user.user_id}</span>
               </td>
               <td>
                   <span>${user.user_name}</span>
               </td>
               <td>
                   <span>${user.password}</span>
               </td>
               <td>
                   <span>
                       <c:if test="${user.role==1}">用户</c:if>
                       <c:if test="${user.role==2}">管理员</c:if>
                   </span>
               </td>
               <td>
                   <form action="${pageContext.request.contextPath}/user.do" method="get">
                       <input type="hidden" name="method" value="view">
                       <input type="hidden"  name="user_id" value="${user.user_id}">
                       <input type="submit" value="查看" class="search-button" >
                   </form>
               </td>
               <td><form action="${pageContext.request.contextPath}/user.do" method="get">
                       <input type="hidden" name="method" value="delete">
                       <input type="hidden"  name="user_id" value="${user.user_id}">
                       <input type="hidden"  name="user_name" value="${user.user_name}">
                       <input type="submit" value="删除" class="search-button">
                   </form>
               </td>
               <td><a class="search-button" href="${pageContext.request.contextPath}/jsp/usermodify.jsp" >修改</a></td>

           </tr>
       </c:forEach>

   </table>

    <input type="hidden" id="totalPageCount" value="${totalPageCount}">
    <c:import url="rollpage.jsp">
        <c:param name="totalCount" value="${totalCount}"/>
        <c:param name="currentPageNo" value="${currentPageNo}"/>
        <c:param name="totalPageCount" value="${totalPageCount}"/>
    </c:import>
  </section>
    <!--点击删除按钮后弹出的页面-->
</div>
</section>
</body>
</html>