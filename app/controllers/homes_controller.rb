class HomesController < ApplicationController

  def top
    @ranking = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

end
