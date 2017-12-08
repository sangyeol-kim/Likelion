class MembersController < ApplicationController
    def show
        @users = User.all.where.not(id: current_user)
    end
    
end
