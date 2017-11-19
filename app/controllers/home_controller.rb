class HomeController < ApplicationController
  before_action :post_recommend
  def index
    @posts = Totalpost.where("mydate >= ?",7.days.ago).order(popurarity: :desc, recommened: :desc).page params[:page]
  end


  def search
    @results = Totalpost.search(params[:q]).page params[:page]
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
    @post.save
    redirect_back(fallback_location: root_path)
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
    @post.save
    redirect_back(fallback_location: root_path)
  end

  def scrap
    @scrap = ScrapedPost.where user_id: current_user.id, totalpost_id: params[:id]

    if @scrap.empty?
      ScrapedPost.create user_id: current_user.id, totalpost_id: params[:id]
    else
      @scrap.destroy @scrap.ids[0]
    end
    redirect_back(fallback_location: root_path)
  end

  def scrap_index
    @posts = ScrapedPost.where(user_id: current_user.id).page params[:page]
  end

  def new_posts
    @posts = Totalpost.all.order(mydate: :desc).page params[:page]
  end

  private

  def post_recommend
    if user_signed_in? && current_user.tag_list.size > 0
      unless current_user.recommend_update_date.nil?
        if current_user.recommend_update_date < current_user.tag_update_date
          ActiveRecord::Base.connection.execute("DELETE FROM recommend_posts where user_id=#{current_user.id}")
          recommend = Totalpost.search(current_user.tag_list.join " OR ").order(popurarity: :desc, recommened: :desc).limit 1000
          if recommend.size > 0
            time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
            values = recommend.each.map { |post| "(#{current_user.id}, #{post.id}, #{post.popurarity}, \"#{time}\", \"#{time}\")" }.join ","
            ActiveRecord::Base.connection.execute("INSERT INTO recommend_posts (user_id,totalpost_id,point,created_at,updated_at) VALUES #{values}")
          end
          current_user.recommend_update_date = DateTime.now
          current_user.save
        end
      else
        ActiveRecord::Base.connection.execute("DELETE FROM recommend_posts where user_id=#{current_user.id}")
        recommend = Totalpost.search(current_user.tag_list.join " OR ").order(popurarity: :desc, recommened: :desc).limit 1000
        if recommend.size > 0
          time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
          values = recommend.each.map { |post| "(#{current_user.id}, #{post.id}, #{post.popurarity}, \"#{time}\", \"#{time}\")" }.join ","
          ActiveRecord::Base.connection.execute("INSERT INTO recommend_posts (user_id,totalpost_id,point,created_at,updated_at) VALUES #{values}")
        end
        current_user.recommend_update_date = DateTime.now
        current_user.save
      end
    end
  end
end
