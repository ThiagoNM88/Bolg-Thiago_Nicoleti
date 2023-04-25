#or just create the file using the visual text editor 
class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end
# Exibe o formulário para criar um novo artigo
  def new
    @article = Article.new
  end

  # Cria um novo artigo com os dados do usuário
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  # Exibe um artigo específico
  def show
    @article = Article.find(params[:id])
  end

  private
  # Permite apenas os parâmetros :title e :description do artigo
  def article_params
    params.require(:article).permit(:title, :description)
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
    flash[:success] = "Article was updated"
    redirect_to article_path(@article)
    else
    flash[:success] = "Article was not updated"
    render 'edit'
    end
  end
  #Ação de exlusão
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Article was deleted"
    redirect_to articles_path
   end
   def set_article
    @article = Article.find(params[:id])
   end
end