package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Book_Appointment_With_Expert
 */
public class Book_Appointment_With_Expert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book_Appointment_With_Expert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try{
			 

			Connection con = DbConnection.connect();
			int appointmentId=0;
			String f_contact = GetterSetter.getF_contact(); 
			String e_contact = GetterSetter.getE_contact(); 
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			PreparedStatement pstmt = con.prepareStatement("insert into appointments values(?,?,?,?,?,?)");
			pstmt.setInt(1, appointmentId);
			pstmt.setString(2, f_contact);
			pstmt.setString(3, e_contact);
			pstmt.setString(4, date);
			pstmt.setString(5, time);
			pstmt.setString(6, "Not Confirm");
			int i = pstmt.executeUpdate();
			while(i > 0){
				GetterSetter.setAppointmentId(appointmentId);
				response.sendRedirect("Farmer_Dashboard.html");
			}
		}catch(Exception e){
			 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     
		}
		}
		
	}


