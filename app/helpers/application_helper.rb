module ApplicationHelper
  def formatted_date(d)
    d.strftime("%A %e %B %Y")
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
     # duration[0] is the hours of the duration
     # duration[1] is the minutes of the duration

     if duration[0] > 0
       if duration[0] == 1
         hours = "1 hr"
       else
         hours = "#{duration[0]} hrs"
       end
     end

    if duration[1] > 0
      if duration[1] == 1
        # if there are hours and 1 minute
        minutes = "1 min"
      else
        # if there are hours and multiple minutes
        minutes = "#{duration[1]} mins"
      end
    elsif duration[1] == 0 && duration[0] <= 0
      # if there isn't any duration
      minutes = "0 mins"
    end

    if conjunctive && duration[0] > 0 && duration[1] > 0
      return "#{hours} and #{minutes}"
    elsif !conjunctive && duration[0] > 0 && duration[1] > 0
      return "#{hours}, #{minutes}"
    else
      return "#{hours} #{minutes}"
    end
  end
end
