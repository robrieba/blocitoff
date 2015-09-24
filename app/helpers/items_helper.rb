module ItemsHelper

  def calculate_days_left(item)
      distance_of_time_in_words(item.created_at + 7.days, Time.now)
  end

end
