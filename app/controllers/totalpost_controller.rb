class TotalpostController < ApplicationController
  def show
    post = Totalpost.find params[:totalpost_id]
    if signed_in?
      History.create user: current_user, totalpost: post
    end

    @link = post.link
  end

  def data_input
  end
end
