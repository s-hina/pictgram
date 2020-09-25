class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: "コメントしました"
    else
      flash.now[:danger] = "コメントできませんでした"
      render :new
    end
  end

  #ストロングパラメータ
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end
end
