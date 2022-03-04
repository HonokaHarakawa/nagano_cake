class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all 
  end
  
  def show
    @customer = Customer.find(params[:id])
  end  
  
  def edit
    @customer = Customer.find(params[:id])
  end  
  
  def update
    @customer = Customer.find(params[:id])
    @customer.save(customer_params)
    redirect_to admin_customer_path(@customer)
  end  
  
  private
  def customer_params
  end
  
end
