<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Insert JSP</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <% request.setCharacterEncoding("UTF-8");%>
        <%
        try{
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String sql1 = "SELECT * FROM member WHERE id="+id;
            String sql2 = "UPDATE member SET NAME='"+name+"' WHERE id="+id;
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?user=root&password=root");
            Statement stmt = mycon.createStatement();
            ResultSet myresult = stmt.executeQuery(sql1);
            if(myresult.next()){
                stmt.executeUpdate(sql2);
                out.println("Edit Data In Table 'member' Complete!");
            }
            else{
                out.println("Don't Have ID "+id+" In Table 'member'");
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