class Public::SessionsController < Devise::SessionsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ↓ログイン処理（create)が行われる前に処理をする
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    post_items_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end



  before_action :customer_active
  # 会員ステータスが有効でないとき（利用停止されている）ログアウトさせる
    def customer_active
      redirect_to logout_path if current_customer && current_customer.status != 'active'
    end


  protected
  # 退会しているかを判断するメソッド
  def customer_state
        # 【処理１】入力されたemailからアカウントを１個取得
    @customer=Customer.find_by(email:params[:customer][:email])
      # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    #【処理２】取得したアカウントのパスワードと入力されたパスワードが一致しているか確認
    #【処理３】退会フラグがstop(利用停止）のとき
    if @customer.valid_password?(params[:customer][:password])&&(@customer.status=="stop")
      # フラッシュメッセージ
        flash[:notice] = "このアカウントは現在利用停止されています。"
      # ログイン画面へリダイレクト
        redirect_to new_customer_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end
