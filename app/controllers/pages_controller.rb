class PagesController < ApplicationController
  def home
  end

  def admin
    redirect_to user_session_path
  end
end
