class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @articles = Article.reversed
    @articles.to_a
  end

  def new
    @article = Article.new
  end

  def create
    require 'fileutils'
    title = params[:article][:title]
    text_body = params[:article][:text_body]
    picture = params[:article][:picture]

    if !picture.blank?
      picture_file = File.join("public", picture.original_filename)
      FileUtils.cp picture.path, picture_file
      @article = Article.create(:title => title, :text_body => text_body, :picture => picture.original_filename)
    else
      @article = Article.create(:title => title, :text_body => text_body, :picture => picture)
    end

    if @article.save
      redirect_to "/articles"
    else
      redirect_to "/articles/new"
    end  

  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    require 'fileutils'
    @article = Article.find(params[:id])
    title = params[:article][:title]
    text_body = params[:article][:text_body]
    picture = params[:article][:picture]

     if !picture.blank?
      picture_file = File.join("public", picture.original_filename)
      FileUtils.cp picture.path, picture_file
      if @article.update_attributes(:title => title, :text_body => text_body, :picture => picture.original_filename)
        redirect_to "/articles"
      else
        render "/articles/#{params[:id]}"
      end
    else
      if @article.update_attributes(:title => title, :text_body => text_body, :picture => @article.picture)
        redirect_to "/articles"
      else
        render "/articles/#{params[:id]}"
      end
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to "/articles"
  end

  private
    def article_params
      params.require(:article).permit(:title, :text_body, :picture)
    end
end