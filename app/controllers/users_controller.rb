class UsersController < ApplicationController
  def active_host
    current_user.active_host
  end
end
