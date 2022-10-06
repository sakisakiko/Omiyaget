class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def unsubscrib
  end


    private
  def customer_params
   params.require(:customer).permit(:email,:name,:prefecture,:gender)
  end

end
