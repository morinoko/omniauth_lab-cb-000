class SessionsController < ApplicationController
  def create
    @auth = facebook_auth
    
    @user = User.find_or_create_by(uid: @auth['uid']) do |user|
      user.name = @auth['info']['name']
      user.email = @auth['info']['email']
      user.image = @auth['info']['image']
    end

    session[:user_id] = @user.id

    render :create
  end

  private

  def facebook_auth
    request.env['omniauth.auth']
  end
end
