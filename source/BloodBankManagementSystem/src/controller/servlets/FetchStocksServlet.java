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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


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
		
		CallableStatement cs2=null;
		ResultSet rs2=null;
		
		
		JSONArray arr=new JSONArray();
		
			
		try {
			
			cs=con.prepareCall("{call sp_FetchBloodBankStocks(?,?,?)}");
			cs.setString(1, request.getParameter("city"));
			cs.setInt(2, Integer.parseInt(request.getParameter("blood_group")));
			cs.setInt(3, Integer.parseInt(request.getParameter("blood_bag_type")));
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				JSONObject obj = new JSONObject();
				
				obj.put("seller_name", rs.getString(2));
				obj.put("blood_group", rs.getString(3));
				obj.put("blood_bag_type", rs.getString(4));
				obj.put("quantity", rs.getString(5));
				obj.put("price", rs.getString(6));
				obj.put("stock_id", rs.getString(1));
				
				
				arr.add(obj);
								
			}
			
			
			cs2=con.prepareCall("{call sp_FetchHospitalStocks(?,?,?)}");
			cs2.setString(1, request.getParameter("city"));
			cs2.setInt(2, Integer.parseInt(request.getParameter("blood_group")));
			cs2.setInt(3, Integer.parseInt(request.getParameter("blood_bag_type")));
			rs2=cs2.executeQuery();
			
			while(rs2.next())
			{
				System.out.println("fetching hospital stocks");
				JSONObject obj = new JSONObject();
				
				obj.put("seller_name", rs2.getString(2));
				obj.put("blood_group", rs2.getString(3));
				obj.put("blood_bag_type", rs2.getString(4));
				obj.put("quantity", rs2.getString(5));
				obj.put("price", rs2.getString(6));
				obj.put("stock_id", rs2.getString(1));
				
				
				arr.add(obj);
								
			}
			
			System.out.println(arr.toJSONString());
			response.setContentType("text/plain");
			response.getWriter().write(arr.toJSONString());
								
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				cs.close();
				rs2.close();
				cs2.close();
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
