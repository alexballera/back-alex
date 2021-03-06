class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_asistant!, only: [:new, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.latest.page(params[:page]).per_page(5)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = current_user.categories.new(category_params)
    respond_to do |format|
      if current_user.is_asistant?
        if @category.save
          format.html { redirect_to @category, notice: 'La categoría fue creada' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @category, :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if current_user.is_asistant?
        if @category.update(category_params)
          format.html { redirect_to @category, notice: 'La categoría fue editada' }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @category, :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    respond_to do |format|
      if current_user.is_admin?
        @category.destroy
        format.html { redirect_to categories_url, notice: 'La categoría fue eliminada' }
        format.json { head :no_content }
      else
        format.html { redirect_to '/categories', :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      if Category.exists?(params[:id])
        @category = Category.find(params[:id])
      else
        respond_to do |format|
          format.html { redirect_to users_path, :alert => 'La categoría no existe' }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :description, :user_id, :project_ids => [], :article_ids => [])
    end
end
