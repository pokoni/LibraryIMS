<%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/12
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link rel="stylesheet" type="text/css" href="../static/css/maincss.css">
</head>
<body>
<div class="container">
    <div class="header">
<div class="header_link">
    <a href="">基本版</a>
    &nbsp;|&nbsp;
    <a href="">English</a>
    &nbsp;|&nbsp;
</div>
</div>
    <div class="content">
        <div class="content_wrapper">
            <div class="xm_login_container login_container" id="login" style="width: 330px;
                    height:336px; visibility: visible;">
                <div class="xm_login_card">
                    <div class="xm_login_card_tab">
                        <div class="xm_login_card_tab_item" id="adiminLoginTab">管理员登录</div>
                        <div class="xm_login_card_tab_item" id="userLoginTab">用户登录</div>
                    </div>

                </div>
                <div class="xm_login_card_cnt" >
                    <div class="xm_login_card_admin" id="adminLoginCard">
<%--                        <iframe id="login_admin_iframe" class="login_loginBox_admin_iframe"--%>
<%--                                height="100%" width="100%" frameborder="no" scrolling="no"--%>
<%--                                src="test.jsp"></iframe>--%>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
