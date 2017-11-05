class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.tag_list.size > 0
      if current_user.recommend_update_date < current_user.tag_update_date
        ActiveRecord::Base.connection.execute("DELETE FROM recommend_posts where user_id=#{current_user.id}")
        recommend = Totalpost.search current_user.tag_list.join " "
        time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
        values = recommend.each.map { |post| "(#{current_user.id}, #{post.id}, #{post.popurarity}, \"#{time}\", \"#{time}\")" }.join ","
        ActiveRecord::Base.connection.execute("INSERT INTO recommend_posts (user_id,totalpost_id,point,created_at,updated_at) VALUES #{values}")
        current_user.recommend_update_date = DateTime.now
        current_user.save
      end
      @recommend_posts = RecommendPost.where(user_id: current_user).order(point: :desc).page(1).per(10)
      @recommend_posts ||= RecommendPost.none
    end
    @posts = Totalpost.all.order(popurarity: :desc).page params[:page]
  end


  def search

  end

  def recommend
    @posts = RecommendPost.where(user_id: current_user).page params[:page]
  end

  def intro

  end

  def edit_tags

  end

  def like
    @post = Totalpost.find params[:id]
    @user = current_user
    if @user.voted_for? @post
      if @user.voted_as_when_voted_for @post
        @post.unliked_by @user
      else
        @user.likes @post
      end
    else
      @user.likes @post
    end
    redirect_to :back
  end


  def dislike
    @post = Totalpost.find params[:id]
    @user = current_user
    if @user.voted_for? @post
      if @user.voted_as_when_voted_for @post
        @user.dislikes @post
      else
        @post.undisliked_by @user
      end
    else
      @user.dislikes @post
    end
    redirect_to :back
  end
end
