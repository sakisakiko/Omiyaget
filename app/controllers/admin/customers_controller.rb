class Admin::CustomersController < ApplicationController
  # 管理者がログインしているか判断するメソッド
  before_action :admin_sign_in

  def index
    @customers=Customer.page(params[:page]).per(10)
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end
  
  # 会員がログインしていない場合会員一覧ページにアクセスできない
  def admin_sign_in
    unless admin_signed_in?
      redirect_to root_path
    end
  end


  private
  def customer_params
  params.permit(:status)
  end

end
