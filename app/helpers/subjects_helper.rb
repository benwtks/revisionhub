module SubjectsHelper
  def no_sessions(subject)
    return "Revised #{nat_lang(subject.no_sessions('week'))} this week"
  end

  def time_of_day
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i

    if midnight.upto(noon).include?(current_time)
      return "morning"
    elsif noon.upto(five_pm).include?(current_time)
      return "afternoon"
    elsif five_pm.upto(midnight + 1.day).include?(current_time)
      return "evening"
    end
  end

  def greeting(name)
    return "Good #{time_of_day}, #{name}"
  end

  def statistic(student)
    return "You've revised #{nat_lang(student.no_sessions('week'))} this week"
  end
end
