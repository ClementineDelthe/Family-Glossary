class LikesController < ApplicationController

def create
  @like = current_user.likes.create(like_params)
  respond_to do |format|
    format.html { redirect_to :back }
    format.turbo_stream
  end
end

def destroy
  raise
  @like = Like.find(params[:id])
  @like.destroy
  respond_to do |format|
    format.html { redirect_to :back }
    format.turbo_stream
  end
end

private

def like_params
  params.require(:like).permit(:likeable_id, :likeable_type)
end

end
