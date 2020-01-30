<html>
    <head>
        <meta http-equiv="Conte nt-Type" content="text/html;charset=UTF-8">
        <title>Select Order Page JSP</title>
    </head>
    <body>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.sql.*"%>
        <%
        try{
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_company?user=root&password=root");
            Statement stmt = mycon.createStatement();
            ResultSet myresult = stmt.executeQuery("SELECT order_tbl.oid, order_tbl.pid, product_tbl.pname, order_tbl.qty, product_tbl.unitprice, customer_tbl.cname, order_tbl.eid, employee_tbl.eid, employee_tbl.ename, ROUND((qty*unitprice)*((100-discount)/100),2), order_tbl.discount FROM order_tbl,product_tbl,customer_tbl,employee_tbl WHERE order_tbl.pid = product_tbl.pid AND order_tbl.cid = customer_tbl.cid AND order_tbl.eid = employee_tbl.eid"); //ถ้ามีหลายความสัมพันให้ใส่ AND WHERE
            //ORDER BY customer_tbl.cname ASC --> เรียงลำดับ ASC คือ 1-10 , DESC คือ 10-1
            //
            double dis = 0;
            double q = 0;
            double rom = 0;
            if(myresult != null){
                out.println("<center>Show Table order_tbl,product_tbl,customer_tbl,employee_tbl<br><br>");
                out.println("<table aling=center border=1 cellpadding=5>");
                out.println("<tr><td>รหัสใบสั่งซื้อ</td><td>รหัสสินค้า</td><td>ชื่อสินค้า</td><td>จำนวน</td><td>ราคา/หน่วย</td><td>ส่วนลด%</td><td>ราคารวมหักส่วนลด</td><td>ชื่อลูกค้า</td><td>ชื่อพนักงานขาย</td></tr>");
                while(myresult.next()){
                    out.println("<tr><td>"+myresult.getString("oid")+"</td>"); //รหัสใยสั่งซื้อ
                    out.println("<td>"+myresult.getString("pid")+"</td>"); //รหัสสินค้า
                    out.println("<td>"+myresult.getString("pname")+"</td>"); //ชื่อสินค้า
                    out.println("<td>"+myresult.getString("qty")+"</td>"); //จำนวน
                    out.println("<td>"+myresult.getString("unitprice")+"</td>"); //ราคา/หน่วย
                    dis = Double.parseDouble(myresult.getString("discount"));
                    out.println("<td>"+dis+"</td>"); //ส่วนลด %
                    q = Double.parseDouble(myresult.getString("ROUND((qty*unitprice)*((100-discount)/100),2)"));
                    out.println("<td>"+q+"</td>"); //ราคารวม หักส่วนลดแล้ว
                    out.println("<td>"+myresult.getString("cname")+"</td>"); //ชื่อลูกค้า
                    out.println("<td>"+myresult.getString("ename")+"</td></tr>"); //ชื่อพนักงานขาย
                    if(rom != q){
                        rom = rom+q;
                    }
                }
                out.println("<tr><td></td><td></td><td></td><td></td><td>ยอดสั่งซื้อทั้งหมด</td><td></td><td>"+rom+"</td><td>บาท</td></tr>");
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