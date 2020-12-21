class UsersController < ApplicationController
  def active_host
    current_user.active_host

    redirect_to root_path
  end
end
