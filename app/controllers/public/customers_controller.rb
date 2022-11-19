class Public::CustomersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
    @post_items=@customer.post_items.page(params[:page]).per(10)
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def unsubscrib
    @customer=current_customer
  end

  def withdraw
    @customer=current_customer
    @customer.destroy
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  # def withdraw
  #   @customer=current_customer
  #   @customer.update(status: 2)
  #   reset_session
  #   redirect_to root_path
  # end

  def followings
    customer=Customer.find(params[:id])
    @customers=customer.followings.where(customers: {status: "enrolled"}).page(params[:page]).per(5)

  end

  def followers
    customer=Customer.find(params[:id])
    @customers=customer.followers.where(customers: {status: "enrolled"}).page(params[:page]).per(5)
  end


  private
  def customer_params
   params.require(:customer).permit(:id,:email,:name,:prefecture,:gender,:profile_image,:image,:introduction,:is_deleted)
  end

end
