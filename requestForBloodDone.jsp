<%@page import="com.project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="css/bootstrap.css"></link>
<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update bloodrequest set status='completed' where id=?");
	ps.setString(1, id);
	ps.executeUpdate();
	response.sendRedirect("requestForBlood.jsp");
}
catch(Exception e)
{
	response.sendRedirect("requestForBlood.jsp");
	}
%>