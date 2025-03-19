module ApplicationHelper
  def calculate_age(birthdate)
    Date.today.year - birthdate.year
  end

  def color_badge_for_status(assignation)
    case assignation.status.downcase
    when 'accepted'
      return 'badge-success'
    when 'declined'
      return 'badge-danger'
    when 'pending'
      return 'badge-warning'
    end
  end

  def border_badge_for_status(assignation)
    case assignation.status.downcase
    when 'accepted'
      return 'card-success'
    when 'declined'
      return 'card-danger'
    when 'pending'
      return 'card-warning'
    end
  end

end
