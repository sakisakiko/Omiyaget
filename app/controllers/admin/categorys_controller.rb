class Admin::CategorysController < ApplicationController
  # 管理者がログインしているか判断するメソッド
  before_action :admin_sign_in

  def create
    @category=Category.new(category_params)
    @category.save
    redirect_to admin_categorys_path
  end

  def index
    @category=Category.new
    @categories=Category.all
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_categorys_path
  end

  def category_params
    params.require(:category).permit(:name,:id)
  end

  # 会員がログインしていないカテゴリーページにアクセスできない
  def admin_sign_in
    unless admin_signed_in?
      redirect_to root_path
    end
  end


end
