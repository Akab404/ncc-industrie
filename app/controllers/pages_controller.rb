class PagesController < ApplicationController
  def home
    @articles = Article.where(publish: true).where("publication_date <= ?", Time.now).order(publication_date: :desc)[0..2]

  end

  def admin
    redirect_to user_session_path
  end
end
