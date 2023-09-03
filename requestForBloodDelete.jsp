<%@page import="com.project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<link rel="stylesheet" href="css/bootstrap.css"></link>
<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from bloodrequest where id='"+id+"'");
	response.sendRedirect("requestForBlood.jsp");
}
catch(Exception e)
{
	response.sendRedirect("requestForBlood.jsp");
	}
%>