class CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]
  def show
    @customer = current_customer
  end 
  
  def create
  end
  
  def edit
    @customer = current_customer
  end  
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_page_path(@customer)
  end  
  
  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end  
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
  
end
