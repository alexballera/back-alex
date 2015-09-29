class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]  

  def index
    @users = User.all
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if current_user.is_admin?
        if @user.update(user_params)
          format.html { redirect_to @user, :notice => 'El usuario fue editado exitosamente' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @user, :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user.is_admin?
        if @user.destroy
          format.html { redirect_to users_url, 
            :alert => 'El usuario fue eliminado exitosamente' }
          format.json { head :no_content }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to '/users', :alert => 'No tienes permisos para realizar esta acción' }
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :permission_level)
  end
end
