package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_Govt_Scheme
 */
public class Add_Govt_Scheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Govt_Scheme() {
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
			int s_Id=0;
			String title=request.getParameter("title");
			String description=request.getParameter("description");
			String region= request.getParameter("region");
			PreparedStatement pstmt= con.prepareStatement("insert into schemes values(?,?,?,?)");
			pstmt.setInt(1, s_Id);
			pstmt.setString(2, title);
			pstmt.setString(3, description);
			pstmt.setString(4, region);
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("Admin_Dashboard.html");
			}
			else{
				response.sendRedirect("Add_Govt_Scheme.html");
			}
		}catch(Exception e){
			 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     
		}
	}

}
