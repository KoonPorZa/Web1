<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>connect mysqldatabase Page</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <%
        try{
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?user=root&password=root");
            Statement stmt = mycon.createStatement();
            ResultSet myresult = stmt.executeQuery("SELECT * FROM member");
            if(myresult != null){
                out.println("<center>Show Table member<br><br>");
                out.println("<table aling=center border=1 cellpadding=5>");
                while(myresult.next()){
                    out.println("<tr><td>"+myresult.getString("id")+"</td>");
                    out.println("<td>"+myresult.getString("name")+"</td></tr>");
                }
                out.println("</table></center><br><br>");
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