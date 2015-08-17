class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.page(params[:page])
  end

  def show
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def edit

  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private
  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
