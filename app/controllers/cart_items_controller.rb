class CartItemsController < ApplicationController
  
  def index
    @customer = current_customer
  end
  
  def create
    @item = Item.find(cart_item_params[:item_id])
  end  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
