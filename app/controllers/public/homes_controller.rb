class Public::HomesController < ApplicationController
  def top
  end

  def new_guest
    customer=Customer.guest
    sign_in customer
    redirect_to post_items_path
    flash[:notice]="ゲストユーザーとしてログインしました"
  end

end
