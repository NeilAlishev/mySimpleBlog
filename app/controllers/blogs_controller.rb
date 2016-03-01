class BlogsController < ApplicationController
  expose(:user) {User.find_by(full_name: params[:username])}
  expose(:article) { Article.find_by(user: user) }
  def index
  end

  def show
    if user.nil?
      flash[:alert] = "Такого пользователя не существует"
      redirect_to root_path
    end
  end
end
