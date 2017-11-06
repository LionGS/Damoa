class TotalpostController < ApplicationController
  def show
    @post = Totalpost.find params[:totalpost_id]
    if signed_in?
      History.create user: current_user, totalpost: @post
    end

    @link = @post.link

    @scrap = ScrapedPost.where user_id: current_user,totalpost_id: @post

  end

end
