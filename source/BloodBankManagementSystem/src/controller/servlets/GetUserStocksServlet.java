package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.beans.StockDetails;
import model.beans.Users;


@WebServlet("/mystocks")
public class GetUserStocksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getSession(false).getAttribute("curr_user")==null)
		{
			System.out.println("inside if");
			response.sendRedirect("home");
			
		}
		else
		{
		
			
			CallableStatement cs=null;
			ResultSet rs=null;
			
			String user_email=((Users)request.getSession().getAttribute("curr_user")).getUser_email();
			
			List<StockDetails> owner_stock_list= new ArrayList<>();
			
		
				
			try {
				
				cs=con.prepareCall("{call sp_FetchStocksUsingEmail(?)}");
				cs.setString(1, user_email);
				
				rs=cs.executeQuery();
				
				while(rs.next())
				{
					String blood_group = rs.getString(2);
					String blood_bag_type = rs.getString(3);
					int price = rs.getInt(5);
					int quantity = rs.getInt(4);
					int stock_id=rs.getInt(1);
					StockDetails s=new StockDetails(blood_group, blood_bag_type, price, quantity, stock_id);
					
					owner_stock_list.add(s);
									
				}
				
				request.getSession().setAttribute("owner_stock_list", owner_stock_list);
				request.getRequestDispatcher("UpdateStocks.jsp").forward(request, response);
									
				
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
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
