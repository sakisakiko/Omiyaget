class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
    @post_items=@customer.post_items
  end

  def edit
    @customer=Customer.find(params[:id])
  end
  
  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def unsubscrib
  end


  private
  def customer_params
   params.require(:customer).permit(:email,:name,:prefecture,:gender,:profile_image,:image,:introduction)
  end

end
