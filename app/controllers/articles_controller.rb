class ArticlesController < ApplicationController
  ARTICLES_AMMOUNT = 2

  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @page = params.fetch(:page, 0).to_i
    @articles = Article.order(created_at: :desc).includes(:author).offset(@page*ARTICLES_AMMOUNT).limit(ARTICLES_AMMOUNT)

    if @page < 0 || @articles.blank?
        redirect_to root_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author =  current_user

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    unless @article.author_id == current_user.id
        redirect_to @article,
                    alert: "Action is not allowed"
        return
    end

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    unless @article.author_id == current_user.id
        redirect_to @article,
                    alert: "Action is not allowed"
        return
    end

    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end