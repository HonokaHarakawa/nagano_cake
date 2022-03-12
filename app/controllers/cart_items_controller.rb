class CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
    @customer = current_customer
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer = current_customer
    if @cart_item.save!
    redirect_to cart_items_path
    end
  end  
  

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
