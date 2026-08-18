<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="Smart_Krishi_Sahayak.*" %>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Appointments - Agricultural Portal</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-color: #f5f5f5;
        color: #333;
        line-height: 1.6;
        display: flex;
        min-height: 100vh;
    }
    
    /* Sidebar Styles */
    .sidebar {
        width: 250px;
        background-color: #333;
        color: #fff;
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        padding: 20px 0;
        transition: all 0.3s;
        z-index: 1000;
    }
    
    .sidebar-header {
        padding: 0 20px 20px;
        border-bottom: 1px solid #444;
        margin-bottom: 20px;
    }
    
    .logo {
        font-size: 24px;
        font-weight: bold;
        color: #fff;
    }
    
    .logo span {
        color: #4CAF50;
    }
    
    .sidebar-menu {
        list-style: none;
    }
    
    .sidebar-menu li {
        margin-bottom: 5px;
    }
    
    .sidebar-menu a {
        display: flex;
        align-items: center;
        padding: 12px 20px;
        color: #ccc;
        text-decoration: none;
        transition: all 0.3s;
    }
    
    .sidebar-menu a:hover {
        background-color: #444;
        color: #fff;
    }
    
    .sidebar-menu a.active {
        background-color: #4CAF50;
        color: #fff;
    }
    
    .menu-icon {
        margin-right: 10px;
        font-size: 18px;
        width: 20px;
        text-align: center;
    }
    
    /* Main Content Styles */
    .main-content {
        flex: 1;
        margin-left: 250px;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    
    /* Navbar Styles */
    .navbar {
        background-color: #fff;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: sticky;
        top: 0;
        z-index: 100;
    }
    
    .navbar-left h1 {
        font-size: 24px;
        color: #333;
    }
    
    .navbar-right {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    
    .user-info {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    
    .user-info span {
        font-weight: 500;
        color: #333;
    }
    
    .user-avatar {
        width: 40px;
        height: 40px;
        background-color: #4CAF50;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: bold;
    }
    
    .logout-btn {
        background-color: #333;
        color: #fff;
        border: none;
        padding: 8px 15px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    
    .logout-btn:hover {
        background-color: #d32f2f;
    }
    
    /* Content Area */
    .content {
        flex: 1;
        padding: 30px;
    }
    
    .page-header {
        text-align: center;
        margin-bottom: 30px;
    }
    
    .page-header h2 {
        font-size: 28px;
        color: #333;
        margin-bottom: 10px;
    }
    
    .page-header p {
        color: #666;
        font-size: 16px;
    }
    
    /* Table Styles */
    .table-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        overflow-x: auto;
    }
    
    .data-table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
    }
    
    .data-table th {
        background-color: #333;
        color: #fff;
        padding: 12px 15px;
        text-align: left;
        font-weight: 600;
        border: 1px solid #444;
    }
    
    .data-table td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        color: #333;
    }
    
    .data-table tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    .data-table tr:hover {
        background-color: #f1f1f1;
    }
    
    .no-data {
        text-align: center;
        padding: 20px;
        color: #666;
        font-style: italic;
    }
    
    .back-link {
        margin-top: 20px;
        text-align: center;
    }
    
    .back-link a {
        color: #666;
        text-decoration: none;
        transition: color 0.3s;
        display: inline-flex;
        align-items: center;
        padding: 8px 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    
    .back-link a:hover {
        color: #4CAF50;
        border-color: #4CAF50;
    }
    
    .back-link a::before {
        content: "←";
        margin-right: 5px;
    }
    
    /* Footer */
    footer {
        background-color: #333;
        color: #fff;
        padding: 20px 30px;
        margin-top: auto;
    }
    
    .footer-content {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    
    .footer-section {
        flex: 1;
        min-width: 250px;
        margin-bottom: 15px;
    }
    
    .footer-section h3 {
        font-size: 16px;
        margin-bottom: 10px;
        color: #fff;
    }
    
    .footer-section p, .footer-section a {
        color: #ccc;
        margin-bottom: 5px;
        display: block;
        text-decoration: none;
        font-size: 14px;
    }
    
    .footer-section a:hover {
        color: #4CAF50;
    }
    
    .copyright {
        text-align: center;
        padding-top: 15px;
        margin-top: 15px;
        border-top: 1px solid #444;
        color: #999;
        font-size: 12px;
    }
    
    /* Mobile Responsive */
    @media (max-width: 768px) {
        .sidebar {
            width: 70px;
            overflow: hidden;
        }
        
        .sidebar-header .logo span,
        .sidebar-menu li a span:not(.menu-icon) {
            display: none;
        }
        
        .sidebar-menu li a {
            justify-content: center;
            padding: 15px;
        }
        
        .menu-icon {
            margin-right: 0;
            font-size: 20px;
        }
        
        .main-content {
            margin-left: 70px;
        }
        
        .navbar {
            padding: 15px 20px;
        }
        
        .navbar-left h1 {
            font-size: 20px;
        }
        
        .user-info span {
            display: none;
        }
        
        .table-container {
            padding: 15px 10px;
        }
        
        .data-table {
            font-size: 14px;
        }
        
        .data-table th,
        .data-table td {
            padding: 8px 10px;
        }
        
        .footer-content {
            flex-direction: column;
        }
    }
    
    @media (max-width: 480px) {
        .sidebar {
            width: 0;
        }
        
        .main-content {
            margin-left: 0;
        }
        
        .content {
            padding: 20px 15px;
        }
    }
</style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="logo">Agri<span>Portal</span></div>
        </div>
        <ul class="sidebar-menu">
            <li><a href="Expert_Dashboard.html">
                
                <span>Dashboard</span>
            </a></li>
            <li><a href="View_Appointments.jsp" class="active">
               
                <span>View_Appointments</span>
            </a></li>
            <li><a href="Report.jsp">
                
                <span>report</span>
            </a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Navbar -->
        <nav class="navbar">
            <div class="navbar-left">
                <h1>View Appointments</h1>
            </div>
            <div class="navbar-right">
                <div class="user-info">
                    <div class="user-avatar">E</div>
                    <span>Krishi Expert</span>
                </div>
               <button class="logout-btn">
                   
                     <a class="dropdown-item" href="index.html">Log out</a>
                    <span>Logout</span>
                </button>
            </div>
        </nav>

        <!-- Content Area -->
        <div class="content">
            <div class="page-header">
                <h2>Appointments</h2>
                <p>View all scheduled appointments with farmers</p>
            </div>
            
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Appointment Id</th>
                            <th>Farmer Contact</th>
                            <th>Expert Contact</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        try { 
                            Connection con = DbConnection.connect();
                            PreparedStatement pstmt = con.prepareStatement("select * from appointments");
                            ResultSet rs = pstmt.executeQuery();
                            boolean hasData = false;
                            
                            while(rs.next()) {
                                hasData = true;
                        %>
                        <tr>
                            <td><%=rs.getInt("appointmentId")%></td>
                            <td><%=rs.getString("f_contact")%></td>
                            <td><%=rs.getString("e_contact")%></td>
                            <td><%=rs.getString("date")%></td>
                            <td><%=rs.getString("time")%></td>
                            <td><%=rs.getString("status")%></td>
                        </tr>
                        <%
                            }
                            
                            if (!hasData) {
                        %>
                        <tr>
                            <td colspan="6" class="no-data">No appointments found</td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                        %>
                        <tr>
                            <td colspan="6" class="no-data">Error: <%= e.getMessage() %></td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
            
            <div class="back-link">
                <a href="Expert_Dashboard.html">Back to Dashboard</a>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="footer-content">
                    <div class="footer-section">
                        <h3>About Us</h3>
                        <p>Agricultural Portal is a comprehensive platform connecting farmers, experts, and administrators.</p>
                    </div>
                    
                    <div class="footer-section">
                        <h3>Quick Links</h3>
                        <a href="index.html">Home</a>
                        <a href="#">Services</a>
                        <a href="#">Resources</a>
                        <a href="#">Contact</a>
                    </div>
                    
                    <div class="footer-section">
                        <h3>Contact Info</h3>
                        <p>Email: info@agriportal.com</p>
                        <p>Phone: +1 234 567 8900</p>
                    </div>
                </div>
                
                <div class="copyright">
                    <p>&copy; 2023 Agricultural Portal. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>