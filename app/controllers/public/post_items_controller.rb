class Public::PostItemsController < ApplicationController
  #会員または管理者がログインしているか判断するメソッド（indexアクションは除く）
  # before_action :customer_or_admin_sign_in, except: [:index]

  before_action :correct_custoemr, only: [:edit, :update]
  before_action :correct_custoemr_show, only: [:show]

  def new
    @post_item=PostItem.new
    @tag_list=Tag.all
  end

  def create
    @post_item=current_customer.post_items.new(post_item_params)
    tag_list=params[:post_item][:tag_name].split(/[[:blank:]]+/)
    if @post_item.save
      @post_item.save_tag(tag_list)
      redirect_to post_item_path(@post_item.id)
    else
      render :new
    end
  end

  def index
   @post_item=PostItem.new
   @post_items =   PostItem.where(release: true).page(params[:page]).per(9)
  # 表示されたお土産は公開ステータスがtrueである
  # ※ページネーション
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
              @post_items += tag.post_items.where(release: true)
            end
          end
        end
        @post_items_amount=@post_items.count
        @post_items = Kaminari.paginate_array(@post_items).page(params[:page]).per(9)
        # @post_items.uniq!

        @keyword = params[:keyword]
    else
        @post_items =   PostItem.where(release: true)
    end
     @categories=Category.all# 部分テンプレートの為必要
  end


  def category_search
    @category=Category.find(params[:id])
    @post_item= PostItem.find_by(category_id: params[:id])
    @post_items =   PostItem.where(release: true,category_id: params[:id]).order('created_at DESC').page(params[:page]).per(9)
    # 「カテゴリーが一致、公開状態になっている、お土産の投稿者が退会していない」の条件に一致するお土産を定義
    # 1ページに９個のお土産表示（ページネーション）
    @post_items_amount = PostItem.where(release: true,category_id: params[:id]).order('created_at DESC').count
    # 上記で検索したお土産の件数を定義する
    @categories=Category.all
    # 部分テンプレートの為必要
  end


  def prefecture_search
    @post_items = PostItem.joins(:customer).where(buy_prefecture_id: params[:buy_prefecture_id],release: true).page(params[:page]).per(9)
    # 「購入地域が一致、公開状態になっている、お土産の投稿者が退会していない」の条件に一致するお土産を定義
    # 1ページに９個のお土産表示（ページネーション）
    @post_items_amount = PostItem.joins(:customer).where(buy_prefecture_id: params[:buy_prefecture_id],release: true).count
    # 上記で検索したお土産の件数を定義する
    @post_item= PostItem.find_by(buy_prefecture_id: params[:buy_prefecture_id])
    @buy_prefecture = BuyPrefecture.find(params[:buy_prefecture_id])
    @categories=Category.all# 部分テンプレートの為必要
  end


  def show
    @post_item=PostItem.find(params[:id])
    @post_tags=@post_item.tags
    @post_comment=PostComment.new
  end

  def edit
    @post_item=PostItem.find(params[:id])
    @tag_list=@post_item.tags.pluck(:tag_name).join('　')
  end

  def update
    @post_item=PostItem.find(params[:id])
    tag_list=params[:post_item][:tag_name].split(/[[:blank:]]+/)

    if @post_item.update(post_item_params)
       @post_item.save_tag(tag_list)
       flash[:notice] = "お土産情報を変更しました。"
       redirect_to post_item_path(@post_item.id)
    else
       render :edit
    end
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


  # ユーザーは自分以外のお土産情報編集ページにアクセスできない
  def correct_custoemr
    @post_item=PostItem.find(params[:id])
    @customer=@post_item.customer
    redirect_to post_items_path unless @customer == current_customer
  end

  # ユーザーは自分以外の非公開のお土産詳細ページにアクセスできない
  def correct_custoemr_show
    @post_item=PostItem.find(params[:id])
    @customer=@post_item.customer
    if @post_item.release==false
     redirect_to post_items_path unless @customer == current_customer
    end
  end

  # ログインしていないユーザー（会員）と管理者は一覧ページ以外のページにアクセスできない
  # def customer_or_admin_sign_in
  #   unless customer_signed_in? or admin_signed_in?
  #     redirect_to root_path
  #   end
  # end


end
