class HomeController < ApplicationController
  def index
    @posts = Totalpost.where("popurarity >= 3").sample(20)
    @post_no = 1
  end
end
