<%@ page import="com.java.Util.DbUtil" %>
<%@ page import="com.java.Dao.UserDao" %>
<%@ page import="com.java.model.User" %>
<%@ page import="java.sql.Connection" %>
<%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/17
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<%
    //将post请求方式的编码设置为utf-8
    request.setCharacterEncoding("utf-8");
    String uid=request.getParameter("uid");
    String pwd=request.getParameter("upwd");
    String uname =request.getParameter("uname");
    System.out.println(uid);
    System.out.println(pwd);
    System.out.println(uname);

    //链接数据库
    Connection connection=null;
    DbUtil dbUtil = new DbUtil();
    UserDao userDao=new UserDao();

    //将表单传来的信息封装，用于和数据库做对比
    User user=new User();
    user.setUserId(uid);
    user.setPassword(pwd);
    user.setUsername(uname);


    try{
        connection=dbUtil.getCon();
        int current =userDao.add(connection,user);
        if(current !=0){
            response.sendRedirect("Login.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        connection.close();
    }
%>
<body>


</body>
</html>
