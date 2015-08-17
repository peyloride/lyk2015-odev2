class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :show, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit

  end

  def create
    @item = current_user.items.create(item_params)
    @item.update_attributes(category_id: @category.id)

    if @item.save
      redirect_to @category, notice: 'Item was created successfully.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to @category, notice: 'Item was deleted successfully.'
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def item_params
    params.require(:item).permit(:content)
  end

end
