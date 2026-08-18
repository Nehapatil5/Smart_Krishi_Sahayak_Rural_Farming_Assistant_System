package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Expert_Login
 */
public class Expert_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Expert_Login() {
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
			Connection con= DbConnection.connect();
			String e_contact = request.getParameter("e_contact");
			String password = request.getParameter("password");
			PreparedStatement pstmt= con.prepareStatement("select * from expert where e_contact=? and password=?");
			pstmt.setString(1, e_contact);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	        	GetterSetter.setE_contact(request.getParameter("e_contact"));

	            response.sendRedirect("Krishi_Expert_Dashboard.html"); 
	        } else {
	        	response.sendRedirect("Expert_Login.html");
	        }
		}catch(Exception e){
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
	}


