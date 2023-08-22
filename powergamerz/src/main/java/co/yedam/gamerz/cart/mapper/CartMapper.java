package co.yedam.gamerz.cart.mapper;

import java.util.List;

import co.yedam.gamerz.cart.service.CartVO;


public interface CartMapper {
	List<CartVO> cartList();
	
	CartVO cartSelect(CartVO vo);
	
	int cartInsert(CartVO vo);
	
	int cartDelete(CartVO vo);
	
	int cartUpdate(CartVO vo);
}
