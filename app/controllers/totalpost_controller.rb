class TotalpostController < ApplicationController
  def show
    post = Totalpost.find params[:totalpost_id]
    History.create user: current_user, totalpost: post

    redirect_to post.link
  end

  def data_input
  end
end
