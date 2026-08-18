<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="Smart_Krishi_Sahayak.*" %>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<center>
<table>
<tr>
<th>Appointment Id</th>
<th>Farmer Contact</th>
<th>Expert Contact</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
<th>Add Guidance</th>
</tr>
</head>
<body>
<%
 try{ 
	 Connection con = DbConnection.connect();
	 PreparedStatement pstmt =con.prepareStatement("select * from appointments");
	 ResultSet rs=pstmt.executeQuery();
	 while(rs.next()){%>
	    <tr>
		 <td><%=rs.getInt("appointmentId")%></td>
		 <td><%=rs.getString("f_contact")%></td>
		 <td><%=rs.getString("e_contact")%></td>
		 <td><%=rs.getString("date")%></td>
		 <td><%=rs.getString("time")%></td>
		 <td><%=rs.getString("status")%></td>
		 <td><a href="Write_Report.html?appointmentId=<%=rs.getString("appointmentId")%>">Write Report</a>
		 </tr>
         <%}} catch (Exception e) {
         out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
         }%>
</table>
</center>

</body>
</html>
