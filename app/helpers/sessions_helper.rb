module SessionsHelper
  def session_subject_path(session)
    subject_path(session.topic.subject)
  end
end
