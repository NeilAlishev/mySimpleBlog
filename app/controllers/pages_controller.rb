class PagesController < ApplicationController
  expose_decorated(:articles) { Article.all.includes(:user).recent }

  def home
  end

  def about_us
  end
end
