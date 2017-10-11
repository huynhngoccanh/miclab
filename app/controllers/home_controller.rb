class HomeController < ApplicationController
  @categorys = Category.all
  def index
  	@all_blogs = Blog.all
  end
end
