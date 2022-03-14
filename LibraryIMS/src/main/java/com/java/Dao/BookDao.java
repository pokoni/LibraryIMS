package com.java.Dao;

import com.java.Util.StringUtil;
import com.java.model.Book;
import com.java.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookDao {
    //添加书籍
    public int add(Connection con, Book book) throws Exception {

        //插入图书前 检查bookId是否已经存在，若存在，返回0
        String sqlid = "select * from books where bookid = ?";
        PreparedStatement pstmtid = (PreparedStatement) con.prepareStatement(sqlid);
        pstmtid.setString(1, book.getBookId());
        ResultSet rs = pstmtid.executeQuery();
        if(rs.next()) {
            return 0;
        }

        String sql = "insert into books values(?,?,?,?,?,?)";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);

        pstmt.setString(1, book.getBookId());
        pstmt.setString(2, book.getBookName());
        pstmt.setString(3, book.getPress());
        pstmt.setString(4, book.getAuthor());
        pstmt.setInt(5, book.getLend());
        pstmt.setInt(6, 0);

        return pstmt.executeUpdate();

    }




    //查询书籍(查询全部)
    public ResultSet list(Connection con, Book bookMessage) throws Exception {

        StringBuffer sb = new StringBuffer("select * from books where bookid = bookid ");

        //向sb中添加，并进行模糊查询
        if(StringUtil.isNotEmpty(bookMessage.getBookId())) {
            sb.append(" and bookid like '%" + bookMessage.getBookId() + "%' order by lendcount");
        }

        //按书名模糊查询
        if(StringUtil.isNotEmpty(bookMessage.getBookName())) {
            sb.append(" and books.bookname like '%" + bookMessage.getBookName() + "%' lendcount");
        }

        //按作者模糊查询
        if(StringUtil.isNotEmpty(bookMessage.getAuthor())) {
            sb.append(" and books.author like '%" + bookMessage.getAuthor() + "%' lendcount");
        }


        PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(sb.toString());

        return pstmt.executeQuery();
    }

    //查询书籍(查询全部按lendcount降序)
    public ResultSet listAll(Connection con, Book bookMessage) throws Exception{
        String sql = "select * from books order by lendcount desc";
        PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(sql);
        return pstmt.executeQuery();
    }


    //删除书籍
    public int delete(Connection con, String id) throws Exception {

        String sql = "delete from books where bookid = ?";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
        pstmt.setString(1, id);

        return pstmt.executeUpdate();
    }



    //更新书籍
    public int update(Connection con, Book bookMessage1) throws Exception {

        String sql = "update books set bookname=?, press=?, author=? where bookid=?";

        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);

        pstmt.setString(1, bookMessage1.getBookName());
        pstmt.setString(2, bookMessage1.getPress());
        pstmt.setString(3, bookMessage1.getAuthor());
        pstmt.setString(4, bookMessage1.getBookId());
        return pstmt.executeUpdate();
    }

    //检查该id的图书是否存在,若存在，返回0，否则返回1
    public ResultSet bookCheck(Connection con, String id) throws Exception{

        //插入图书前 检查bookId是否已经存在，若存在，返回0
        String sqlid = "select * from books where bookid = ?";
        PreparedStatement pstmtid = (PreparedStatement) con.prepareStatement(sqlid);
        pstmtid.setString(1, id);
        ResultSet rs = pstmtid.executeQuery();
        return rs;
    }


    //借书
    public int lend (Connection con, String textid, String bookName, User userMessage) throws Exception {
        //先修改book表中图书的状态
        String sql = "update books set lend=? ,lendcount=lendcount+1 where bookid=?";

        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);

        pstmt.setString(1, "1");
        pstmt.setString(2, textid);
        pstmt.executeUpdate();

        //插入借阅记录表record信息
        String insql = "insert into record (userid,username,bookid,bookname,back)values(?,?,?,?,?)";
        PreparedStatement lendpstmt = (PreparedStatement) con.prepareStatement(insql);

        lendpstmt.setString(1, userMessage.getUserId());
        lendpstmt.setString(2, userMessage.getUsername());
        lendpstmt.setString(3, textid);
        lendpstmt.setString(4, bookName);
        lendpstmt.setString(5, "0");
        lendpstmt.executeUpdate();
        return 0;//成功
    }



    //还书
    public int back (Connection con, String textid, User userMessage) throws Exception {


        //先修改book表中图书的状态
        String sql = "update books set lend=? where bookid=?";

        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);

        pstmt.setString(1, "0");
        pstmt.setString(2, textid);
        pstmt.executeUpdate();

        //修改借阅记录表record信息 ，back=1,表示已经归还
        String insql = "update record set back=? where bookid=? and username=? ";
        PreparedStatement lendpstmt = (PreparedStatement) con.prepareStatement(insql);

        lendpstmt.setString(1, "1");
        lendpstmt.setString(2, textid);
        lendpstmt.setString(3, userMessage.getUsername());
        lendpstmt.executeUpdate();

        return 0;//成功
    }



    //历史记录查询
    public ResultSet listHistory(Connection con, User userMessage) throws Exception {

        String sql = "select recordid,username, bookname, (case back when 0 then '否' when 1 then '是' end) as back from record where username = ?";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
        pstmt.setString(1, userMessage.getUsername());
        return pstmt.executeQuery();
    }

}
