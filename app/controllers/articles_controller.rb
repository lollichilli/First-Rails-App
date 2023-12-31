class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create 
    # This method is verbose and error-prone. It would become worse as we add more fields
    # Therefore, we'll use Strong Parameter - a feature of Rails, to filter params
    # Add a private method to the bottom and change create
    # @article = Article.new(title: "...", body: "...")

    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end



  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
    
end
