class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.update(category_params)
    redirect_to categories_path
  end
  private

  def category_params
    params.require(:category).permit(:title)
  end
end
