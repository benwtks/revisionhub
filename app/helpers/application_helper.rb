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

   def formatted_duration(session)
    if session.duration_hours > 0
      if session.duration_hours == 1
        hours = "1 hr, "
      else
        hours = "#{session.duration_hours} hrs, "
      end
    end

    if session.duration_minutes == 1
      minutes = "1 min"
    else
      minutes = "#{session.duration_minutes} mins"
    end

    return "#{hours}#{minutes}"
  end
end
