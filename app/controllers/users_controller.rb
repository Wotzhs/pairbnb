class UsersController < ApplicationController

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to sign_in_path
      UserMailer.welcome_email(@user).deliver_later
  	else
  		render :new
  	end
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destory
  end

  def index
  	@user = User.all
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :date_of_birth, :avatar)
  end

end
