class BulletinsController < ApplicationController
  before_action :log_impression, :only=> [:show]
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_bulletin, only: [:show, :edit, :update, :destroy]
  
  # 조회수 기록
  def log_impression
    @hit_post = Bulletin.find(params[:id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end

  def search
    @bulletins = Bulletin.search(params[:q]).records
    render action: "index"
  end

  # GET /bulletins
  # GET /bulletins.json
  def index
    @bulletins = Bulletin.order("created_at DESC").page params[:page]
  end

  # GET /bulletins/1
  # GET /bulletins/1.json
  def show
  end

  # GET /bulletins/new
  def new
    @bulletin = Bulletin.new
  end

  # GET /bulletins/1/edit
  def edit
  end

  # POST /bulletins
  # POST /bulletins.json
  def create
    @bulletin = Bulletin.new(bulletin_params)
    
    @bulletin.user_name = current_user.nickname
    @bulletin.description = current_user.description
    @bulletin.description_permission = current_user.description_permission

    respond_to do |format|
      if @bulletin.save
        format.html { redirect_to @bulletin, notice: '카테고리가 성공적으로 등록되었습니다.' }
        format.json { render :show, status: :created, location: @bulletin }
      else
        format.html { render :new }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulletins/1
  # PATCH/PUT /bulletins/1.json
  def update
    respond_to do |format|
      if @bulletin.update(bulletin_params)
        format.html { redirect_to @bulletin, notice: '카테고리가 성공적으로 수정되었습니다.' }
        format.json { render :show, status: :ok, location: @bulletin }
      else
        format.html { render :edit }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulletins/1
  # DELETE /bulletins/1.json
  def destroy
    @bulletin.destroy
    respond_to do |format|
      format.html { redirect_to bulletins_url, notice: '카테고리가 성공적으로 제거되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      @bulletin = Bulletin.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def bulletin_params
      params[:bulletin][:user_id] = current_user.id
      params.require(:bulletin).permit(:title, :content, :user_id) 
    end
end
