<%@ page import="com.java.Util.DbUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.java.model.Book" %>
<%@ page import="com.java.Dao.BookDao" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: pokoni
  Date: 2022/3/14
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    //获取cookie中保存的用户名
    String uname;
%>
<%
    Cookie [] cookies=request.getCookies();
    for(Cookie cookie:cookies)
    {
        if(cookie.getName().equals("uname")){
            uname=cookie.getValue();
        }
    }
%>
<%

    //连接数据库，读取书本信息
    Connection connection=null;
    DbUtil dbUtil = new DbUtil();
    BookDao bookDao=new BookDao();

    //将post请求方式的编码设置为utf-8
    request.setCharacterEncoding("utf-8");
    String bookid=request.getParameter("bookid");
    String bookname=request.getParameter("bookname");

    //封装表单信息，用于和数据库做对比
    Book book=new Book();
    book.setBookId(bookid);
    book.setBookName(bookname);

    //存放读取数据的链表
    ArrayList<Book> arrayList=new ArrayList<Book>();
    //封装book类用于存放到链表
    Book booktemp;

    try{
        connection=dbUtil.getCon();
        ResultSet resultSet = bookDao.listAll(connection,book);
        while(resultSet.next()){
            //数据封装
            booktemp=new Book();
            booktemp.setBookName(resultSet.getString("bookname"));
            booktemp.setBookId(resultSet.getString("bookid"));
            booktemp.setAuthor(resultSet.getString("author"));
            booktemp.setPress(resultSet.getString("press"));
            booktemp.setLend(resultSet.getInt("lend"));
            //添加到链表
            arrayList.add(booktemp);
        }
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        connection.close();
    }
%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>主页面</title>
            <link rel="stylesheet" href="http://localhost:63342/LibraryIMS/src/main/webapp/static/css/main.css">
            <link rel="stylesheet" href="http://localhost:63342/LibraryIMS/src/main/webapp/static/css/bootstrap.min.css">
            <script src="../static/js/jquery.js" type="text/javascript"></script>
            <%--传递后台返回数据--%>
            <script type="text/javascript">
                var allbookdata=${param.allbookdata};
                $.ajax({
                    type:'GET',
                    url:'http://localhost:8080/LibraryIMS/src/main/java/com/servlet/BookServlet.java',
                    dataType:"JSON",
                    success:function (data){
                        var array=data;
                        var str="";
                        for (var i=0;i<array.lenght;i++){
                            str = "<tr><td>"+array[i].bookid+"</tr><td>"+array[i].bookname+"</tr><td>"+array[i].press+"</tr><td>"+array[i].author+"</tr><td>"+array[i].lend+"</td></tr>";
                            $("#booktable").append(str);
                        }
                    }
                })
            </script>
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
                            <div class="logo"><img src="../static/img/logo.png" alt=""></div>
                            <img src="../static/img/logo_wz.png" alt="" class="school-name">
                        </a>
                        <form class="form-inline">
                            <div class="form-group">
                                <label for="exampleInputName2">书名:</label>
                                <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入书名:" name="bookid">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail2">图书ID:</label>
                                <input type="text" class="form-control" id="exampleInputEmail2" placeholder="请输入图书ID：" name="bookname">
                            </div>
                            <button type="submit" class="btn btn-default">图书查询</button>
                            <button type="submit" class="btn btn-default">图书添加</button>
                            <div class="form-group">
                                <label for="exampleInputEmail2">欢迎您:<%=uname%></label>
                            </div>
                        </form>
                    </div>
                    <!-- 查询表单 -->




                </div>

            </nav>
            <!-- 主页内容 -->
            <div class="container ">
                <!-- 左侧文字 -->
                <div class="jumbotron">
                    <h1>Knowledge, Beyond Image!</h1>
                    <p>知识的力量 超越想象</p>
                    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>

                </div>

                <!-- 右侧表格 -->
                <div class="table-container pre-scrollable ">
                    <table class="table table-striped table-bordered table-hover table-responsive" id="booktable">
                        <!-- On rows -->
                        <tr class="active"><span class="list">图书列表</span></tr>
                        <tr class="success"></tr>
                        <tr class="warning"></tr>
                        <tr class="danger"></tr>
                        <tr class="info"></tr>

                        <!-- On cells (`td` or `th`) -->
                        <tr>
                            <td >图书id</td>
                            <td >图书名</td>
                            <td >出版社</td>
                            <td >作者</td>
                            <td >是否在馆</td>
                            <td >累计借还</td>
                        </tr>
                        <tr>
                            <td>001</td>
                            <td>SpringBoot实战</td>
                            <td>人民邮电出版社</td>
                            <td>Craig Walls</td>
                            <td>是</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>001</td>
                            <td>SpringBoot实战</td>
                            <td>人民邮电出版社</td>
                            <td>Craig Walls</td>
                            <td>是</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>001</td>
                            <td>SpringBoot实战</td>
                            <td>人民邮电出版社</td>
                            <td>Craig Walls</td>
                            <td>是</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>001</td>
                            <td>SpringBoot实战</td>
                            <td>人民邮电出版社</td>
                            <td>Craig Walls</td>
                            <td>是</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>001</td>
                            <td>SpringBoot实战</td>
                            <td>人民邮电出版社</td>
                            <td>Craig Walls</td>
                            <td>是</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>001</td>
                            <td>SpringBoot实战</td>
                            <td>人民邮电出版社</td>
                            <td>Craig Walls</td>
                            <td>是</td>
                            <td>10</td>
                        </tr>


                    </table>
                </div>
            </div>

        </body>

        </html>