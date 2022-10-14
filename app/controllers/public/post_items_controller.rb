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
  # @tag_list=Tag.all
  end

  def show
    @post_item=PostItem.find(params[:id])
    @post_tags=@post_item.tags

  end

  def edit
    @post_item=PostItem.find(params[:id])
    @tag_list=@post_item.tags.pluck(:tag_name).join(',')
  end

  def update
    @post_item=PostItem.find(params[:id])
    tag_list=params[:post_item][:tag_name].split(nil)
    @post_item.update(post_item_params)
    @post_item.save_tag(tag_list)
    redirect_to post_item_path(@post_item.id)
  end

  def destroy #
    @post_item=current_customer.post_items.find(params[:id])
    @post_item.destroy
    redirect_to post_items_path
  end



private
def post_item_params
params.require(:post_item).permit(:image,:customer_id,:category_id,:name,:review,:evaluation,:price,:shop,:release,:buy_prefecture)
end



end
