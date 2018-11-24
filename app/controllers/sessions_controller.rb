class SessionsController < ApplicationController
  def create
    binding.pry
    @user = User.find_or_create_by(uid: facebook_auth['uid']) do |user|
      user.name = facebook_auth['info']['name']
      user.email = facebook_auth['info']['email']
      user.image = facebook_auth['info']['image']
    end

    session[:user_id] = @user.id

    render :create
  end

  private

  def facebook_auth
    request.env['omniauth.auth']
  end
end
