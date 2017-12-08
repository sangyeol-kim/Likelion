class HomeController < ApplicationController
  
  def index
    @bulletins = Bulletin.all
    @allposts = Post.order("created_at DESC").first 5
    @topViewPosts = Post.all.sort {|post| post.impression_count}
    @topLikePosts = Post.all.sort {|post| post.goods.size}
  end
end
