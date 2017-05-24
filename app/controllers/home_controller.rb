class HomeController < ApplicationController
  def index
    @posts = Totalpost.order("popurarity DESC").limit(20)
    @post_no = 1
  end
end
