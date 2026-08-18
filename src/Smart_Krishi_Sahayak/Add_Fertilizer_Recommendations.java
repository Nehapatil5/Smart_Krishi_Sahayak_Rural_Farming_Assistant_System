package Smart_Krishi_Sahayak;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_Fertilizer_Recommendations
 */
public class Add_Fertilizer_Recommendations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Fertilizer_Recommendations() {
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
		
		try{
			Connection con = DbConnection.connect();
			int fr_Id=0;
			String crop_name = request.getParameter("crop_name");
			String soiltype = request.getParameter("soiltype");
			String season = request.getParameter("season");
			String fertilizertype = request.getParameter("fertilizertype");
			String quntity = request.getParameter("quntity");
			String recommendationNotes = request.getParameter("recommendationNotes");
			PreparedStatement pstmt = con.prepareStatement("insert into fertilizer_recommendations values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, fr_Id);
			pstmt.setString(2, crop_name);
			pstmt.setString(3, soiltype);
			pstmt.setString(4, season);
			pstmt.setString(5, fertilizertype);
			pstmt.setString(6, quntity);
			pstmt.setString(7, recommendationNotes);
			int i = pstmt.executeUpdate();
			if(i>0){
				response.sendRedirect("Admin_Dashboard.html");
			}
			else{
				response.sendRedirect("Add_Fertilizer_Recommendations.html");
			}
		
		
		}catch(Exception e){
			 e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
	     
		}

}
}
