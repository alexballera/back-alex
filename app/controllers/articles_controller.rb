class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_asistant!, only: [:new, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)
    respond_to do |format|
      if current_user.is_asistant?
        if @article.save
          format.html { redirect_to @article, notice: 'El artículo fue creado y se enviaron los correos' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @article, :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if current_user.is_asistant?
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'El artículo fue editado' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @article, :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    respond_to do |format|
      if current_user.is_admin?
        @article.destroy
        format.html { redirect_to articles_url, notice: 'El artículo fue eliminado' }
        format.json { head :no_content }
      else
        format.html { redirect_to '/articles', :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      if Article.exists?(params[:id])
        @article = Article.find(params[:id])
      else
        respond_to do |format|
          format.html { redirect_to articles_path, :alert => 'El artículo no existe' }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :user_id, :image, :urlgit, :urlweb, :urlimg, :category_ids => [])
    end
end
