class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_asistant!, only: [:new, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    respond_to do |format|
      if current_user.is_asistant?
        if @project.save
          format.html { redirect_to @project, notice: 'El proyecto fue creado exitosamente' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @project, :alert => 'No tienes permisos para realizar esta acción' }
      end

    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if current_user.is_asistant?
        if @project.update(project_params)
          format.html { redirect_to @project, notice: 'El proyecto fue editado' }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @project, :alert => 'No tienes permisos para realizar esta acción' }
      end

    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    respond_to do |format|
      if current_user.is_admin?
        @project.destroy
          format.html { redirect_to projects_url, notice: 'El proyecto fue eliminado' }
          format.json { head :no_content }
      else
        format.html { redirect_to '/projects', :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :user_id, :image, :urlgit, :urlweb, :urlimg)
    end
end
