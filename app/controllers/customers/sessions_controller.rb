# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]
  
  # GET /resource/sign_in
   #def new
   #end

  # POST /resource/sign_in
   def create
     @customer = current_customer
     redirect_to root_path
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
   end
   
   def reject_user
    @customer = Customer.find_by(name: params[:customer][:name])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to user_path
      else
      end
    end
   end
end
