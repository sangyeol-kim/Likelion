class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def search
      @users = User.search(params[:q]).records
      render action: "index"
    end
    
    def index
        @users = User.all.where.not(id: current_user)
        @users = User.order("created_at DESC").page params[:page]
    end
end
