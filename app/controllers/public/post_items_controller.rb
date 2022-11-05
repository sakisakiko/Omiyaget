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
   @post_items =   PostItem.joins(:customer).where(customers: {status: "enrolled"},release: true)
  # お土産の投稿者のステータスがenrolled(有効)場合のお土産のみ表示かつ
  # 表示されたお土産は公開ステータスがtrueである
   @categories=Category.all
  end


  def search
    if params[:keyword].present?
      # tag = Tag.find_by(tag_name: params[:keyword])
      @post_items=[]
      # 分割したキーワードごとに検索
        params[:keyword].split(/[[:blank:]]+/).each do |keyword|
          next if keyword == ""
          tags = Tag.where('tag_name LIKE(?)', "%#{keyword}%")
          tags.each do |tag|
            if tag.present?
              @post_items += tag.post_items.joins(:customer).where(customers: {status: "enrolled"},release: true)
            end
          end
        end
        @post_items.uniq!

        @keyword = params[:keyword]
      else
        @post_items =   PostItem.joins(:customer).where(customers: {status: "enrolled"},release: true)
      end
  end


  def category_search
    @category=Category.find(params[:id])
    @post_item= PostItem.find_by(category_id: params[:id])
    @post_items =   PostItem.joins(:customer).where(customers: {status: "enrolled"},release: true,category_id: params[:id]).order('created_at DESC')
    # @post_items = PostItem.where(category_id: params[:id]).order('created_at DESC')
  end


  def prefecture_search
    @post_items = PostItem.joins(:customer).where(buy_prefecture_id: params[:buy_prefecture_id],customers: {status: "enrolled"},release: true)
    # @post_items = PostItem.where(['buy_prefecture_id LIKE?', "%#{params[:buy_prefecture_id]}%")
    @post_item= PostItem.find_by(buy_prefecture_id: params[:buy_prefecture_id])
    @buy_prefecture = BuyPrefecture.find(params[:buy_prefecture_id])
  end




  def show
    @post_item=PostItem.find(params[:id])
    @post_tags=@post_item.tags
    @post_comment=PostComment.new
    @post_comments= PostComment.joins(:customer).where(customers: {status: "enrolled"})
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
:review,:evaluation,:price,:shop,:release,:keyword,:buy_prefecture_id,:lat,:lng)
end



end
