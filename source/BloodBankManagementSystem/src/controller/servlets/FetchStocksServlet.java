package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/fetchstocks")
public class FetchStocksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;

	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("fetching Stocks");
		CallableStatement cs=null;
		ResultSet rs=null;
		
		JSONObject obj = new JSONObject();
		
		String str="[";
		
		
		try {
			
			cs=con.prepareCall("{call sp_FetchBloodBankStocks(?,?,?)}");
			cs.setString(1, request.getParameter("city"));
			cs.setInt(2, Integer.parseInt(request.getParameter("blood_group")));
			cs.setInt(3, Integer.parseInt(request.getParameter("blood_bag_type")));
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				str+='{';
						str+="seller_name:"+rs.getString(2)+",";
						str+="blood_group:"+rs.getString(3)+",";
						str+="blood_bag_type:"+rs.getString(4)+",";
						str+="quantity:"+rs.getString(5)+",";
						str+="price:"+rs.getString(6)+",";
						str+="stock_id:"+rs.getString(1);
				str+="},";
			}
			
			if (str.length() > 1 && str.charAt(str.length() - 1) == ',') {
		        str = str.substring(0, str.length() - 1);
		    }
			
			str+="]";
			System.out.println(str);
			response.setContentType("text/plain");
			response.getWriter().write(str);
								
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				cs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
