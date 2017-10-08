class HomeController < ApplicationController
  def index
    if user_signed_in? && current_user.tag_list.size > 0
      @posts = Totalpost.search do
        fulltext current_user.tag_list.to_s.delete "," do
          minimum_match 1
        end
        order_by :popurarity, :desc
        paginate :page => params[:page], :per_page => 30
      end
    else
      @posts = Totalpost.search do
        order_by :popurarity, :desc
        paginate :page => params[:page], :per_page => 30
      end
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
end
