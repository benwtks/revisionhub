module ApplicationHelper
  def render_tag(tag)
    content_tag(:span, tag.name, class: ["tag", "#{tag.colour}"])
  end

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
