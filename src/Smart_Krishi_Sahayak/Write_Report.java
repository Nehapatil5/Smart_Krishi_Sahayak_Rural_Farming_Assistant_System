package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Write_Report
 */
public class Write_Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Write_Report() {
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
			int r_Id = 0;
			int appointmentId=GetterSetter.getAppointmentId(); ;
			String e_contact = GetterSetter.getE_contact(); 
			String notesText = request.getParameter("notesText");
			String date = request.getParameter("date");
			PreparedStatement pstmt = con.prepareStatement("insert into reports values(?,?,?,?,?)");
			pstmt.setInt(1, r_Id);
			pstmt.setInt(2, appointmentId);
			pstmt.setString(3, e_contact);
			pstmt.setString(4, notesText);
			pstmt.setString(5, date);
			int i = pstmt.executeUpdate();
			while(i > 0){
				response.sendRedirect("Report.jsp");
			}
		}catch(Exception e){
			 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     
		}
		}
		

	}


