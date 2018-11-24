class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(uid: facebook_auth['uid']) do |u|

    end
  end

  private

  def facebook_auth
    request.env['omniauth.auth']
  end
end
