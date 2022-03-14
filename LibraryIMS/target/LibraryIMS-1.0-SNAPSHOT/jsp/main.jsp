<%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/14
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主页面</title>
    <link rel="stylesheet" href="./static/css/main.css">
    <link rel="stylesheet" href="./static/css/bootstrap.min.css">

</head>

<body>

<!-- 头部导航栏 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <div class="logo"><img src="./img/logo.png" alt=""></div>
                <img src="./img/logo_wz.png" alt="" class="school-name">
            </a>
            <form class="form-inline">
                <div class="form-group">
                    <label for="exampleInputName2">书名:</label>
                    <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入书名:">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">作者名字:</label>
                    <input type="text" class="form-control" id="exampleInputEmail2" placeholder="请输入作者名字：">
                </div>
                <button type="submit" class="btn btn-default">图书查询</button>
                <button type="submit" class="btn btn-default">图书添加</button>
            </form>
        </div>
        <!-- 查询表单 -->




    </div>

</nav>
<!-- 主页内容 -->
<div class="container">
    <!-- 左侧文字 -->
    <div class="jumbotron">
        <h1>Hello, world!</h1>
        <p>我是胡耀华 喜欢大黑丝</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>

    </div>

    <!-- 右侧表格 -->
    <div class="table-container pre-scrollable">
        <table class="table table-striped table-bordered">
            <!-- On rows -->
            <tr class="active"><span class="list">图书列表</span></tr>
            <tr class="success"></tr>
            <tr class="warning"></tr>
            <tr class="danger"></tr>
            <tr class="info"></tr>

            <!-- On cells (`td` or `th`) -->
            <tr>
                <td class="active">图书id</td>
                <td class="success">图书名</td>
                <td class="warning">出版社</td>
                <td class="danger">作者</td>
                <td class="info">是否在管</td>
                <td class="info">累计借还</td>
            </tr>
            <tr>
                <td class="active">001</td>
                <td class="success">性欲</td>
                <td class="warning">十八岁出版社</td>
                <td class="danger">十八</td>
                <td class="info">是</td>
                <td class="info">9999</td>
            </tr>

        </table>
    </div>
</div>

</body>

</html>