<%@page import="com.project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="css/bootstrap.css"></link>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String mobilenumber=request.getParameter("mobilenumber");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update bloodrequest set name=?, mobilenumber=?, email=?, bloodgroup=? where id=?");
	ps.setString(1,name);
	ps.setString(2,mobilenumber);
	ps.setString(3,email);
	ps.setString(4,bloodgroup);
	ps.setString(5,id);
	ps.executeUpdate();
	response.sendRedirect("index.jsp?msg1=valid");
	}
catch(Exception e)
{
	response.sendRedirect("index.jsp?msg1=invalid");
	}
%>