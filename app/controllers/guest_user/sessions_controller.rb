class GuestUser::SessionsController < Devise::SessionsController

  def guest_sign_in
    guest_user=GuestUser.guest
    sign_in guest_user
    redirect_to post_items_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
