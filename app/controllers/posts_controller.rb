class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts_count = Post.count
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(params.require(:post).permit(:title, :startdate, :enddate, :mark, :memo))
    if @post.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :posts
    else
      render "new"
    end
  end
 
  def show
    @post = Post.find(params[:id])
  end
 
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :startdate, :enddate, :mark, :memo))
      flash[:notice] = "予定を編集しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :posts
  end
end
