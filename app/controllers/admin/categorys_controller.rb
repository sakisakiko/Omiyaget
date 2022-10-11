class Admin::CategorysController < ApplicationController

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

  def destroy
    @category=Category.find(params[:id])
    @category.destroy
     redirect_to admin_categorys_path
  end


  def category_params
    params.require(:category).permit(:name,:id)
  end


end
