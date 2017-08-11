module SessionsHelper
  def session_name(session)
    "#{session.topic.subject.name.capitalize}: #{session.topic.name.capitalize}"
  end

  def session_subject_path(session)
    subject_path(session.topic.subject)
  end

  def session_date(session)
    session.date.strftime("%e %B, %Y")
  end

  def session_link(session)
    link_to session_name(session), session_subject_path(session)
  end
end
