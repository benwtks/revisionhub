module SessionsHelper
  def topic_name(session)
    "#{session.topic.subject.name.capitalize}: #{session.topic.name.capitalize}"
  end

  def session_subject_path(session)
    subject_path(session.topic.subject)
  end

  def session_link(session)
    link_to topic_name(session), session_subject_path(session)
  end

  def formatted_duration(session)
    return "#{session.duration_hours_minutes[0]} hrs, #{session.duration_hours_minutes[1]} mins"
  end
end
