class HomeController < ApplicationController
  def index
    # @posts = Totalpost.order("popurarity DESC").limit(20)

    if user_signed_in?
      @posts = Array.new
      current_user.tag_list.each do |tag|
        Totalpost.where(["title LIKE ?", "%#{tag}%"]).each do |post|
          @posts.push(post)
        end
        Totalpost.where(["posttext LIKE ?", "%#{tag}%"]).each do |post|
          @posts.push(post)
        end
      end
      @posts.sort_by! {|post| post.popurarity}.reverse!
      @posts = @posts.first(20)
    else
      @posts = Totalpost.order("popurarity DESC").limit(20)
    end

    @post_no = 1
  end
end
