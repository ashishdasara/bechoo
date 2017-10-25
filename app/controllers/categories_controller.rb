class CategoriesController < ApplicationController
  def index
    @categories = Category.sorted
  end

  def show
    @category = Category.find(params[:id])
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

  def edit
  end

  def update
  end

  def delete
    @category = Category.find(params[:id])
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
