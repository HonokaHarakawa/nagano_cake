class CustomersController < ApplicationController
  def show
  end 
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to  customers_page_path(@user)
  end
  
  def edit
  end  
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :password)
  end  
end
