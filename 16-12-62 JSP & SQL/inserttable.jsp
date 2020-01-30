<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Insert mysqldatabase Page</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <%
        try{
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?user=root&password=root");
            Statement stmt = mycon.createStatement();
            //เพิ่มข้อมูลเข้าไปใน table
            //stmt.executeUpdate("INSERT INTO member(id,name) VALUE('101','Por')"); //ป้อนข้อมูล
            stmt.executeUpdate("INSERT INTO member(id,name) VALUE('102','Tee')");
            stmt.close();
            mycon.close();
            out.print("Insert Data To Table 'member' Complete!");
        }
        catch(ClassNotFoundException e){
            out.print("Driver Mysql Not Found...");
        }
        catch(SQLException e){
            out.print("Can't Connect Database...");
        }
        %>
    </body>
</html>