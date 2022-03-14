<%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/12
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="..\static\css\Login.css">

<%--    <link rel="stylesheet" href="./css/bootstrap.min.css">--%>

</head>

<body>
<div class="main-contaiener">
    <!-- 页面头部 -->
    <div class="head-container">

        <div class="container">
            <div class="logo">图书馆管理系统</div>
            <li><a href="javascript:;">|  企业邮箱</a></li>
            <li><a href="javascript:;">| 手机版</a></li>
            <li><a href="javascript:;">| English</a></li>
            <li><a href="javascript:;">基本版</a></li>

        </div>



    </div>
    <!-- 登录框 -->
    <div class="login">
        <div class="login-head">
            <span>用户登入</span>
        </div>
        <!--账户密码框  -->
        <form method="post" action="check.jsp">
            <div class="number">
                <input type="text" placeholder="请输入账号" class="account" name="uid">
            </div>
            <div class="pawssword">
                <input type="password" placeholder="请输入密码" class="account" name="upwd">
                <li class="agree"><input type="checkbox" name="nexttime" value="true"> 下次自动登入</li>
            </div>
<%--            登录按钮--%>
            <div class="login-btn">
                <input type="submit" value="授权登录">
            </div>

        </form>

        <!-- 登陆按钮 -->
<%--        <div class="login-btn">--%>
<%--            <input type="submit" value="授权登录">--%>
<%--        </div>--%>
    </div>

    <!-- 左侧文字框 -->
    <div class="words-container">
        <li>
            知识改变命运 <br>
            <span >&nbsp;To change the fate of knowledge,knowledge of life.</span>
        </li>

    </div>

</div>

</body>

</html>
