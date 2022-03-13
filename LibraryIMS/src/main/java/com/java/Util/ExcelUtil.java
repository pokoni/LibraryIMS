package com.java.Util;

import com.java.Dao.BookDao;
import com.java.model.Book;
//import com.sun.media.sound.InvalidFormatException;
import net.sf.jxls.exception.ParsePropertyException;
//import net.sf.jxls.transformer.Workbook;
import net.sf.jxls.transformer.XLSTransformer;
//import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;


import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelUtil {
    //ArrayList<Book> arrayList=new ArrayList<Book>();
    public Workbook createExcel(String templateFileName, List<?> list) throws IOException {
        //创建XLSTransformer对象
        XLSTransformer transformer = new XLSTransformer();
        Map<String, Object> beanParams = new HashMap<String, Object>();
        beanParams.put("list", list);
        Workbook sheets = null;
        try {
            FileInputStream fileInputStream = new FileInputStream(templateFileName);
            //生成Excel文件
            sheets = (Workbook) transformer.transformXLS(fileInputStream, beanParams);
            //ClassPathResource classPathResource = new ClassPathResource(templateFileName);
            //InputStream is = classPathResource.getInputStream();
            //生成Excel文件
            //sheets = transformer.transformXLS(is, beanParams);
        } catch (ParsePropertyException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (org.apache.poi.openxml4j.exceptions.InvalidFormatException e) {
            e.printStackTrace();
        }
        return sheets;


    }

    public static void main(String[] args) throws IOException {
        ArrayList<Book> arrayList=new ArrayList<Book>();
        Connection connection=null;
        DbUtil dbHelper=new DbUtil();
        BookDao bookfunction=new BookDao();
        Book bookMessage=new Book();
        //Book book = new Book();
        try {
            connection=dbHelper.getCon();
            ResultSet current=bookfunction.listAll(connection, bookMessage);
            while(current.next()) {
                Book book = new Book();
                book.setBookId(current.getString("bookid"));
                book.setBookName(current.getString("bookname"));
                book.setPress(current.getString("press"));
                book.setAuthor(current.getString("author"));
                book.setLend(current.getInt("lend"));
                //arrayList.add(current.getString("bookid"));
                //arrayList.add(current.getString("bookname"));
                //arrayList.add(current.getString("press"));
                //arrayList.add(current.getString("author"));
                arrayList.add(book);
                //if(current.getString("lend").equals("0")){
                //arrayList.add("yes");
                //}else {
                //	arrayList.add("no");
                //}
                //arrayList.add(current.getString("lendcount"));
            }
        }catch (Exception evt) {
            // TODO: handle exception
            evt.printStackTrace();
        }
        //arrayList= String.getList();// 你的数据
        String templateFileName ="D:\\JavaWorkspace\\Library Information Management System\\post\\test.xls";
        Workbook excel = new ExcelUtil().createExcel(templateFileName,arrayList);// 生成的excel
        FileOutputStream fileOutputStream = new FileOutputStream("D:\\JavaWorkspace\\Library Information Management System\\post\\message.xls");
        //OutputStream out = response.getOutputStream();
        excel.write(fileOutputStream);
        fileOutputStream.close();
    }

    //List<JhcPtRankChangeInfoDTO> list = jhcPtRankChangeInfoFacade.getList();// 你的数据
}
