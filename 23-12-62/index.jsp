<html>
    <head>
        <meta http-equiv="Conte nt-Type" content="text/html;charset=UTF-8">
        <title>connect mysqldatabase Page</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <%
        try{
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/elec_company?user=root&password=root");
            Statement stmt = mycon.createStatement();
            ResultSet myresult = stmt.executeQuery("SELECT * FROM employee_tbl");
            if(myresult != null){
                out.println("<center>Show Table employee_tbl<br><br>");
                out.println("<table aling=center border=1 cellpadding=5>");
                while(myresult.next()){
                    out.println("<tr><td>"+myresult.getString("eid")+"</td>");
                    out.println("<td>"+myresult.getString("ename")+"</td>");
                    out.println("<td>"+myresult.getString("salary")+"</td></tr>");
                }
                out.println("</table></center><br><br>");
            }
            ResultSet myresult1 = stmt.executeQuery("SELECT * FROM customer_tbl");
            if(myresult1 != null){
                out.println("<center>Show Table customer_tbl<br><br>");
                out.println("<table aling=center border=1 cellpadding=5>");
                while(myresult1.next()){
                    out.println("<tr><td>"+myresult1.getString("cid")+"</td>");
                    out.println("<td>"+myresult1.getString("cname")+"</td>");
                    out.println("<td>"+myresult1.getString("address")+"</td></tr>");
                }
                out.println("</table></center>");
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