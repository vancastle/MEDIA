module ApplicationHelper
  def calculate_age(birthdate)
    Date.today.year - birthdate.year
  end
end
