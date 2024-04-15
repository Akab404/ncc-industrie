class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @articles = Article.all
    else
      @articles = Article.where("publication_date <= ?", Time.now)
    end
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save!
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update!(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      render :show, status: :see_other
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:titre, :cover_image, :content, :publication_date, :category, photos: [])
  end
end
