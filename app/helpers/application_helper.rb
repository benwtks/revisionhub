module ApplicationHelper
  def render_tag(tag)
    content_tag(:span, tag.name, class: ["tag", "#{tag.tagColour.colour.camelize(:lower)}"])
  end
end
