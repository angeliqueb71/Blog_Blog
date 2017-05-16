class PostsController < ApplicationController

  def index
   @posts = Post.all.order('created_at DESC')
  end
 # creates id
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
# creates the post
  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to user_path(session[:user_id])
    else
     render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(session[:user_id])
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:content,:title)
    end

end
