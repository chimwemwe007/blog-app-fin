class CommentsController < ApplicationController
  before_action :set_user_and_post

  def index
    @comments = @post.comments
  end

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
