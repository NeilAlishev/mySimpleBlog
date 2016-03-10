class BlogsController < ApplicationController
  expose(:user) { User.find_by_full_name(params[:full_name]) }

  def index
  end

  def show
    return if user
    flash[:alert] = "Такого пользователя не существует"
    redirect_to root_path
  end
end
