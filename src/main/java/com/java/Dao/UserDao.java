package com.java.Dao;

import com.java.Util.StringUtil;
import com.java.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    //注册，也就是添加
    public int add(Connection con, User userMessage) throws Exception {

        //先在数据库中查询主键userId，若查到了，返回0，代表注册失败
        String sqlid = "select * from users where userid = ?";
        PreparedStatement pstmtid = con.prepareStatement(sqlid);
        pstmtid.setString(1,userMessage.getUserId());
        ResultSet rsid = pstmtid.executeQuery();
        if(rsid.next()) {
            return 0;
        }
        //若数据库中没有userId，则可以插入
        String sql = "insert into users values(?,?,?)";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);

        pstmt.setString(1, userMessage.getUserId());
        pstmt.setString(2, userMessage.getUsername());
        pstmt.setString(3, userMessage.getPassword());

        return pstmt.executeUpdate();
    }



    //登录验证
    public User login(Connection con, User userMessage) throws Exception {

        User resultUser = null;
        String sql = "select * from users where userid = ? and password = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1,userMessage.getUserId());
        pstmt.setString(2,userMessage.getPassword());
        ResultSet rs = pstmt.executeQuery();

        if(rs.next()) {
            resultUser = new User();
            resultUser.setUserId(rs.getString("userid"));
            resultUser.setUsername(rs.getString("username"));
            resultUser.setPassword(rs.getString("password"));
        }
        return  resultUser;
    }



    //查询用户
    public  ResultSet userLook(Connection con, User userMessage) throws Exception {

        StringBuffer sb = new StringBuffer("select * from users where userid = userid ");

        //向sb中添加，并进行模糊查询
        //账号模糊查询
        if(StringUtil.isNotEmpty(userMessage.getUserId())) {
            sb.append(" and userid like '%" + userMessage.getUserId() + "%'");
        }

        //用户名模糊查询
        if(StringUtil.isNotEmpty(userMessage.getUsername())) {
            sb.append(" and users.username like '%" + userMessage.getUsername() + "%'");
        }

        PreparedStatement pstmt=(PreparedStatement) con.prepareStatement(sb.toString());

        return pstmt.executeQuery();
    }

    //删除用户
    public int userDelete(Connection con, String id) throws Exception {

        String sql = "delete from users where userid = ?";
        PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
        pstmt.setString(1, id);

        return pstmt.executeUpdate();
    }

}
