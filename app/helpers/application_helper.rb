module ApplicationHelper
  def formatted_date(d)
    d.date.strftime("%e %B, %Y")
  end

  def nat_lang(n)
    if n == 1
      return "once"
    elsif n ==2
      return "twice"
    else
      return "#{n.to_words} times"
    end
  end

   def inline_svg(path)
     raw Rails.application.assets.find_asset(path + '.svg').to_s
   end

   def formatted_duration(duration, conjunctive=false)
    if duration[0] > 0
      if duration[0] == 1
        hours = "1 hr"
      else
        hours = "#{duration[0]} hrs"
      end
    end
    
    if duration[1] > 0
      if duration[1] == 1
        minutes = "1 min"
      else
        minutes = "#{duration[1]} mins"
      end
    end

    if conjunctive
      return "#{hours} and #{minutes}"
    else
      return "#{hours}, #{minutes}"
    end
  end
end
