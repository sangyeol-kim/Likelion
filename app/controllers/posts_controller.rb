class PostsController < ApplicationController
  before_action :log_impression, :only=> [:show]
  before_action :set_bulletin
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # 조회수 기록
  def log_impression
    @hit_post = Post.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end

  def index
    @bulletin = Bulletin.find(params[:bulletin_id])
    @posts = Post.where(bulletin_id: @bulletin).order("created_at DESC").page params[:page]
  end

  def show
    @bulletin = Bulletin.find(params[:bulletin_id])
    @comments = @post.comments.page params[:page]
    #@pre = Post.find(params[:id - 1])
    #@next = Post.find([:id + 1])
  end

  def new
    @bulletin = Bulletin.find(params[:bulletin_id])
    @post = @bulletin.present? ? @bulletin.posts.new : Post.new
  end

  def edit
    @bulletin = Bulletin.find(params[:bulletin_id])
  end

  def create
    @bulletin = Bulletin.find(params[:bulletin_id])
    @post = @bulletin.present? ? @bulletin.posts.new(post_params) : Post.new(post_params)
    @post.num = 2
    @post.user_name = current_user.nickname
    @post.description = current_user.description
    @post.description_permission = current_user.description_permission

    respond_to do |format|
      if @post.save
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: '게시글이 성공적으로 작성되었습니다.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: '게시글이 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to (@bulletin.present? ? bulletin_posts_url : posts_url), notice: '게시글이 성공적으로 제거되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
  def set_bulletin
    @bulletin = Bulletin.find(params[:bulletin_id]) if params[:bulletin_id].present?
  end

  def set_post
    if @bulletin.present?
      @post = @bulletin.posts.find(params[:id])
    else
      @post = Post.find(params[:id])
    end
  end

  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :content, :user_id) 
  end
end