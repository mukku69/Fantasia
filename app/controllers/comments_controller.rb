class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		@new_comment = Comment.new
  end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.post_id = @post.id
		@comment.user_id = current_user.id
		if @comment.save
  		redirect_to post_comments_path(@post.id)
		else
			@comments = @post.comments
			@new_comment = Comment.new
		  render 'index'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end

end