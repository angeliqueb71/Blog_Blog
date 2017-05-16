class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @posts = Post.all
  end

  def new
    @comment = Comment.new(post_id: params[:post_id], user_id: session[:user_id])
    @post = Post.new
  end

  def create
    user = User.find(session[:user_id])

    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    puts @post
    if @comment.save
      flash[:notice] = "Comment successfully added"
      user.comments < @comment
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error posting comment"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    if @comment.destroy
      flash[:notice] = "Comment deleted"
      redirect_to post_path(@post)
    else
      flash[:alert] = "There was an issue deleting comment"
      redirect_to post_path(@post)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :title)
    end
end
