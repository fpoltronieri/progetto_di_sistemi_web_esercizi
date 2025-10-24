class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.new(comment_params)
    if comment.save
      redirect_to @post, notice: "Comment was successfully created."
    else
      redirect_to posts_path, alert: "Failed to create comment."
    end

  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params 
    params.require(:comment).permit(:content)
  end
end
