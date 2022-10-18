class Admin::PostItemsController < ApplicationController

  def index
    @post_items=PostItem.all
  end

  def destroy
    # レビューを探してレビューをけす
    post_item=PostItem.find(params[:id])
    review=post_item.review
    review.destroy
    redirect_to admin_review_path
  end


  private

  def post_item_params
    params.require(:post_item).permit(:review)
  end


end
