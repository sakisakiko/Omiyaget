class Public::BookmarksController < ApplicationController

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
    @post_item=PostItem.all
    @bookmarks=Bookmark.where(customer_id: current_customer)
  end


  private
  def bookmark_params
   params.require(:bookmark).permit(:customer_id,:post_item_id)
  end
end
