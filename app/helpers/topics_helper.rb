module TopicsHelper
  def name_lowercase(subject)
    subject.name.camelize(:lower)
  end

  def new_topic_heading(subject)
    "New #{name_lowercase(subject)} topic"
  end
end
