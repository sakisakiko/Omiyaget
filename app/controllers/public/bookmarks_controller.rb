class Public::BookmarksController < ApplicationController
  # ログインしていない場合ブックマーク画面のアクセスを制限する
  before_action :customer_sign_in

  def create
    @post_item=PostItem.find(params[:post_item_id])
    bookmark=@post_item.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end

  end

  def destroy
    @post_item=PostItem.find(params[:post_item_id])
    bookmark=@post_item.bookmarks.find_by(customer_id: current_customer.id)

    if bookmark.present? # 二度押し回避
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end


  def index
     @bookmarks=Bookmark.joins(:post_item).where(post_items:{release: true},
     customer_id: current_customer.id).page(params[:page]).per(10)
  end

    # ログインしていないユーザーはブックマークページにアクセスできない
  def customer_sign_in
    unless customer_signed_in?
      redirect_to root_path
    end
  end


  private
  def bookmark_params
   params.require(:bookmark).permit(:customer_id,:post_item_id)
  end
end
