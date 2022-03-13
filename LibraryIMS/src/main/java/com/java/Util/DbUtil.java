package com.java.Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
    public static final String url = "jdbc:mysql://localhost:3306/library?serverTimezone=UTC";
    public static final String name = "com.mysql.cj.jdbc.Driver";
    public static final String user = "root";
    public static final String password = "20001018qwerty";

    //public Connection conn = null;
    //public PreparedStatement pst = null;

    //连接数据库
    public Connection getCon() throws Exception {
        Class.forName(name);
        Connection con = (Connection) DriverManager.getConnection(url, user, password);
        return con;
    }

    //关闭数据库
    public void closeCon(Connection con) throws Exception {

        if(con != null) {
            con.close();
        }
    }
}
