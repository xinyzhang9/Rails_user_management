class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.create(user_params)
  	if @user.errors.any?
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/users/new'
  	else
  		redirect_to '/users/index'
  	end

  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(first_name: params[:first_name])
  	@user.update(last_name: params[:last_name])
  	@user.update(email_address: params[:email_address])

  	redirect_to '/users/index'
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to '/'
  end
  private
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email_address,:password)
  end

end
