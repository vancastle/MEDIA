module ApplicationHelper
  def calculate_age(birthdate)
    Date.today.year - birthdate.year
  end

  def status_class(assignation)
    case assignation.status.downcase
    when 'accepted'
      return 'badge-success'
    when 'declined'
      return 'badge-danger'
    when 'pending'
      return 'badge-warning'
    end
  end
end
