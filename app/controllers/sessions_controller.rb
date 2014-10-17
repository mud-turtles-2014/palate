class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: session_params[:name])
    .try(:authenticate, session_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to events_path
    else
      flash[:error] = "Login Failed"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
