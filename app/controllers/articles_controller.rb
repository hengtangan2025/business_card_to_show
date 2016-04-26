class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to "/articles"
    else
      redirect_to "/articles/new"
    end  
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to "/articles"
  end

  private
    def article_params
      params.require().permit(:title, :text_body, :picture, :user_id)
    end
end