module SessionsHelper
  def session_subject_path(session)
    subject_path(session.subject)
  end

  def session_date(session)
    session.date.strftime("%e %B, %Y")
  end

  def session_link(session)
    link_to session.name, session_subject_path(session)
  end
end
