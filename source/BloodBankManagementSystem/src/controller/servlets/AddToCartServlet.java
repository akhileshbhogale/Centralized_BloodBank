package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			if(session.getAttribute("type_id")!=null)
			{
				int type_id=(Integer)session.getAttribute("type_id");
				if(type_id<1 && type_id>3)
				{
					response.sendRedirect("RegistrationPage.jsp");
				}
				else
				{
					List<Integer> stock_id_list=null;
					if(session.getAttribute("stock_id_list")==null)
					{
						stock_id_list=new ArrayList<>();
					}
					else
					{
						stock_id_list=(List<Integer>) session.getAttribute("stock_id_list");
					}
						
					String []arr=request.getParameterValues("stock_id_list");
					
					for(String num: arr)
					{
						stock_id_list.add(Integer.parseInt(num));
					}
					
					System.out.println(stock_id_list);
					
					request.getSession().setAttribute("stock_id_list", stock_id_list);
					response.sendRedirect("ViewStocks.jsp");
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
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
