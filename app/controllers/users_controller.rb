class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]

  #POST /signup   2 actions; signup to db & set session hash to user_id
  def create 
    user = User.create!(user_params)    #this creates db entry
    if user.valid?
      session[:user_id] = user.id   #this logs them in, cookie is placed in browser throughout session
      render json: user, status: :created     
    end
  end

  #GET /me    keeps the user logged in, even after a reload or nav to another page
  def show
    user = User.find_by(id: session[:user_id])  #if user id matches session hash [:user_id]
    if user
      render json: user, status: :created
    else
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end
  
  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :image_url, :bio)   #add password here for a POST to db
  end
end
