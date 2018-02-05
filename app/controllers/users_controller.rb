class UsersController < ApplicationController
  def home
  end

  def reponse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash[:success] = "Connexion avec succès le #{Date.today}"
    if @user.save
      log_in(@user)
       redirect_to @user
    else
       render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
