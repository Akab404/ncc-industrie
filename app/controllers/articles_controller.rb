class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @articles = policy_scope(Article)
  end

  def show
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save!
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update!(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @article
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
    params.require(:article).permit(:titre, :content, :publication_date, :category)
  end
end
