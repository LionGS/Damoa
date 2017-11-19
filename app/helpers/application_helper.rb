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
      image_tag post.image_src, onERROR: "this.src='" + image_path(error_img) + "'"
    end

  end

  def source_convert(source)
    case source
      when "ruli" then "루리웹"
      when "dcinside" then "디씨인사이드"
      when "humoruniv" then "웃긴대학"
      when "clien" then "클리앙"
      when "bobaedream" then "보배드림"
      when "gameshot" then "게임샷"
      when "thisisgame" then "디스이즈게임"
      when "ygosu"then "와이고수"
      when "82cook" then "82쿡"
      when "fmkorea" then "에프엠코리아"
      when "quasarzone" then "퀘이사존"
      else "기타"
    end
  end
end
