class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create]
  
  #POST /login    if username and password are authenticated, save user_id as session hash
  def create 
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :created 
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  def destroy   #delete :user_id from session hash
    session.delete :user_id
    head :no_content
  end

end
