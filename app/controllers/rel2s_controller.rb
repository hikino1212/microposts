class Rel2sController < ApplicationController
  def create
    micropost = Micropost.find(params[:follow2_id])
    current_micropost.follow(micropost)
    flash[:success] = 'マイクロポストをフォローしました。'
    redirect_to micropost
  end

  def destroy
    micropost = Micropost.find(params[:follow2_id])
    current_micropost.unfollow(micropost)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to micropost
  end
end
