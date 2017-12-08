module ApplicationHelper
    
    def online_status(user)
        content_tag :span, user.name,
            class: "user-#{user.id} online_status #{'online' if user.online?}"
    end
end

