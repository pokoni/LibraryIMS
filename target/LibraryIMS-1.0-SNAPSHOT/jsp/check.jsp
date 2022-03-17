<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.Util.DbUtil" %>
<%@ page import="com.java.Dao.UserDao" %>
<%@ page import="com.java.model.User" %><%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/13
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //将post请求方式的编码设置为utf-8
    request.setCharacterEncoding("utf-8");
    String uid=request.getParameter("uid");
    String pwd=request.getParameter("upwd");
    String login =request.getParameter("nexttime");

    //链接数据库
    Connection connection=null;
    DbUtil dbUtil = new DbUtil();
    UserDao userDao=new UserDao();

    //将表单传来的信息封装，用于和数据库做对比
    User user=new User();
    user.setUserId(uid);
    user.setPassword(pwd);

    try{
        connection=dbUtil.getCon();
        User currentUser = userDao.login(connection,user);
        if(currentUser!=null)
        {
            String username=currentUser.getUsername();
            //将用户名保存到客户端
            Cookie cookieUname = new Cookie("uname",username);
            response.addCookie(cookieUname);
            session.setAttribute(uid,username);
            if(login.equals("true")){
                Cookie cookieUid = new Cookie("uid",uid);//保存账号
                Cookie cookiePwd = new Cookie("pwd",pwd);//保存密码
                response.addCookie(cookieUid);//将cookie保存到客户端
                response.addCookie(cookiePwd);
            }
            response.sendRedirect("main.jsp");
            session.setMaxInactiveInterval(60*10);

        }
        else{
            request.setAttribute("message","用户名或密码错误");
            request.getRequestDispatcher("Login.jsp").forward(request,response);

        }
    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        connection.close();
    }

%>

</body>
</html>
