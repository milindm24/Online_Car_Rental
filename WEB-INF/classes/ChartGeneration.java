import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.SQLException;
import java.util.*;


public class ChartGeneration extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		response.setContentType("text/html");  
		int index=0;
        //String type=request.getParameter("type");
		
		
		
		PrintWriter out = response.getWriter();
		//utility.printHtml("../webapps/csj/startbootstrap-shop-item-gh-pages/LeftNavigationBar.html",response);
		HttpSession session = request.getSession();
		String usertype = (String)session.getAttribute("usertype");
		String sessionId =new String("sessionId");
		String userInfo = new String("Info");
		MySqlDataStoreUtilities msdsu = new MySqlDataStoreUtilities();

		ArrayList<String> list = new ArrayList<String>();
		list = msdsu.graphGenration();




		request.setAttribute("graph",list);

			RequestDispatcher rd=request.getRequestDispatcher("/test2.jsp");
			rd.forward(request,response);
	}
}