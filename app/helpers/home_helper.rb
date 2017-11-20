module HomeHelper
  def score_to_star(total_score)
    result = ""
    star = "<i class='fa fa-star text-warning' aria-hidden='true'></i>"
    if total_score > 50
      for i in 1..5
        result << star
      end
    elsif total_score > 40
      for i in 1..4
        result << star
      end
    elsif total_score > 30
      for i in 1..3
        result << star
      end
    elsif total_score > 20
      for i in 1..2
        result << star
      end
    elsif total_score > 10
      for i in 1..1
        result << star
      end
    else

    end
    result.html_safe
  end

  def source_img(source)
    img = case source
            when "ruli" then "ruli.png"
            when "dcinside" then "dcinside.png"
            when "humoruniv" then "humoruniv.png"
            when "clien" then "clien.png"
            when "bobaedream" then "bobaedream.jpg"
            when "gameshot" then "gameshot.png"
            when "thisisgame" then "thisisgame.jpg"
            when "ygosu"then "ygosu.gif"
            when "fmkorea" then "fmko.png"
            when "82cook" then "82cook.png"
              when "quasarzone" then "qsz.png"
            else "etc.gif"
          end
    image_tag img,class: "img-thumbnail",style: "max-height:50px;"
  end
end
