class GoodsController < ApplicationController
    
    #좋아요 액션, redirect 부분은 :back이 안되서(why..?) params로 보냄
    def good_toggle
        good=Good.find_by(user_id: current_user.id,
                          post_id: params[:post_id])
                          
        if good.nil?
            Good.create(user_id: current_user.id,
                        post_id: params[:post_id])
                            
            else
                good.destroy
        end
            
       redirect_to "/bulletins/#{params[:bulletin_id]}/posts/#{params[:post_id]}"
    end
    
end
