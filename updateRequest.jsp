<%@page import="com.project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
 <link rel="stylesheet" href="css/bootstrap.css"></link>
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
body {
  background-image: url('Bank1.jpg;');
}
</style>
</head>
<body>
 	<%
 	String id=request.getParameter("id");
 	
 	try
 	{
 		Connection con=ConnectionProvider.getCon();
 		Statement st=con.createStatement();
 		ResultSet rs=st.executeQuery("select * from bloodrequest where id='"+id+"'");
 		while(rs.next())
 		{
 	%>
 	
 	<div class="container">
		<form action="updateRequestAction.jsp" method="post">
			<input type="hidden" name="id" value="<%out.println(id);%>">
			<h2><b>Name</b></h2>
			<input type="text" value="<%=rs.getString(2)%>" name="name">
			<br>
			<br>
			<h2><b>Mobile Number</b></h2>
			<input type="number" value="<%=rs.getString(3)%>" name="mobilenumber">
			<br>
			<br>
			<h2><b>Email</b></h2>
			<input type="email" value="<%=rs.getString(4)%>" name="email">
			<br>
			<br>
			<h2><b>Blood Group</b></h2>
			<input type="text" value="<%=rs.getString(5)%>" name="bloodgroup">
			<br>
			<br>
			<center><button type="submit" class="button">Save</button></center>
		</form>
	</div>
 	
 	<%
	}
	}
	catch(Exception e)
	{	
	System.out.println(e);
	}
%>
</body>
</html>