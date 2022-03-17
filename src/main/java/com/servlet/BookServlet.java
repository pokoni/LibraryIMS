package com.servlet;

import com.google.gson.Gson;
import com.java.Dao.BookDao;
import com.java.Util.DbUtil;
import com.java.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
    public BookServlet() {
        super();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //连接数据库，读取书本信息
        Connection connection=null;
        DbUtil dbUtil = new DbUtil();
        BookDao bookDao=new BookDao();


        //封装表单信息，用于和数据库做对比
        Book book=new Book();
        //存放读取数据的链表
        ArrayList<Book> arrayList=new ArrayList<Book>();
        //封装book类用于存放到链表
        Book booktemp;

        try{
            connection=dbUtil.getCon();
            ResultSet resultSet=bookDao.listAll(connection,book);
            while (resultSet.next()){
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

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        //将链表打包jason
        Gson gson=new Gson();
        String info=gson.toJson(arrayList);
        System.out.println(info);

        out.write(info);

    }



}
