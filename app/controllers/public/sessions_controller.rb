# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def customer_status
    @customer=Customer.find_by(email:params[:customer][:email])
    return if !@customer

    if @customer.valid_password?(params[:customer][:password])&&(@customer.is_deleted=="2")
      flash[:notice]="既に退会済みです。再度登録してご利用下さい。"
    elsif @customer.valid_password?(params[:customer][:password])&&(@customer.is_deleted=="3")
      flash[:notice]="このアカウントは現在利用停止されています。お問合せフォームからご連絡下さい。"
    else
    end

  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
