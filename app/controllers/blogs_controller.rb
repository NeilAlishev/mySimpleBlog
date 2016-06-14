class BlogsController < ApplicationController
  expose(:user) { User.find_by_full_name(params[:full_name]) }
  expose_decorated(:articles) { user.articles.page(params[:page]).per(5) }

  def show
    return if user
    flash[:alert] = "User doesn't exist"
    redirect_to root_path
  end
end
