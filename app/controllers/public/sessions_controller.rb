# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  # ↓ログイン処理（create)が行われる前に処理をする
  before_action :customer_state, only: [:create]

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

  # protected

  # def customer_state
  #   @customer=Customer.find_by(email:params[:customer][:email])
  #   return if !@customer

  #   if @customer.valid_password?(params[:customer][:password])&&(@customer.is_deleted==true)
  #     flash[:notice]="既に退会済みです。再度登録してご利用下さい。"
  #     redirect_to new_customer_registration_path
  #   elsif @customer.valid_password?(params[:customer][:password])&&(@customer.is_deleted== 3)
  #     flash[:notice]="このアカウントは現在利用停止されています。お問合せフォームからご連絡下さい。"
  #     redirect_to  destroy_customer_session_path(@customer.id)
  #   else
  #   end

  # end



  protected
  # 退会しているかを判断するメソッド
  def customer_state
        # 【処理１】入力されたemailからアカウントを１個取得
    @customer=Customer.find_by(email:params[:customer][:email])
      # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    #【処理２】取得したアカウントのパスワードと入力されたパスワードが一致しているか確認
    #【処理３】退会フラグがtrue（退会済）のとき
    if @customer.valid_password?(params[:customer][:password])&&(@customer.status=="enr")
      # フラッシュメッセージ
        flash[:notice] = "既に退会済みです。再度登録をしてご利用ください。"
      # 新規登録画面へリダイレクト
        redirect_to new_customer_registration_path
    elsif @customer.valid_password?(params[:customer][:password])&&(@customer.status=="stop")
        flash[:notice] = "このアカウントは現在利用停止されています。お問合せフォームからご連絡下さい。"
        redirect_to new_customer_registration_path
    end
  end






  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
