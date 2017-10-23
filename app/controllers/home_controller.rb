class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.tag_list.size > 0
      if current_user.recommend_update_date < current_user.tag_update_date
        ActiveRecord::Base.connection.execute("DELETE FROM recommend_posts where user_id=#{current_user.id}")
        recommend = Totalpost.search do
          fulltext current_user.tag_list.to_s.delete "," do
            minimum_match 1
          end
          order_by :popurarity, :desc
        end
        time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
        values = recommend.each_hit_with_result.map { |hit,post| "(#{current_user.id}, #{post.id}, #{hit.score * post.popurarity}, \"#{time}\", \"#{time}\")" }.join ","
        # recommend.each_hit_with_result do |hit,post|
        #   RecommendPost.create user: current_user, totalpost: post, point: hit.score * post.popurarity
        # end
        ActiveRecord::Base.connection.execute("INSERT INTO recommend_posts (user_id,totalpost_id,point,created_at,updated_at) VALUES #{values}")
        current_user.recommend_update_date = DateTime.now
        current_user.save
      end
      @recommend_posts = RecommendPost.where(user_id: current_user).order(point: :desc).page(1).per(10)
      @recommend_posts ||= RecommendPost.none
    end
    @posts = Totalpost.search do
      order_by :popurarity, :desc
      paginate :page => params[:page], :per_page => 30
    end
    @today_popular_posts = Totalpost.search do
      with(:mydate).greater_than 1.day.ago
      order_by :popurarity, :desc
      paginate :page => 1, :per_page => 5
    end
    @this_week_popular_posts = Totalpost.search do
      with(:mydate).greater_than 1.week.ago
      with(:mydate).less_than 1.day.ago
      order_by :popurarity, :desc
      paginate :page => 1, :per_page => 5
    end
  end

  def data_input

  end

  def search
    q = params[:q]
    @q = q

    unless q.blank?
      @results = Totalpost.search do
        fulltext q do
          minimum_match 1
        end
        order_by :popurarity, :desc
        paginate :page => params[:page], :per_page => 30
      end
    end
  end

  def show

  end
end
