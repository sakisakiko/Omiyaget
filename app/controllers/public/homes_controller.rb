class Public::HomesController < ApplicationController
  
   def new_guest
     guest_customer=Customer.guest
     sign_in guest_customer
    
     redirect_to post_items_path
     flash[:notice]="ゲストユーザーとしてログインしました"
   end

end
