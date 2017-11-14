require 'net/http'
require 'addressable/uri'
module ApplicationHelper
  def post_img(post)
    error_img = case post.source
                  when "ruli" then "ruli.png"
                  when "dcinside" then "dcinside.png"
                  when "humoruniv" then "humoruniv.png"
                  when "clien" then "clien.png"
                  when "bobaedream" then "bobaedream.jpg"
                  when "gameshot" then "gameshot.png"
                  when "thisisgame" then "thisisgame.jpg"
                  when "ygosu"then "ygosu.png"
                  else "etc.gif"
                end
    if post.image_src.nil?
      image_tag error_img
    else
      image_tag post.image_src, onerror: 'this.src=' + error_img
    end

  end
end
