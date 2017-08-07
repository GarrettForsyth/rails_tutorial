class ArticlesController < ApplicationController
  include ArticlesHelper
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    # Create new comment to 'tell' what fields a Comment object has
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    # created to 'tell' rails what fields an Article object has
    @article = Article.new
  end

  # Processes data from form in new.html.erb
  def create
    @article = Article.new(article_params)

    @article.save
    

    flash.notice = "Article '#{@article.title}' created!"
    redirect_to article_path(@article)

  end

  def destroy
    @article = Article.find(params[:id])
    flash.notice = "Article '#{@article.title}' destroyed!"
    @article.destroy
    redirect_to articles_path

  end

  def edit
    @article = Article.find(params[:id])
  end

  # Processes the form from edit.html.erb
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end

  

end









