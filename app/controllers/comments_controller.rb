class CommentsController < ApplicationController
before_action :set_definition, only: %i[create destroy]
before_action :set_comment, only: %i[destroy]
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.definition_id = @definition.id
    if @comment.save
      redirect_to definition_path(@definition)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    redirect_to definition_path(@definition)
  end

  private

  def set_definition
    @definition = Definition.find(params[:definition_id])
  end

  def set_comment
    @comment = @definition.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
