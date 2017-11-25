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
end
