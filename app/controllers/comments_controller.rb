include ActionView::Helpers::DateHelper

class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    comment = Comment.new house_params
    user = User.find house_params[:user_id]
    respond_to do |format|
      if comment.save
        format.json { render json: { comment: comment, username: user.username, time: "#{time_ago_in_words(comment.created_at)} ago" }, status: :created }
      else
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def house_params
    params.require(:data).permit(:user_id, :house_id, :star, :content)
  end
end
