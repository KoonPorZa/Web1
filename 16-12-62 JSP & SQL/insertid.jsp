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
            String sql2 = "INSERT INTO member(id,name) VALUE('"+id+"','"+name+"')";
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?user=root&password=root");
            Statement stmt = mycon.createStatement();
            ResultSet myresult = stmt.executeQuery(sql1);
            if(myresult.next()){
                out.println(id+" Already Have In Table");
            }
            else{
                stmt.executeUpdate(sql2);
                out.println("Add Data To Table 'member' Complete!");
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