package co.yedam.gamerz.cart.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int itemId;
	private String itemIllust;
	private String itemName;
	private int itemPrice;
	private int itemSale;
	private int itemTotal;
	private int cartTotal;
	private String cartPersonal;
}
