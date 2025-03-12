class LikesController < ApplicationController
  def show
    likes = LikesProducer.get_likes(params[:id])
    render json: { likes_count: likes }
  end
end
