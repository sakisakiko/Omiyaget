class Admin::PostItemsController < ApplicationController
  # 管理者がログインしているか判断するメソッド
  before_action :admin_sign_in

  def index
    @post_items=PostItem.page(params[:page]).per(5)
  end

  def update
    @post_item=PostItem.find(params[:id])
    @post_item.review=""
    @post_item.save!
    redirect_to admin_review_path
  end

  # 会員がログインしていない場合、レビュー一覧にアクセスできない
  def admin_sign_in
    unless admin_signed_in?
      redirect_to root_path
    end
  end


  private

  def post_item_params
    params.require(:post_item).permit(:review)
  end


end
