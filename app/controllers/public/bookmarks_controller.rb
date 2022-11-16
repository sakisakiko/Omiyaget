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
    # @bookmarks=Bookmark.joins(:post_item,:customer).where(post_items:{release: true},status: "enrolled")
    @bookmarks=Bookmark.joins(:post_item).where(post_items: {release: true},customer_id: current_customer.id).page(params[:page]).per(10)
  end


  private
  def bookmark_params
   params.require(:bookmark).permit(:customer_id,:post_item_id)
  end
end
