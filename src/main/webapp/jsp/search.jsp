<%@ page isELIgnored="false" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<title>资料搜索</title>
<head>
    <style>
        #keyword {
            background-image: url('https://static.runoob.com/images/mix/searchicon.png'); /* 搜索按钮 */
            background-position: 10px 12px; /* 定位搜索按钮 */
            background-repeat: no-repeat; /* 不重复图片 */
            width: 100%;
            font-size: 16px;
            padding: 12px 20px 12px 40px;
            border: 1px solid #ddd;
            margin-bottom: 12px;
        }

        #myTable {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
        }

        #myTable th, #myTable td {
            text-align: left;
            padding: 12px;
        }

        #myTable tr {
            /* 表格添加边框 */
            border-bottom: 1px solid #ddd;
        }

        #myTable tr.header, #myTable tr:hover {
            /* 表头及鼠标移动过 tr 时添加背景 */
            background-color: #f1f1f1;
        }
    </style>
    <script>
        // onclick事件
        function search() {
            // var $keyword = $("#keyword").val();
            var $keyword = document.getElementById("keyword").value;
            // todo 发起请求
            window.location.href = "/query?param=" + $keyword;
        }

        // 按Enter键,执行事件
        function entersearch() {
            var event = window.event || arguments.callee.caller.arguments[0];
            if (event.keyCode == 13) {
                search();
            }
        }
    </script>
</head>
<body>

<div style="margin: 20px 122px">
    <%--<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search">--%>
    <input type="text" name="keyword" id="keyword" placeholder="Search" onkeydown="entersearch()"/>

    <table id="myTable">
        <tr class="header">
            <th style="width:15%;"></th>
            <th style="width:15%;"></th>
            <th style="width:15%;"></th>
            <th style="width:15%;"></th>
            <th style="width:15%;"></th>
            <th style="width:15%;"></th>
        </tr>
        <c:forEach items="${file}" var="f" varStatus="vs">
            <tr>
                <td>${f.id}</td>
                <td>${f.startTime}</td>
                <td>${u.endTime}</td>
                <td>${u.hostss}</td>
                <td>${u.rule}</td>
                <td>${u.type}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>