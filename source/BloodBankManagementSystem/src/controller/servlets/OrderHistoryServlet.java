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

import model.beans.OrderHistory;
import model.beans.UpdateProfile;


@WebServlet("/orderhistory")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		con = (Connection) config.getServletContext().getAttribute("dbcon");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CallableStatement cs=null;
		ResultSet rs=null;
		CallableStatement cs1=null;
		ResultSet rs1=null;
		List<OrderHistory> order_history_list = new ArrayList<>();
		
		
		try {
			cs=con.prepareCall("{call sp_FetchHospitalOrderHistory(?)}");
			//cs.setString(1,(String)request.getSession().getAttribute("u_email"));
			/*cs.setString(2,(String)request.getSession().getAttribute("u_email"));*/
			
			cs.setString(1,"tanjulr@gmail.com");
			
			rs=cs.executeQuery();
			
			while(rs.next())
			{
				OrderHistory ohistory = new OrderHistory(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),rs.getTimestamp(6));
				System.out.println(ohistory);
				order_history_list.add(ohistory);
			}
				
			cs1=con.prepareCall("{call sp_BloodBankOrderHistory(?)}");
			//cs.setString(1,(String)request.getSession().getAttribute("u_email"));
			/*cs.setString(2,(String)request.getSession().getAttribute("u_email"));*/
			
			cs.setString(1,"tanjulr@gmail.com");
			
			rs1=cs1.executeQuery();
			
			while(rs1.next())
			{
				OrderHistory ohistory = new OrderHistory(rs1.getString(1),rs1.getString(2),rs1.getString(3),rs1.getInt(4),rs1.getInt(5),rs1.getTimestamp(6));
				System.out.println(ohistory);
				order_history_list.add(ohistory);
			}
			
			request.getSession().setAttribute("profile_list",order_history_list);
			System.out.println(order_history_list);
			request.getRequestDispatcher("/OrderHistory.jsp").forward(request, response);
			
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
