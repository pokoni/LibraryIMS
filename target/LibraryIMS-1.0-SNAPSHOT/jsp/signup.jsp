<%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/15
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" href="http://localhost:63342/LibraryIMS/src/main/webapp/static/css/signup.css">
</head>

<body>
<!-- 页面头部 -->
<nav class="nabber-container">
    <div class="logo">
        <img src="../static/img/logo.png" alt="">
    </div>
    <div class="school-name">
        <img src="../static/img/logo_wz.png" alt="">
    </div>

</nav>
<!-- 注册主体 -->
<div class="container">
    <div class="title">
        <h1>欢迎注册图书账户</h1>
        <h3>每一天，乐在阅读。</h3>
    </div>
    <form method="post" action="signupcheck.jsp">
        <div class="form-group">
            <input type="text" class="form-control" name="uid" placeholder="UID">
        </div>
        <div class="form-group">
            <input type="text" class="form-control ipt" name="uname" placeholder="昵称">
        </div>
        <div class="form-group">
            <input type="password" class="form-control ipt" name="upwd" placeholder="密码">
        </div>
        <div>
            <input type="submit" class="btn-form btn-corner" value="立即注册">
        </div>
    </form>
    <div class="pic">
        <img src="http://localhost:63342/LibraryIMS/src/main/webapp/static/img/zhuceimg.jpg" alt="">
    </div>
</div>
</body>

</html>