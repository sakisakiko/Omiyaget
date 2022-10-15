class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
    @post_items=@customer.post_items
  end

  def edit
  end

  def unsubscrib
  end


  private
  def customer_params
   params.require(:customer).permit(:email,:name,:prefecture,:gender,:profile_image,:image)
  end

end
