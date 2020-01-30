<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Create mysqldatabase Page</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <% //การสร้าง Table ชื่อ member ในฐานข้อมูลชื่อ db1
        try{
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?user=root&password=root");
            Statement stmt = mycon.createStatement();
            stmt.executeUpdate("DROP TABLE member");
            stmt.executeUpdate("CREATE TABLE member (id INT Auto_Increment Primary key,name Varchar(40))");
            stmt.close();
            mycon.close();
            out.print("Created Table 'member' !!");
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