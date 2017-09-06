module HomeHelper
  def score_to_star(hit_score,popularity)
    total_score = hit_score * popularity
    result = ""
    if total_score > 50
      for i in 0..5
        result << "<i class='fa fa-star' aria-hidden='true'></i>"
      end
    elsif total_score > 40
      for i in 0..4
        result << "<i class='fa fa-star' aria-hidden='true'></i>"
      end
    elsif total_score > 30
      for i in 0..3
        result << "<i class='fa fa-star' aria-hidden='true'></i>"
      end
    elsif total_score > 20
      for i in 0..2
        result << "<i class='fa fa-star' aria-hidden='true'></i>"
      end
    elsif total_score > 10
      for i in 0..1
        result << "<i class='fa fa-star' aria-hidden='true'></i>"
      end
    else
      result << "<i class='fa fa-star' aria-hidden='true'></i>"
    end
    result.html_safe
  end
end
