package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Farmer_Register
 */
public class Farmer_Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Farmer_Register() {
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
			String f_contact=request.getParameter("contact");
			String f_name=request.getParameter("name");
			String address=request.getParameter("address");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			PreparedStatement pstmt=con.prepareStatement("insert into farmer values(?,?,?,?,?)");
			pstmt.setString(1, f_contact);
			pstmt.setString(2, f_name);
			pstmt.setString(3, address);
			pstmt.setString(4, email);
			pstmt.setString(5, password);
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("Farmer_Login.html");
			}
			else{
				response.sendRedirect("Farmer_Register.html");
		}
		}catch(Exception e){
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}

}
