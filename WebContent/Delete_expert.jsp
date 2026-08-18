<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="Smart_Krishi_Sahayak.*" %>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Connection con = null;
int i = 0;
try {
    con = DbConnection.connect();
    String e_contact = request.getParameter("e_contact");
    PreparedStatement pstmt = con.prepareStatement("DELETE FROM expert WHERE e_contact=?");
    pstmt.setString(1, e_contact);
    i = pstmt.executeUpdate();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>