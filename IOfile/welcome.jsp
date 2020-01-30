<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.utli.*"%>
<html>
<head>
<title> welcome.jsp </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
String n="",s="";
int a,g;
String c="";


n=request.getParameter("nam");
s=request.getParameter("sex");
a=Integer.parseInt(request.getParameter("age"));
g=Integer.parseInt(request.getParameter("grade"));

if(g>79)
{c="A";}
out.print("คุณได้เกรด:"+c+"<br>");
out.print("คุณชื่อ:"+n+"<br>");
out.print("อายุคุณ:"+a+" ปี<br>");
out.print("คุณเพศ:"+s+"<p><br>");
%>
</body>
</html>
