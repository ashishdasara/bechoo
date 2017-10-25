class SubCategoriesController < ApplicationController

  before_action :find_category

  def index
    @sub_categories = @category.sub_categories.sorted
  end

  def new
    @sub_category = SubCategory.new(:category_id => @category.id)
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.category = @category
    if @sub_category.save
      redirect_to(categories_path)
    else
      render('new')
    end
  end

  def delete
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    redirect_to(categories_path)
  end

  def show
  end

  def edit
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:name)
  end
  def find_category
    @category = Category.find(params[:category_id])
  end
end
