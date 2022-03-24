class OrdersController < ApplicationController
  
  def index
    @orders = current_customer.orders.all
  end
  

  def new
    @order = Order.new
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @name = current_customer.first_name + current_customer.last_name
  end 
  
  def confirm
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.price }
    @order = Order.new(order_params)
    @order.postage = 800
    @order.billing_amount = @total + @order.postage
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
    end
  end 
  
  def create
    @order = Order.create(
        customer_id: current_customer.id,
        postal_code: params[:order][:postal_code],
        address: params[:order][:address],
        name: params[:order][:name],
        billing_amount: params[:order][:billing_amount],
        postage: params[:order][:postage]
      )
    @order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, order_detail| sum + order_detail.item.with_tax_price*order_detail.amount }
  end
  

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount, :current_customer_id)
  end  
  
end
