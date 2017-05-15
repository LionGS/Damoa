class HomeController < ApplicationController
  def index
    @posts = Totalpost.all.sample(20)
    @post_no = 1
  end
end
