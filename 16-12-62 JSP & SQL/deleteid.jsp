<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Delete JSP</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <%
        try{
            String id = request.getParameter("id");
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?user=root&password=root");
            Statement stmt = mycon.createStatement();
            ResultSet myresult = stmt.executeQuery("SELECT * FROM member WHERE id="+id);
            //จัดการกับผลลัพธ์ที่ได้จากคำสั่ง SQL
            if(myresult.next()){
                stmt.executeUpdate("DELETE FROM member WHERE id="+id);
                out.println("Delete ID -> "+id+" Complete!");
            }
            else{
                out.println("Don't Have "+id+" In Table Name 'member'");
            }
            stmt.close();
            mycon.close();
        }
        catch(ClassNotFoundException e){
            out.println("Driver Mysql Not Found...");
        }
        catch(SQLException e){
            out.println("Can't Connect Database...");
        }
        %>
    </body>
</html>