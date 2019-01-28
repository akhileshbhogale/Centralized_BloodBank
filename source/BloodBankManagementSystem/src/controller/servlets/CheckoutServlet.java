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
import javax.servlet.http.HttpSession;

import model.beans.Addresses;
import model.beans.StockDetails;
import model.beans.Users;


@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("stock_id_list")==null)
		{
			response.sendRedirect("ViewStocks.jsp");
		}
		CallableStatement cs=null;
		ResultSet rs=null;
		List<Integer> stock_id_list = (List<Integer>) request.getSession().getAttribute("stock_id_list");
		List<StockDetails> stocks_list = new ArrayList<>();
		
		for(int stock_id: stock_id_list)
		{
			try {
				
				
				cs=con.prepareCall("{call sp_FetchStockDetailsUsingStockId(?)}");
				cs.setInt(1, stock_id);
				rs=cs.executeQuery();
				
				while(rs.next())
				{
					StockDetails stock=new StockDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
					
					System.out.println(stock);
					stocks_list.add(stock);
				}			
				
				
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
		
		request.getSession().setAttribute("stocks_list",stocks_list);
		
		
		
		
		
		
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			if(session.getAttribute("type_id")!=null && session.getAttribute("curr_user")!=null)
			{
				int type_id=(Integer)session.getAttribute("type_id");
				String user_email= ((Users)session.getAttribute("curr_user")).getUser_email();
				if(type_id<1 && type_id>3)
				{
					response.sendRedirect("RegistrationPage.jsp");
				}
				else
				{
					List<Addresses> address_list=new ArrayList<>();
					
						
					try {
						
						
						cs=con.prepareCall("{call sp_GetAddresses(?)}");
						cs.setString(1, user_email);
						rs=cs.executeQuery();
						
						while(rs.next())
						{
							Addresses address=new Addresses(rs.getInt(1), type_id, user_email, rs.getString(2),null);
							
							System.out.println(address);
							address_list.add(address);
						}			
						
						
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
					
					
					System.out.println(stock_id_list);
					
					
					request.getSession().setAttribute("address_list", address_list);
					
				}
			}
			else
			{
				response.sendRedirect("RegistrationPage.jsp");
			}
			
		}
		else
		{
			response.sendRedirect("RegistrationPage.jsp");
		}
		
		
		//request.getSession().setAttribute("c_list", c_list);
		request.getRequestDispatcher("/OrdersPage.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
