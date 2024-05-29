class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if comment != ''
      redirect_to "/prototypes/#{comment.prototype.id}"
    else
      render 'protoypes/show.html.erb', status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
