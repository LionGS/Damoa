class TotalpostController < ApplicationController
  def show
    @post = Totalpost.find params[:totalpost_id]
    if signed_in?
      @history = History.where(user_id: current_user.id)
      unless @history.empty? || @history.where(totalpost_id: @post.post_no).empty?
        if @history.where(totalpost_id: @post.post_no).first.totalpost_id != @post.post_no
          History.create user: current_user, totalpost: @post
        end
      else
        History.create user: current_user, totalpost: @post
      end
    end

    @link = @post.link

    @scrap = ScrapedPost.where(user_id: current_user,totalpost_id: @post).page params[:page]

  end

end
