class CategoriesController < ApplicationController

  before_action :require_proper_route_for_role, only: [:index, :new]
  before_action :is_admin, only: [:index, :create, :new, :destroy]

  def index
    @categories = Category.sorted
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Successfully created..."
      redirect_to(categories_path)
    else
      render('new')
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to(categories_path)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
