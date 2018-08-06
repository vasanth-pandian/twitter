class UsersController < ApplicationController

  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      @micropost = Micropost.new
      @micropost.user_id = @user.id
      render 'show'
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Updated Succesfully!"
      redirect_to user_path
    else
      flash[:failure] = "Update Failed!"
      redirect_to edit_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 5)
    @micropost = Micropost.new
    @micropost.user_id = @user.id
    puts "USER ID ON LOAN {@micropost.user_id}"
    puts @micropost.user_id
  end

  private 
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

  end