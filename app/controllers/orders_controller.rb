class OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @name = current_customer.first_name + current_customer.last_name
  end 
  
  def confirm
       @order = Order.new(order_params)
       @order.customer = current_customer
    if params[:order][:select_address] == "1"
       @orders = Address.find(params[:order][:address_id])
    end  
       @order.save
  end 
  
  def thanks
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end  
end
