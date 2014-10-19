class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      UserMailer.welcome_email(@user).deliver!

      flash[:login_message] = "Success!"
      redirect_to my_events_path(@user)
      # TODO: redirect to list of events user is attending/invited to
    else
      flash[:signin_error] = @user.errors.full_messages
      redirect_to '/login'
    end
  end

 	private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
