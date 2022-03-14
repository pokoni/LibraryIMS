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
            session.setAttribute(uid,username);
            if(login.equals("true")){
                Cookie cookie = new Cookie(uid,pwd);
            }
            response.sendRedirect("");
        }
        else{

        }
    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        connection.close();
    }
    //假设用户名是张三，密码abc
    if(name.equals("zhangsan")&&pwd.equals("abc"))
    {
        //登陆成功后，将用户信息保存在session的作用域内
        session.setAttribute("loginName",name);
        //设置session的非活动时间为10分钟
        session.setMaxInactiveInterval(60*10);
        //将请求转发到welcome.jsp
        request.getRequestDispatcher("welcome.jsp").forward(request,response);
    }
    else
    {
        //若登陆失败，返回登录页login.jsp
        response.sendRedirect("login.jsp");
    }
%>

</body>
</html>
