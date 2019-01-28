package controller.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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


@WebServlet("/confirmorder")
public class ConfirmOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		CallableStatement cs1=null;
		CallableStatement cs2=null;
		CallableStatement cs3=null;
		ResultSet rs2=null;
		int order_id=-1;
		int total_amount=0;
		
		
		try {
			
			String u_email=(String)((Users)request.getSession().getAttribute("curr_user")).getUser_email();
			
			cs1=con.prepareCall("{call sp_AddOrderInfo(?)}");
			cs1.setString(1, u_email);
			int n=cs1.executeUpdate();
			
			
			cs2=con.prepareCall("{call sp_FetchOrderId()}");
			rs2=cs2.executeQuery();
			
			Timestamp order_date=null;
			
			while(rs2.next())
			{
				order_id=rs2.getInt(1);
				order_date=rs2.getTimestamp(2);
						
			}
						
			List<Integer> stock_id_list=(ArrayList<Integer>) request.getSession().getAttribute("stock_id_list");
			
			List<Integer> quantity_list=new ArrayList<>();
			
			List<StockDetails> stocks_list=(ArrayList<StockDetails>) request.getSession().getAttribute("stocks_list");
			
			String []arr=request.getParameterValues("quantity");
			String order_type=request.getParameter("delivery_type");
			
			
			for(String num: arr)
			{
				quantity_list.add(Integer.parseInt(num));
			}
			
			for(int i=0;i<stock_id_list.size();i++)
			{
				if(order_type.equals("PICKUP"))
				{
					if(quantity_list.get(i)==0)		//Not adding orders having quantity 0
					{
						continue;
					}
					else
					{
						cs3=con.prepareCall("{call sp_AddOrders(?,?,?,?,?,?,?,?)}");
						cs3.setInt(1, order_id);
						cs3.setString(2, u_email);
						cs3.setInt(3, stock_id_list.get(i));
						cs3.setInt(4, quantity_list.get(i));
						cs3.setTimestamp(5, order_date);
						int total_price = quantity_list.get(i)*(stocks_list.get(i).getPrice());
						total_amount+=total_price;
						cs3.setInt(6, total_price);
						cs3.setString(7, "PICKUP");
						cs3.setInt(8, -1);
						int num=cs3.executeUpdate();
					}
					
				}
				else 
				{
					if(quantity_list.get(i)==0)		//Not adding orders having quantity 0
					{
						continue;
					}
					else
					{
						cs3=con.prepareCall("{call sp_AddOrders(?,?,?,?,?,?,?,?)}");
						cs3.setInt(1, order_id);
						cs3.setString(2, u_email);
						cs3.setInt(3, stock_id_list.get(i));
						cs3.setInt(4, quantity_list.get(i));
						cs3.setTimestamp(5, order_date);
						int total_price = quantity_list.get(i)*(stocks_list.get(i).getPrice());
						total_amount+=total_price;
						cs3.setInt(6, total_price);
						cs3.setString(7, "DELIVERY");
						cs3.setInt(8, Integer.parseInt(request.getParameter("address")));
						int num=cs3.executeUpdate();
					}
					
					
				}
				
			}
			
			
			request.getSession().setAttribute("total_amount", total_amount);
			request.getRequestDispatcher("/OrderConfirmation.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			try {
				rs2.close();
				cs1.close();
				cs2.close();
				cs3.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//request.getRequestDispatcher("/OrderConfirmation.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
