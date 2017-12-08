class LinksController < ApplicationController
  before_action :log_impression, :only=> [:show]
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  # 조회수 기록
  def log_impression
    @hit_post = Link.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
    @links = Link.order("created_at DESC").page params[:page]
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @vote_comments = @link.vote_comments.page params[:page]
  end

  # GET /links/new
  def new
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.build(link_params)
    
    @link.num = 2
    @link.user_name = current_user.nickname
    @link.description = current_user.description
    @link.description_permission = current_user.description_permission

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: '투표안건이 성공적으로 작성되었습니다.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: '투표안건이 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: '투표안건이 성공적으로 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    def authorized_user
      @link = current_user.links.find_by(id: params[:id])
      redirect_to links_path, notice: "안건 수정에 허가되지 않았습니다." if @link.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end
end