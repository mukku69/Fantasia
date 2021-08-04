class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_q, only: [:index, :search]
  before_action :correct_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    rand = Rails.env.production? ?  "rand()" : "RANDOM()"
    @posts = Post.order(rand).page(params[:page]).per(30)
    @ranking = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿を作成しました！"
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def search
    @results = @q.result.order("id DESC").page(params[:page]).per(30)
  end

  def comments
    @post = Post.find(params[:id])
    @posts = @post.followings
  end

private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id)
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

  def correct_post
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end

end
