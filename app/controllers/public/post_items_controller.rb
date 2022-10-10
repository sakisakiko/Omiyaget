class Public::PostItemsController < ApplicationController
  def new
    @post_item=PostItem.new
    @tag_list=Tag.all
  end

  def create
    @post_item=PostItem.new(post_item_porams)
    @post_item.customer_id=current_customer.id
    tag_list=params[:post_item][:name].split(',')
    if @post_item.save
      @post_item. save_tag
      redirect_to post_item_path(@post_item.id)
    else
      render:new
    end
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
