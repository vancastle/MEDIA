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

  def to_french(word)
    if word.downcase == "accepted"
      return "Acceptée"
    elsif word.downcase == "pending"
      return "En attente"
    elsif word.downcase == "declined"
      return "Refusée"
    else
      return word
    end
  end
end
