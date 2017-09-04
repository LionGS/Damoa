class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.tag_list.size > 0
      @posts = Totalpost.search do
        fulltext current_user.tag_list
        order_by :popurarity, :desc
        paginate :page => params[:page], :per_page => 20
      end
    else
      @posts = Totalpost.search do
        order_by :popurarity, :desc
        paginate :page => params[:page], :per_page => 20
      end
    end
    @today_popular_posts = Totalpost.search do
      with(:mydate).greater_than 1.day.ago
      order_by :popurarity, :desc
      paginate :page => params[:page], :per_page => 5
    end
    @this_week_popular_posts = Totalpost.search do
      with(:mydate).greater_than 1.month.ago
      with(:mydate).less_than 1.day.ago
      order_by :popurarity, :desc
      paginate :page => params[:page], :per_page => 5
    end
  end
end
