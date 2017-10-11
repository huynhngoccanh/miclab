class BlogsController < ApplicationController

	def index
		@blogs = Blog.all.page(params[:page]).per(3)
    @blogs = @blogs.where(category_id: params[:category_id]) if params[:category_id].present?
	end

	def new
		@new_blog = Blog.new()
    @categories = Category.all.collect
	end

	def create
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
      if @blog.save
        flash[:success] = "save blog success"
        redirect_to @blog
      else
        flash.now[:error] = "Could not save blog"
        render 'new'
      end
  end
  
  def edit
    @edit_blog = Blog.find(params[:id])
  end

  def update
    @update_blog = Blog.find(params[:id])
    @update_blog.update(blog_params)
    redirect_to @update_blog
  end

  def show
    @blog_detail = Blog.find(params[:id])
  end

  def destroy
      @blog_destroy = Blog.find(params[:id])
      @blog_destroy.destroy
      redirect_to blogs_path
  end

    private
    def blog_params
      params.require(:new_blog).permit(:title, :content, :category_id)
    end
end
