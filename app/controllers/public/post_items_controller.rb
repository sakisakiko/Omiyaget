class Public::PostItemsController < ApplicationController
  def new
    @post_item=PostItem.new
  end

  def create
    @post_item=PostItem.new(post_item_porams)
    @post_item.customer_id=current_customer.id
    @post_item.save
    redirect_to post_item_path(@post_item.id)
  end

  def index
  end

  def show
  end

  def edit
  end

private
def post_item_params
params.require(:post_item).permit(:image,:customer_id,:category_id,:name,:image_id,:review,:evaluation,:price,:shop,:release,:buy_prefecture)
end



end
