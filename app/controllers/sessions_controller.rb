class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        remember user
        flash[:success] = "Bienvenue dans l'app secrète"
        redirect_to user
      else
        flash.now[:danger] = "Mauvaise combinaison email/password"
        render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private


end
