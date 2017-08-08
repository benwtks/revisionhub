module SubjectsHelper
  def no_sessions(subject)
    return "Revised #{nat_lang(subject.session_count)}"
  end
end
