class Public::CustomersController < ApplicationController
    # 会員または管理者がログインしているか判断するメソッド（indexアクションは除く）
    before_action :customer_or_admin_sign_in

    # ログインしていない場合会員画面のアクセスを制限する
    #before_action :authenticate_customer!

    # ユーザーは自分以外の会員情報編集ページ、フォロー＆フォロワー一覧にアクセスできない
    before_action :correct_custoemr, only: [:edit, :update,:followings,:followers]

    def show
      @customer=Customer.find(params[:id])
      @post_items=@customer.post_items.page(params[:page]).per(10)
      @post_items_release =@customer.post_items.where(release: true).page(params[:page]).per(10)
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


    def followings
      customer=Customer.find(params[:id])
      @customers=customer.followings.where(customers: {status: "active"}).page(params[:page]).per(5)
    end

    def followers
      customer=Customer.find(params[:id])
      @customers=customer.followers.where(customers: {status: "active"}).page(params[:page]).per(5)
    end


    private
    def customer_params
     params.require(:customer).permit(:id,:email,:name,:prefecture,:gender,:profile_image,:image,:introduction,:is_deleted)
    end

    # ユーザーは自分以外の会員情報編集ページ、フォロー＆フォロワー一覧にアクセスできない
    def correct_custoemr
      @customer=Customer.find(params[:id])
      redirect_to post_items_path unless @customer == current_customer
    end

    # ログインしていないユーザー（会員）と管理者は会員ページ、編集ページ、フォロー＆フォロワーページにアクセスできない
    def customer_or_admin_sign_in
      unless customer_signed_in? or admin_signed_in?
        redirect_to root_path
      end
    end

end
