class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: facebook_auth['uid']) do |user|
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.image = auth['info']['image']
    end

    session[:user_id] = @user.id

    render :create
  end

  private

  def facebook_auth
    request.env['omniauth.auth']
  end
end
