class SessionsController < ApplicationController
def new
end

def create
  user = User.find_by(email: params[:session][:email].downcase)

  if user && user.authenticate(params[:session][:password])
    create_session user
    flash[:notice] = "Welcome, #{user.name}!"
    redirect_to root_path
  else
    flash[:error] = "Invalid email or password"
    render :new
  end
end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been succesfully signed out."
    redirect_to root_path
  end
end
