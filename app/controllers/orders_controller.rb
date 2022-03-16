class OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @name = current_customer.first_name + current_customer.last_name
  end 
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      @order.save
    elsif select_address == "1"
      @order = params[:order][:address_id]
      @order.save
    else  
      @order.save
    end    
  end 
  
  def thanks
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end  
end
