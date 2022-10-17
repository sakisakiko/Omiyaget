class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.all
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
