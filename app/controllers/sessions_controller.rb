class SessionsController < ApplicationController

  #before_filter :authenticate_user!
  def new
  end

  def create
  user = User.find_by_email(params[:session][:email].downcase)
    puts params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      flash[:success] = 'Happy Tweeting !'
      redirect_to user_path(user)
    else
      flash[:failure] = 'Invalid email/password' # Not quite right!
      render 'new'
    end
  end

  def destroy
  	redirect_to pages_home_path
  end

end	