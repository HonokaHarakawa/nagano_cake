class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.price }
  end
  
  def create
    @cart_items = current_customer.cart_items
    @same_cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      if @same_cart_item != nil
         @same_cart_item.update(amount: @same_cart_item.amount + params[:cart_item][:amount].to_i) 
         redirect_to cart_items_path
      else    
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer = current_customer
        @cart_item.save
        redirect_to cart_items_path
      end
  end  
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
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
