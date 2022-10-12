class Public::PostItemsController < ApplicationController
  def new
    @post_item=PostItem.new
    @tag_list=Tag.all
  end

  def create
    @post_item=current_customer.post_items.new(post_item_params)
    # @post_item.customer_id=current_customer.id
    tag_list=params[:post_item][:tag_name].split(nil)
    if @post_item.save
      @post_item.save_tag(tag_list)
      redirect_to post_item_path(@post_item.id)
    else
      redirect_to new_post_item_path
    end
  end



  def index
   @post_item=PostItem.new
   @post_items=PostItem.all
   @tag_list=Tag.all
  end

  def show
  end

  def edit
  end

private
def post_item_params
params.require(:post_item).permit(:image,:customer_id,:category_id,:name,:review,:evaluation,:price,:shop,:release,:buy_prefecture)
end



end
