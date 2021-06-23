class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_q, only: [:index, :search]

  def new
    @post = Post.new
  end

  def index
    rand = Rails.env.production? ?  "rand()" : "RANDOM()"
    @posts = Post.order(rand).page(params[:page]).per(30)
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
      redirect_to post_path(@post.id), notice: "You have created book successfully."
    else
      @posts = Post.all
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
    @results = @q.result
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_q
    @q = Post.ransack(params[:q])
  end

end
