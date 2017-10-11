class CategorysController < ApplicationController
	def index
	  @categories = Category.all.page(params[:page]).per(3)
	end

  def show
    @category = Blog.where(category_id: params[:id]).all.page(params[:page]).per(3)
  end

	def new
    @new_category = Category.new()
	end

	def create
    @blog = Category.new(category_params)
    if @blog.save
      flash[:success] = "save blog success"
      redirect_to @blog
    else
      flash.now[:error] = "Could not save blog"
      render 'new'
    end
  end

  def edit
    @edit_category = Category.find(params[:id])
  end

  def update
    @update_category = Category.find(params[:id])
    @update_category.update(category_params)
    redirect_to @update_category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categorys_path
  end

  private
  def category_params
    params.require(:new_category).permit(:name)
  end
end
