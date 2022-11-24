class Admin::CustomersController < ApplicationController
  # 管理者がログインしていない場合、会員の一覧画面のアクセスを制限する
  # before_action :authenticate_admin!

  def index
    @customers=Customer.page(params[:page]).per(10)
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end

  private
  def customer_params
  params.permit(:status)
  end

end
