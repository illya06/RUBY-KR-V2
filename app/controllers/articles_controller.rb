class ArticlesController < ApplicationController
  ARTICLES_AMMOUNT = 5

  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    authorize Article

    @page = params.fetch(:page, 0).to_i
    @articles = Article.is_public.order(created_at: :desc).search(params[:request]).includes(:author).offset(@page*ARTICLES_AMMOUNT).limit(ARTICLES_AMMOUNT)

    if @page < 0 || @articles.blank?
        redirect_to root_path
    end
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    authorize Article
    @article = Article.new
  end

  def create
    authorize Article

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
    authorize @article

    # return unless user_authorized?
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    # return unless user_authorized?

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    # return unless user_authorized?
    authorize @article

    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

#   def user_authorized?
#     return true if @article.author_id == current_user.id

#     redirect_to @article,
#                 alert: "Action is not allowed"
#     return false
#   end
end