<%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/14
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
    List<String> list = new ArrayList<String>();
    list.add("简单是可靠的先决条件");
    list.add("兴趣是最好的老师");
    list.add("知识上的投资总能得到最好的回报");
    request.setAttribute("list", list);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>Jsp使用c:forEach遍历List集合</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>

<body>
<b>遍历List集合的全部元素：</b>
<br>
<c:forEach items="${requestScope.list}" var="keyword" varStatus="id">
    ${id.index} ${keyword}<br>
</c:forEach>
<br>
<b>遍历List集合中第一个元素以后的元素（不包括第一个元素）：</b>
<br>
<c:forEach items="${requestScope.list}" var="keyword" varStatus="id" begin="1">
    ${id.index} ${keyword}<br>
</c:forEach>
</body>
</html>