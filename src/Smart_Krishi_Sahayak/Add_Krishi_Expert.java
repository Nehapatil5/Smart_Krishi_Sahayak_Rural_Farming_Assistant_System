package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_Krishi_Expert
 */
public class Add_Krishi_Expert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Krishi_Expert() {
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
			String e_contact=request.getParameter("contact");
			String e_name=request.getParameter("name");
			String specialization=request.getParameter("specialization");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			
			PreparedStatement psmt = con.prepareStatement("insert into expert values(?,?,?,?,?)");
			psmt.setString(1, e_contact);
			psmt.setString(2, e_name);
			psmt.setString(3,specialization);
			psmt.setString(4, email);
			psmt.setString(5, password);
			int i = psmt.executeUpdate();
			while(i>0){
				GetterSetter.setE_contact(request.getParameter("contact"));
 
				response.sendRedirect("Admin_Dashboard.html");
			}
		}
		catch(Exception e){
			 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     
		}
	}

}
