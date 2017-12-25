module SubjectsHelper
  def sessions_duration(subject)
    return subject.session_duration_total('week')
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
    return student.session_duration_total(range="week")
  end
end
