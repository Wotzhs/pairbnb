class UsersController < ApplicationController

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to controller: 'users'
  	else
  		redirect_to 'new'
  	end
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def update
  end

  def show
  end

  def destory
  end

  def index
  	@user = User.all
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :date_of_birth)
  end

end
