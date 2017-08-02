module SubjectsHelper
  def no_sessions(subject)
    i = 0
    subject.topics.each do |topic|
      i += topic.sessions.count
    end
    
    if i == 1
      s = "once"
    elsif i == 2
      s = "twice"
    else
      s = "#{i.to_words} times"
    end
    
    return "Revised #{s}"
  end
end
