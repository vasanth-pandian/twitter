class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
    render new_micropost_path
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.content != nil && @micropost.content != ''
      if @micropost.save  
        flash[:success] = "Posted Succesfully!"
      else
        flash[:failure] = "Unable to post. Please try again!"
      end
    else
      flash[:failure] = "Please share what's in your mind !!!"
    end
    redirect_to user_path(@micropost.user_id)
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    if @micropost.update(micropost_params)
      flash[:success] = "Post Updated"
    else
      flash[:failure] = "Unable to update post. Please try again!"
    end
    redirect_to user_path(@micropost.user_id)
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    if @micropost.destroy
      flash[:success] = "Post Removed"
    else
      flash[:failure] = "Unable to remove post. Please try again!"
    end
    redirect_to user_path(@micropost.user_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
