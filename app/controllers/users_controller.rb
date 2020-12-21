class UsersController < ApplicationController
  def active_host
    request_host = RequestHost.new(user_id: current_user.id, email: current_user.email, username: current_user.username)
    request_host.save

    redirect_to root_path
  end
end
