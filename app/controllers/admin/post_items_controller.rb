class Admin::PostItemsController < ApplicationController

  # 管理者がログインしていない場合、レビュー画面のアクセスを制限する
  # before_action :authenticate_admin!

  def index
    @post_items=PostItem.page(params[:page]).per(5)
  end

  def update
    @post_item=PostItem.find(params[:id])
    @post_item.review=""
    @post_item.save!
    redirect_to admin_review_path
  end


  private

  def post_item_params
    params.require(:post_item).permit(:review)
  end


end
