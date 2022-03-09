class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end 
  
  def create
  end
  
  def edit
  end  
  
end
