require 'net/http'
module ApplicationHelper
  def post_img(post)
    res = Net::HTTP.get URI(post.image_src)
    if post.image_src.nil? || res != '200'
      img = case post.source
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

    else
      img = post.image_src
    end
    image_tag img
  end
end
