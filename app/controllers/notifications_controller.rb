class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.unread_by(current_user)
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.mark_as_read! for: current_user
    redirect_to @notification.link
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destory
  end

  def read_all
    current_user.notifications.mark_as_read! :all, for: current_user
    redirect_back fallback_location: root_path
  end
end
