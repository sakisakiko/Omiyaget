class Public::PostItemsController < ApplicationController
  def new
    @post_item=PostItem.new
    @tag_list=Tag.all
  end

  def create
    @post_item=current_customer.post_items.new(post_item_params)
    # @post_item.customer_id=current_customer.id
    tag_list=params[:post_item][:tag_name].split(/[[:blank:]]+/)
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
   @categories=Category.all
  end


  def search
    if params[:keyword].present?
      # tag = Tag.find_by(tag_name: params[:keyword])
      @post_items= []
      # 分割したキーワードごとに検索
      params[:keyword].split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        tags = Tag.where('tag_name LIKE(?)', "%#{keyword}%")
        tags.each do |tag|
          if tag.present?
            @post_items += tag.post_items
          end
        end
      end
      @post_items.uniq!

      @keyword = params[:keyword]
    else
      @post_items = PostItem.all
    end
  end

  def category_search
    # @post_items = PostItem.where('category_id LIKE ?', "%#{params[:category_id]}%")
    # render :index

    # if params[:category_id].present?
    #   @post_items = PostItem.where('category_id LIKE ?', "%#{params[:]}%")
    # else
    #   @users = User.none
    # end
    @category=Category.find(params[:id])
    @post_item= PostItem.find_by(category_id: params[:id])
    @post_items = PostItem.where(category_id: params[:id]).order('created_at DESC')
  end



  def show
    @post_item=PostItem.find(params[:id])
    @post_tags=@post_item.tags
    @post_comment=PostComment.new
    @post_comments=@post_item.post_comments
  end

  def edit
    @post_item=PostItem.find(params[:id])
    @tag_list=@post_item.tags.pluck(:tag_name).join('　')
  end

  def update
    @post_item=PostItem.find(params[:id])
    tag_list=params[:post_item][:tag_name].split(/[[:blank:]]+/)
    @post_item.update(post_item_params)
    @post_item.save_tag(tag_list)
    flash[:notice] = "お土産情報を変更しました。"
    redirect_to post_item_path(@post_item.id)
  end

  def destroy
    @post_item=current_customer.post_items.find(params[:id])
    @post_item.destroy
    flash[:notice] = "お土産を削除しました。"
    redirect_to post_items_path
  end




private
def post_item_params
params.require(:post_item).permit(:image,:customer_id,:category_id,:name,
:review,:evaluation,:price,:shop,:release,:buy_prefecture,:keyword)
end



end
