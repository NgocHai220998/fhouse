class UsersController < ApplicationController
  def active_host
    request_host = RequestHost.new(user_id: current_user.id, email: current_user.email, username: current_user.username)
    request_host.save

    redirect_to root_path
  end

  def pull_notification_by_recived_id
    notifications = notification_by(params[:id])

    respond_to do |format|
      format.json { render json: { notifications: notifications, count: notifications.select { |e| e.status == "none" }.size }, status: :created }
    end
  end

  def update_notification_by_id
    notification = Notification.find_by(id: params[:id])
    notification.update_attribute(:status, "seen")

    respond_to do |format|
      format.json { render json: { notification: notification }, status: :created }
    end
  end
end
