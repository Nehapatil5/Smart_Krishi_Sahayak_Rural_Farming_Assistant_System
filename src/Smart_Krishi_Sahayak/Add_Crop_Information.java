package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_Crop_Information
 */
public class Add_Crop_Information extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Crop_Information() {
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
			int c_Id=0;
			String soiltype = request.getParameter("soiltype");
			String season = request.getParameter("season");
			String recommendedCrops = request.getParameter("recommendedCrops");
			PreparedStatement pstmt = con.prepareStatement("insert into crops values(?,?,?,?)");
			pstmt.setInt(1, c_Id);
			pstmt.setString(2, soiltype);
			pstmt.setString(3, season);
			pstmt.setString(4, recommendedCrops);
			int i = pstmt.executeUpdate();
			while(i > 0){
				response.sendRedirect("Admin_Dashboard.html");
			}
		}catch(Exception e){
			 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     
		}
		}
	}


