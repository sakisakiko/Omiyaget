class Public::CustomersController < ApplicationController
 
  def show
    @customer=Customer.find(params[:id])
    @post_items=@customer.post_items
  end

  def edit
    @customer=current_customer
  end

  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def unsubscrib
    @customer=current_customer
  end

  def withdraw
    @customer=current_customer
    @customer.update(status: 2)
    reset_session
    redirect_to root_path
  end

  def followings
    customer=Customer.find(params[:id])
    @customers=customer.followings.where(customers: {status: "enrolled"})

  end

  def followers
    customer=Customer.find(params[:id])
    @customers=customer.followers.where(customers: {status: "enrolled"})
  end



  private
  def customer_params
   params.require(:customer).permit(:email,:name,:prefecture,:gender,:profile_image,:image,:introduction,:is_deleted)
  end

end
