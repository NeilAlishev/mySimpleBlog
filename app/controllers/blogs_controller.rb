class BlogsController < ApplicationController
  expose(:user) { User.find_by_full_name(params[:full_name]) }
  expose(:articles) { user.articles.page(params[:page]).per(5) }

  def index
  end

  def show
    return if user
    flash[:alert] = "Такого пользователя не существует"
    redirect_to root_path
  end
end
