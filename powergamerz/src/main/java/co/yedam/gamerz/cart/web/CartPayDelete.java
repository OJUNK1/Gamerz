package co.yedam.gamerz.cart.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.gamerz.cart.service.CartService;
import co.yedam.gamerz.cart.service.CartVO;
import co.yedam.gamerz.cart.serviceImpl.CartServiceImpl;
import co.yedam.gamerz.common.ViewResolve;

@WebServlet("/cartpaydelete.do")
public class CartPayDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CartPayDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartService dao = new CartServiceImpl();
		CartVO vo = new CartVO();
		
		
		vo.setCartPersonal(request.getParameter("cartPersonal"));

		int num = dao.cartDelete(vo);
		String viewName = "user/cartmessage";

		

		if (num == 1) {
			request.setAttribute("message", "Succeed Buy the Game");
			ViewResolve.forward(request, response, viewName);
		} else {
			request.setAttribute("message", "실패.");
			ViewResolve.forward(request, response, viewName);
		}

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
