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
