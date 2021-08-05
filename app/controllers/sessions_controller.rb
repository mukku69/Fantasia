class SessionsController < ApplicationController

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    flash[:notice] = "ゲストユーザーとしてログインしました！"
    redirect_to posts_path
  end

end